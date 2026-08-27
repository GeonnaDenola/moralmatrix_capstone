<?php
// /MoralMatrix/ccdu/gmrc_log_issue.php
if (session_status() !== PHP_SESSION_ACTIVE) session_start();
require __DIR__ . '/../config.php';

header('Content-Type: application/json');

// DEBUG: log raw POST + role
file_put_contents(
    __DIR__ . '/gmrc_debug.log',
    date('c') . ' ROLE=' . ($_SESSION['account_type'] ?? 'none') .
    ' POST=' . json_encode($_POST) . PHP_EOL,
    FILE_APPEND
);

// CCDU only
$role = strtolower($_SESSION['account_type'] ?? '');
if ($role !== 'ccdu') {
    http_response_code(403);
    echo json_encode(['ok' => false, 'error' => 'Forbidden (role)']);
    exit;
}

// Read POST data from FormData
$student_id     = trim($_POST['student_id'] ?? '');
$requestor_name = trim($_POST['requestor_name'] ?? '');
$purpose        = trim($_POST['purpose'] ?? '');
$from_semester  = trim($_POST['from_semester'] ?? '');
$from_ay        = trim($_POST['from_ay'] ?? '');
$to_semester    = trim($_POST['to_semester'] ?? '');
$to_ay          = trim($_POST['to_ay'] ?? '');
$issue_month    = trim($_POST['issue_month'] ?? '');
$issue_day      = (int)($_POST['issue_day'] ?? 0);
$issue_year     = (int)($_POST['issue_year'] ?? 0);

if ($student_id === '') {
    http_response_code(400);
    echo json_encode(['ok' => false, 'error' => 'Missing student_id']);
    exit;
}

// Build issue_date from month name/day/year
$issue_date = null;
if ($issue_month !== '' && $issue_day > 0 && $issue_year > 0) {
    $monthNum = date('m', strtotime($issue_month . ' 1'));
    $issue_date = sprintf('%04d-%02d-%02d', $issue_year, $monthNum, $issue_day);
}

// Who issued (adjust to match your session keys if needed)
$issued_by = $_SESSION['username'] 
    ?? ($_SESSION['account_email'] 
    ?? ($_SESSION['user_id'] 
    ?? 'ccdu'));

$conn = new mysqli(
    $database_settings['servername'],
    $database_settings['username'],
    $database_settings['password'],
    $database_settings['dbname']
);
if ($conn->connect_error) {
    http_response_code(500);
    echo json_encode(['ok' => false, 'error' => 'DB connect failed']);
    exit;
}

$sql = "INSERT INTO gmrc_certificate_logs
        (student_id, requestor_name, purpose,
         from_semester, from_ay, to_semester, to_ay,
         issue_date, issued_by)
        VALUES (?,?,?,?,?,?,?,?,?)";

$stmt = $conn->prepare($sql);
if (!$stmt) {
    http_response_code(500);
    echo json_encode(['ok' => false, 'error' => 'Prepare failed']);
    exit;
}

$stmt->bind_param(
    "sssssssss",
    $student_id,
    $requestor_name,
    $purpose,
    $from_semester,
    $from_ay,
    $to_semester,
    $to_ay,
    $issue_date,
    $issued_by
);

$ok = $stmt->execute();
if (!$ok) {
    http_response_code(500);
    echo json_encode(['ok' => false, 'error' => 'Insert failed: '.$stmt->error]);
    $stmt->close();
    $conn->close();
    exit;
}

$stmt->close();
$conn->close();

echo json_encode(['ok' => true]);
