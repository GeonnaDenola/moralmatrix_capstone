<?php
// ccdu/gmrc_view.php
ob_start();
session_start();

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

require_once __DIR__ . '/../config.php';
require_once __DIR__ . '/../auth.php';
require_role('ccdu');

// include the same header/layout as other CCDU pages
include __DIR__ . '/../includes/header.php';

$servername = $database_settings['servername'] ?? 'localhost';
$username   = $database_settings['username']  ?? 'root';
$password   = $database_settings['password']  ?? '';
$dbname     = $database_settings['dbname']    ?? 'moralmatrix';

$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die('Connection failed: ' . $conn->connect_error);
}

require_once __DIR__ . '/../lib/notify.php';

if (!function_exists('h')) {
    function h(?string $value): string {
        return htmlspecialchars((string)$value, ENT_QUOTES | ENT_SUBSTITUTE, 'UTF-8');
    }
}

$errors     = [];
$successMsg = '';
$gmrcId     = isset($_GET['id']) ? (int)$_GET['id'] : 0;

if ($gmrcId <= 0) {
    die('Invalid GMRC request ID.');
}

// Handle UPDATE (status, schedule, remarks)
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $gmrcId      = (int)($_POST['gmrc_id'] ?? 0);
    $status      = $_POST['status'] ?? 'PENDING';
    $scheduleRaw = $_POST['schedule_at'] ?? '';
    $remarks     = trim($_POST['ccdu_remarks'] ?? '');
    $recordId    = $_SESSION['record_id'] ?? null;

    if (!$recordId) {
        $errors[] = 'Missing CCDU account ID (record_id).';
    }

    // Convert HTML datetime-local (YYYY-MM-DDTHH:MM) to MySQL DATETIME
    $scheduleAt = null;
    if ($scheduleRaw !== '') {
        $dt = DateTime::createFromFormat('Y-m-d\TH:i', $scheduleRaw);
        if ($dt) {
            $scheduleAt = $dt->format('Y-m-d H:i:s');
        } else {
            $errors[] = 'Invalid schedule format.';
        }
    }

    if (empty($errors)) {
        $sql = "
            UPDATE gmrc_requests
            SET status       = ?,
                schedule_at  = ?,
                ccdu_remarks = ?,
                updated_by   = ?,
                updated_at   = NOW()
            WHERE id = ?
        ";

        if ($stmt = $conn->prepare($sql)) {
            $stmt->bind_param(
                'sssii',
                $status,
                $scheduleAt,
                $remarks,
                $recordId,
                $gmrcId
            );
            $stmt->execute();
            $stmt->close();

            $successMsg = 'GMRC request updated successfully.';
        } else {
            $errors[] = 'Failed to prepare update statement.';
        }
    }
}

/* Load GMRC request + student info */
$request = null;

$sql = "
    SELECT r.*,
           s.first_name,
           s.last_name
    FROM gmrc_requests r
    LEFT JOIN student_account s
      ON r.student_id = s.student_id
    WHERE r.id = ?
    LIMIT 1
";

if ($stmt = $conn->prepare($sql)) {
    $stmt->bind_param('i', $gmrcId);
    $stmt->execute();
    $result  = $stmt->get_result();
    $request = $result->fetch_assoc();
    $stmt->close();
}

if (!$request) {
    die('GMRC request not found.');
}

// Prepare datetime-local value
$scheduleValue = '';
if (!empty($request['schedule_at'])) {
    $dt = DateTime::createFromFormat('Y-m-d H:i:s', $request['schedule_at']);
    if ($dt) {
        $scheduleValue = $dt->format('Y-m-d\TH:i');
    }
}
$now = new DateTime();
$minScheduleValue = $now->format('Y-m-d\TH:i');

?>

