<?php
// ccdu/gmrc_requests.php
ob_start();
session_start();

/* Debug (optional, remove in production) */
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

require_once __DIR__ . '/../config.php';
require_once __DIR__ . '/../auth.php';

include __DIR__ . '/../includes/header.php';

require_role('ccdu'); // only CCDU can access this page

// ---------- DB CONNECTION (MySQLi) ----------
$servername = $database_settings['servername'] ?? 'localhost';
$username   = $database_settings['username']  ?? 'root';
$password   = $database_settings['password']  ?? '';
$dbname     = $database_settings['dbname']    ?? 'u165188762_comooam';

$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die('Connection failed: ' . $conn->connect_error);
}

// If you have a CCDU header, include it here
// (use __DIR__ so the path is always correct)
//include __DIR__ . '/../includes/header.php';

// Simple HTML escape
if (!function_exists('h')) {
    function h(?string $value): string {
        return htmlspecialchars((string)$value, ENT_QUOTES | ENT_SUBSTITUTE, 'UTF-8');
    }
}

/* ----------------------------
 * Status filter (optional)
 * ---------------------------- */
$statusFilter = $_GET['status'] ?? 'ALL';

$requests = [];

// Base query
$sql = "
    SELECT r.id,
           r.student_id,
           r.status,
           r.schedule_at,
           r.student_reason,
           r.created_at,
           r.ccdu_remarks,
           s.first_name,
           s.last_name
    FROM gmrc_requests r
    LEFT JOIN student_account s
      ON r.student_id = s.student_id
";

// Add filter if needed
if ($statusFilter !== 'ALL') {
    $sql .= " WHERE r.status = ? ORDER BY r.created_at DESC";
    if ($stmt = $conn->prepare($sql)) {
        $stmt->bind_param('s', $statusFilter);
        $stmt->execute();
        $result = $stmt->get_result();
        while ($row = $result->fetch_assoc()) {
            $requests[] = $row;
        }
        $stmt->close();
    }
} else {
    $sql .= " ORDER BY r.created_at DESC";

    $result = $conn->query($sql);
    if (!$result) {
        die(
            'SQL error in gmrc_requests.php: ' . $conn->error .
            '<br><br><strong>Query:</strong><br><pre>' . $sql . '</pre>'
        );
    }

    while ($row = $result->fetch_assoc()) {
        $requests[] = $row;
    }
    $result->free();
}
?>

<!-- Page-specific CSS can live after header, inside body -->
<style>
    body {
        font-family: system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif;
        background: #f5f5f5;
        margin: 0;
        padding: 20px;
    }
    .gmrc-list-container {
        width: 100%;
        max-width: 1400px;
        margin: 60px auto 0;   /* top, left/right, bottom spacing */
        box-sizing: border-box;
        background: #ffffff;
        padding: 20px 24px;
        border-radius: 8px;
        box-shadow: 0 3px 10px rgba(0,0,0,0.08);
    }
    h1 {
        margin-top: 0;
        font-size: 25px;
    }
    .filter-row {
        margin-bottom: 15px;
    }
    .filter-row form {
        display: inline-block;
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
    .status-APPROVED {
        background: #d4edda;
        color: #155724;
    }
    .status-REJECTED {
        background: #f8d7da;
        color: #721c24;
    }
    .status-SCHEDULED {
        background: #d1ecf1;
        color: #0c5460;
    }
    .status-COMPLETED {
        background: #cce5ff;
        color: #004085;
    }
    .small-text {
        font-size: 12px;
        color: #666;
    }
    .btn-link {
        display: inline-block;
        padding: 4px 8px;
        font-size: 13px;
        border-radius: 4px;
        text-decoration: none;
        background: #0069d9;
        color: #fff;
    }
    .btn-link:hover {
        background: #0053ad;
    }
    @media (min-width: 1200px) {
    .gmrc-list-container {
        margin-left: 350px;   /* adjust based on your sidebar width */
        margin-right: 40px;
    }
}
</style>

<div class="gmrc-list-container">
    <h1>Good Moral Certificate Requests</h1>

    <div class="filter-row">
        <form method="get">
            <label>
                Status:
                <select name="status" onchange="this.form.submit()">
                    <option value="ALL"      <?php if ($statusFilter === 'ALL') echo 'selected'; ?>>All</option>
                    <option value="PENDING"  <?php if ($statusFilter === 'PENDING') echo 'selected'; ?>>Pending</option>
                    <option value="APPROVED" <?php if ($statusFilter === 'APPROVED') echo 'selected'; ?>>Approved</option>
                    <option value="REJECTED" <?php if ($statusFilter === 'REJECTED') echo 'selected'; ?>>Rejected</option>
                    <option value="SCHEDULED"<?php if ($statusFilter === 'SCHEDULED') echo 'selected'; ?>>Scheduled</option>
                    <option value="COMPLETED"<?php if ($statusFilter === 'COMPLETED') echo 'selected'; ?>>Completed</option>
                </select>
            </label>
            <noscript><button type="submit">Filter</button></noscript>
        </form>
    </div>

    <?php if (empty($requests)): ?>
        <p>No GMRC requests found.</p>
    <?php else: ?>
        <table>
            <thead>
            <tr>
                <th>#</th>
                <th>Student</th>
                <th>Purpose</th>
                <th>Status</th>
                <th>Schedule</th>
                <th>Date Requested</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <?php foreach ($requests as $row): ?>
                <tr>
                    <td><?php echo (int)$row['id']; ?></td>
                    <td>
                        <?php
                        $fullName = trim(($row['first_name'] ?? '') . ' ' . ($row['last_name'] ?? ''));
                        echo h($fullName !== '' ? $fullName : 'N/A');
                        ?>
                        <br>
                        <span class="small-text">ID: <?php echo h($row['student_id']); ?></span>
                    </td>
                    <td><?php echo nl2br(h($row['student_reason'])); ?></td>
                    <td>
                        <span class="status-badge status-<?php echo h($row['status']); ?>">
                            <?php echo h($row['status']); ?>
                        </span>
                    </td>
                    <td>
                        <?php echo !empty($row['schedule_at']) ? h($row['schedule_at']) : '<span class="small-text">Not set</span>'; ?>
                    </td>
                    <td><?php echo h($row['created_at']); ?></td>
                    <td>
                        <a class="btn-link" href="gmrc_view.php?id=<?php echo (int)$row['id']; ?>">
                            View / Process
                        </a>
                    </td>
                </tr>
            <?php endforeach; ?>
            </tbody>
        </table>
    <?php endif; ?>
</div>

<?php
ob_end_flush();
