<?php
// student/gmrc_request.php
ob_start();
session_start();

/* ------------------- DEBUG (TEMPORARY) ------------------- */
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
/* --------------------------------------------------------- */

require_once __DIR__ . '/../config.php';
require_once __DIR__ . '/../auth.php';
require_role('student');

require_once __DIR__ . '/../lib/notify.php';

// ---------- DB CONNECTION (MySQLi) ----------
$servername = $database_settings['servername'] ?? 'localhost';
$username   = $database_settings['username']  ?? 'root';
$password   = $database_settings['password']  ?? '';
$dbname     = $database_settings['dbname']    ?? 'moralmatrix';

$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die('Connection failed: ' . $conn->connect_error);
}

// ✅ include your normal student header/layout here
include __DIR__ . '/../includes/student_header.php';
// or: include __DIR__ . '/../includes/header.php';  (whichever you actually use)

// if you have a notify helper, include it
require_once __DIR__ . '/../lib/notify.php';

// Simple HTML escape
if (!function_exists('h')) {
    function h(?string $value): string {
        return htmlspecialchars((string)$value, ENT_QUOTES | ENT_SUBSTITUTE, 'UTF-8');
    }
}

$errors       = [];
$successMsg   = '';
$studentId    = $_SESSION['student_id'] ?? null;
$recordId     = $_SESSION['record_id'] ?? null;
$reason       = '';
$pendingHours = 0;

// Handle form submit
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $reason = trim($_POST['student_reason'] ?? '');

    if (!$studentId) {
        $errors[] = 'Missing student ID in session.';
    }

    if (!$recordId) {
        $errors[] = 'Missing account ID (record_id) in session.';
    }

    if ($reason === '') {
        $errors[] = 'Please state the purpose of your GMRC request.';
    }

    if (empty($errors)) {
        try {
            $sql = "INSERT INTO gmrc_requests (
                        student_id,
                        requested_by,
                        status,
                        student_reason,
                        created_by
                    ) VALUES (?,?,?,?,?)";

            if ($stmt = $conn->prepare($sql)) {
                $status      = 'PENDING';
                $requestedBy = (int)$recordId;
                $createdBy   = (int)$recordId;

                $stmt->bind_param(
                    'sissi',
                    $studentId,
                    $requestedBy,
                    $status,
                    $reason,
                    $createdBy
                );

                $stmt->execute();
                $gmrcId = (int)$stmt->insert_id;
                $stmt->close();
                
                /* ---------------------------
                 * NOTIFY CCDU (GMRC request)
                 * --------------------------- */
                
                // who triggered this (for audit in notifications table)
                $actorId = $_SESSION['actor_id'] ?? $recordId ?? 'student';
                
                // OPTIONAL: get student full name (if not already in session)
                $studentFullName = $_SESSION['student_name'] ?? '';
                if ($studentFullName === '') {
                    if ($stmtName = $conn->prepare("SELECT first_name, last_name FROM student_account WHERE student_id = ?")) {
                        $stmtName->bind_param('s', $studentId);
                        $stmtName->execute();
                        $stmtName->bind_result($fn, $ln);
                        if ($stmtName->fetch()) {
                            $studentFullName = trim($fn . ' ' . $ln);
                        }
                        $stmtName->close();
                    }
                }
                if ($studentFullName === '') {
                    $studentFullName = 'Student ' . $studentId;
                }
                
                // create notification for CCDU
                Notify::create($conn, [
                    'type'        => 'info', // or 'primary' / whatever you use
                    'target_role' => 'ccdu',
                    'title'       => 'New GMRC Request',
                    'body'        => $studentFullName . ' • Student ID: ' . $studentId,
                    'url'         => asset('ccdu/gmrc_view.php?id=' . $gmrcId),
                    // no violation_id here; notification is for a GMRC request
                    'created_by'  => $actorId,
                ]);

$successMsg = 'Your GMRC request has been submitted. Please wait for CCDU to review it.';
$reason     = '';

            } else {
                $errors[] = 'There was a problem preparing the GMRC request. Please try again later.';
            }
        } catch (Exception $e) {
            $errors[] = 'There was a problem saving your request. Please try again later.';
        }
    }
}
?>

<style>
    /* We do NOT reset body here; header already styled it */
    .gmrc-overlay {
        position: fixed;
        inset: 0;
        background: rgba(0, 0, 0, 0.45);
        backdrop-filter: blur(4px);          /* 👈 actual blur */
        -webkit-backdrop-filter: blur(4px);
        display: flex;
        align-items: flex-start;
        justify-content: center;
        padding: 80px 16px 40px;
        z-index: 9999;                       /* above header/content */
    }

    .gmrc-container {
        width: 100%;
        max-width: 700px;
        background: #ffffff;
        padding: 24px 28px;
        border-radius: 10px;
        box-shadow: 0 10px 30px rgba(0,0,0,0.25);
        position: relative;
    }

    .gmrc-container h1 {
        margin-top: 0;
        font-size: 22px;
    }
    .gmrc-container .field {
        margin-bottom: 15px;
    }
    .gmrc-container label {
        display: block;
        font-weight: 600;
        margin-bottom: 5px;
    }
    .gmrc-container textarea {
        width: 100%;
        min-height: 120px;
        padding: 8px;
        resize: vertical;
    }
    .help-text {
        font-size: 12px;
        color: #666;
    }
    .btn-primary {
        background: #0069d9;
        color: #fff;
        border: none;
        padding: 8px 16px;
        border-radius: 4px;
        cursor: pointer;
    }
    .btn-primary:hover {
        background: #0053ad;
    }
    .alert {
        padding: 10px 12px;
        border-radius: 4px;
        margin-bottom: 15px;
        font-size: 14px;
    }
    .alert-error {
        background: #f8d7da;
        color: #721c24;
    }
    .alert-success {
        background: #d4edda;
        color: #155724;
    }
    .gmrc-close {
        position: absolute;
        top: 10px;
        right: 12px;
        border: none;
        background: transparent;
        font-size: 22px;
        line-height: 1;
        cursor: pointer;
        color: #999;
    }
    .gmrc-close:hover {
        color: #333;
    }
</style>

<div class="gmrc-overlay">
    <div class="gmrc-container">
        <button type="button" class="gmrc-close" onclick="window.history.back();">&times;</button>

        <h1>GMRC Request Form</h1>

        <?php if ($errors): ?>
            <div class="alert alert-error">
                <ul style="margin:0; padding-left:18px;">
                    <?php foreach ($errors as $err): ?>
                        <li><?php echo h($err); ?></li>
                    <?php endforeach; ?>
                </ul>
            </div>
        <?php endif; ?>

        <?php if ($successMsg): ?>
            <div class="alert alert-success">
                <?php echo h($successMsg); ?>
            </div>
        <?php endif; ?>

        <form method="post">
            <div class="field">
                <label for="student_reason">Purpose of GMRC Request</label>
                <textarea name="student_reason" id="student_reason" required
                          placeholder="Example: For scholarship, OJT requirement, further studies, clearance, etc."><?php echo h($reason); ?></textarea>
                <div class="help-text">
                    Explain the main purpose why you are requesting GMRC.
                </div>
            </div>

            <button type="submit" class="btn-primary">Submit Request</button>
        </form>
    </div>
</div>

<?php
ob_end_flush();