<style>
    /* Fullscreen overlay that blurs the page behind */
    .gmrc-overlay {
        position: fixed;
        inset: 0;
        background: rgba(0, 0, 0, 0.35);
        backdrop-filter: blur(4px);
        -webkit-backdrop-filter: blur(4px);
        display: flex;
        align-items: flex-start;
        justify-content: center;
        padding: 80px 16px 40px;
        z-index: 9999;
    }

    .gmrc-view-container {
        width: 100%;
        max-width: 800px;
        background: #ffffff;
        padding: 20px 24px;
        border-radius: 8px;
        box-shadow: 0 10px 30px rgba(0,0,0,0.25);
        position: relative;
    }

    /* Close (X) button */
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

    h1 {
        margin-top: 0;
        font-size: 22px;
    }
    .section-title {
        font-weight: 600;
        margin-top: 15px;
        margin-bottom: 5px;
    }
    .field {
        margin-bottom: 12px;
    }
    label {
        display: block;
        font-weight: 600;
        margin-bottom: 4px;
    }
    textarea {
        width: 100%;
        min-height: 80px;
        padding: 8px;
        resize: vertical;
    }
    input[type="datetime-local"],
    select {
        padding: 6px 8px;
        min-width: 250px;
    }
    .status-badge {
        display: inline-block;
        padding: 2px 8px;
        border-radius: 999px;
        font-size: 12px;
        font-weight: 600;
    }
    .status-PENDING { background: #fff3cd; color: #856404; }
    .status-APPROVED { background: #d4edda; color: #155724; }
    .status-REJECTED { background: #f8d7da; color: #721c24; }
    .status-SCHEDULED { background: #d1ecf1; color: #0c5460; }
    .status-COMPLETED { background: #cce5ff; color: #004085; }

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
    .btn-secondary {
        display: inline-block;
        background: #6c757d;
        color: #fff;
        border: none;
        padding: 6px 12px;
        border-radius: 4px;
        cursor: pointer;
        text-decoration: none;
        font-size: 13px;
        margin-bottom: 10px;
    }
    .btn-secondary:hover {
        background: #5a6268;
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
    .small-text {
        font-size: 12px;
        color: #666;
    }
</style>

<div class="gmrc-overlay">
    <div class="gmrc-view-container">
        <!-- Close popup (back to list) -->
        <button type="button" class="gmrc-close" onclick="window.location.href='gmrc_requests.php';">&times;</button>

        <a href="gmrc_requests.php" class="btn-secondary">&larr; Back to GMRC list</a>

        <h1>GMRC Request #<?php echo (int)$request['id']; ?></h1>

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

        <div class="field">
            <span class="section-title">Student</span>
            <?php
            $fullName = trim(($request['first_name'] ?? '') . ' ' . ($request['last_name'] ?? ''));
            ?>
            <div><?php echo h($fullName !== '' ? $fullName : 'N/A'); ?></div>
            <div class="small-text">ID: <?php echo h($request['student_id']); ?></div>
        </div>

        <div class="field">
            <span class="section-title">Purpose of GMRC Request</span>
            <div><?php echo nl2br(h($request['student_reason'])); ?></div>
        </div>

        <div class="field">
            <span class="section-title">Current Status</span>
            <span class="status-badge status-<?php echo h($request['status']); ?>">
                <?php echo h($request['status']); ?>
            </span>
            <div class="small-text">Requested on: <?php echo h($request['created_at']); ?></div>
        </div>

        <hr>

        <h2>Process Request</h2>

        <form method="post">
            <input type="hidden" name="gmrc_id" value="<?php echo (int)$request['id']; ?>">

            <div class="field">
                <label for="status">Status</label>
                <select name="status" id="status">
                    <?php
                    $statuses = ['PENDING','APPROVED','REJECTED','SCHEDULED','COMPLETED'];
                    foreach ($statuses as $st):
                    ?>
                        <option value="<?php echo $st; ?>"
                            <?php if ($request['status'] === $st) echo 'selected'; ?>>
                            <?php echo $st; ?>
                        </option>
                    <?php endforeach; ?>
                </select>
            </div>

<div class="field">
    <label for="schedule_at">Schedule (optional)</label>
    <input
        type="datetime-local"
        name="schedule_at"
        id="schedule_at"
        value="<?php echo h($scheduleValue); ?>"
        min="<?php echo h($minScheduleValue); ?>"
    >
    <div class="small-text">
        Set the date and time for GMRC session, if applicable.
    </div>
</div>


            <div class="field">
                <label for="ccdu_remarks">CCDU Remarks</label>
                <textarea name="ccdu_remarks" id="ccdu_remarks"><?php echo h($request['ccdu_remarks'] ?? ''); ?></textarea>
                <div class="small-text">
                    Remarks or instructions that the student might see on their GMRC request page.
                </div>
            </div>

            <button type="submit" class="btn-primary">Save Changes</button>
        </form>
    </div>
</div>

<?php
ob_end_flush();
