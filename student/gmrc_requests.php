<?php
// student/gmrc_requests.php
ob_start();
session_start();

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

require_once __DIR__ . '/../config.php';
require_once __DIR__ . '/../auth.php';

require_role('student');

$servername = $database_settings['servername'] ?? 'localhost';
$username   = $database_settings['username']  ?? 'root';
$password   = $database_settings['password']  ?? '';
$dbname     = $database_settings['dbname']    ?? 'moralmatrix';

$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die('Connection failed: ' . $conn->connect_error);
}

// If your header uses $conn, include it here
include '../includes/student_header.php';

if (!function_exists('h')) {
    function h(?string $value): string {
        return htmlspecialchars((string)$value, ENT_QUOTES | ENT_SUBSTITUTE, 'UTF-8');
    }
}

$studentId = $_SESSION['student_id'] ?? null;
if (!$studentId) {
    die('Missing student ID in session.');
}

// Get all GMRC requests for this student
$requests = [];
$sql = "
    SELECT id,
           status,
           schedule_at,
           student_reason,
           created_at,
           ccdu_remarks
    FROM gmrc_requests
    WHERE student_id = ?
    ORDER BY created_at DESC
";

if ($stmt = $conn->prepare($sql)) {
    $stmt->bind_param('s', $studentId);
    $stmt->execute();
    $result = $stmt->get_result();
    while ($row = $result->fetch_assoc()) {
        $requests[] = $row;
    }
    $stmt->close();
}
?>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>My GMRC Requests</title>
    <style>
        body {
            font-family: system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif;
            background: #f5f5f5;
            margin: 0;
            padding: 20px;
        }
        .gmrc-list-container {
            max-width: 900px;
            margin: 60px auto 0;
            background: #ffffff;
            padding: 20px 24px;
            border-radius: 8px;
            box-shadow: 0 3px 10px rgba(0,0,0,0.08);
        }
        h1 {
            margin-top: 0;
            font-size: 22px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            font-size: 14px;
        }
        th, td {
            padding: 8px 6px;
            border-bottom: 1px solid #e0e0e0;
            text-align: left;
            vertical-align: top;
        }
        th {
            background: #f8f8f8;
            font-weight: 600;
        }
        .status-badge {
            display: inline-block;
            padding: 2px 8px;
            border-radius: 999px;
            font-size: 12px;
            font-weight: 600;
        }
        .status-PENDING {
            background: #fff3cd;
            color: #856404;
        }
        .status-APPROVED,
        .status-SCHEDULED {
            background: #d4edda;
            color: #155724;
        }
        .status-REJECTED {
            background: #f8d7da;
            color: #721c24;
        }
        .status-COMPLETED {
            background: #cce5ff;
            color: #004085;
        }
        .small-text {
            font-size: 12px;
            color: #666;
        }
        .request-btn {
        display: inline-block;
        padding: 8px 16px;
        background: #0069d9;
        color: #fff;
        border-radius: 4px;
        text-decoration: none;
        font-size: 14px;
        margin-bottom: 12px;
        }
        .request-btn:hover {
            background: #0053ad;
        }

    </style>
</head>
<body>

<div class="gmrc-list-container">
    <h1>My GMRC Requests</h1>

    <p class="small-text">
        Here you can see the status of all GMRC requests you have submitted.
    </p>

    <a class="request-btn" href="gmrc_request.php">Request GMRC Certificate</a>

    <?php if (empty($requests)): ?>
        <p>You have not submitted any GMRC requests yet.</p>
    <?php else: ?>
        <table>
            <thead>
            <tr>
                <th>#</th>
                <th>Date Requested</th>
                <th>Purpose</th>
                <th>Status</th>
                <th>Schedule / Remarks</th>
            </tr>
            </thead>
            <tbody>
            <?php foreach ($requests as $row): ?>
                <tr>
                    <td><?php echo (int)$row['id']; ?></td>
                    <td><?php echo h($row['created_at']); ?></td>
                    <td><?php echo nl2br(h($row['student_reason'])); ?></td>
                    <td>
                        <span class="status-badge status-<?php echo h($row['status']); ?>">
                            <?php echo h($row['status']); ?>
                        </span>
                    </td>
                    <td>
                        <?php if (!empty($row['schedule_at'])): ?>
                            <div><strong>Schedule:</strong> <?php echo h($row['schedule_at']); ?></div>
                        <?php endif; ?>
                        <?php if (!empty($row['ccdu_remarks'])): ?>
                            <div class="small-text">
                                <strong>Remarks:</strong> <?php echo nl2br(h($row['ccdu_remarks'])); ?>
                            </div>
                        <?php endif; ?>
                    </td>
                </tr>
            <?php endforeach; ?>
            </tbody>
        </table>
    <?php endif; ?>
</div>

</body>
</html>
<?php
ob_end_flush();
