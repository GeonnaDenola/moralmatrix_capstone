<?php
// /MoralMatrix/ccdu/gmrc_logs.php
if (session_status() !== PHP_SESSION_ACTIVE) session_start();

// TEMP: show errors on screen so the page is not "blank" when something breaks
error_reporting(E_ALL);
ini_set('display_errors', 1);

require __DIR__ . '/../config.php';
include '../includes/header.php';

// CCDU only
$role = strtolower($_SESSION['account_type'] ?? '');
if ($role !== 'ccdu') {
    header('Location: /login.php');
    exit;
}

// DB connect
$conn = new mysqli(
    $database_settings['servername'],
    $database_settings['username'],
    $database_settings['password'],
    $database_settings['dbname']
);
if ($conn->connect_error) {
    die('<p>DB connection failed: ' . htmlspecialchars($conn->connect_error) . '</p>');
}
// Make connection use utf8mb4 + unicode collation
$conn->set_charset('utf8mb4');
$conn->query("SET collation_connection = 'utf8mb4_unicode_ci'");

function h($s) {
    return htmlspecialchars($s ?? '', ENT_QUOTES, 'UTF-8');
}

/* -------- Filters & pagination -------- */
$searchStudent = trim($_GET['student_id'] ?? '');
$perPage = 25;
$page = max(1, (int)($_GET['page'] ?? 1));
$offset = ($page - 1) * $perPage;

$where = [];
$params = [];
$types  = '';

if ($searchStudent !== '') {
    // Force column side to same collation as connection
    $where[]  = 'l.student_id COLLATE utf8mb4_unicode_ci LIKE ?';
    $params[] = '%' . $searchStudent . '%';
    $types   .= 's';
}

$whereSql = $where ? ('WHERE ' . implode(' AND ', $where)) : '';

/* -------- Count total rows -------- */
$countSql = "SELECT COUNT(*) AS c FROM gmrc_certificate_logs l $whereSql";
$stmtCount = $conn->prepare($countSql);
if ($stmtCount === false) {
    die('<p>Prepare COUNT failed: ' . h($conn->error) . '</p>');
}
if ($types !== '') {
    $stmtCount->bind_param($types, ...$params);
}
if (!$stmtCount->execute()) {
    die('<p>Execute COUNT failed: ' . h($stmtCount->error) . '</p>');
}
$resultCount = $stmtCount->get_result();
$rowCount = $resultCount->fetch_assoc();
$totalRows = (int)($rowCount['c'] ?? 0);
$stmtCount->close();

$totalPages  = max(1, (int)ceil($totalRows / $perPage));
if ($page > $totalPages) $page = $totalPages;
$offset = ($page - 1) * $perPage;

/* -------- Fetch logs -------- */
$listSql = "
    SELECT
        l.*,
        s.first_name,
        s.middle_name,
        s.last_name
    FROM gmrc_certificate_logs l
    LEFT JOIN student_account s
      ON s.student_id COLLATE utf8mb4_unicode_ci
       = l.student_id COLLATE utf8mb4_unicode_ci
    $whereSql
    ORDER BY l.created_at DESC
    LIMIT ? OFFSET ?
";

$stmtList = $conn->prepare($listSql);
if ($stmtList === false) {
    die('<p>Prepare LIST failed: ' . h($conn->error) . '</p>');
}

// bind params
if ($types !== '') {
    $typesList = $types . 'ii';
    $paramsList = $params;
    $paramsList[] = $perPage;
    $paramsList[] = $offset;
    $stmtList->bind_param($typesList, ...$paramsList);
} else {
    $stmtList->bind_param('ii', $perPage, $offset);
}

if (!$stmtList->execute()) {
    die('<p>Execute LIST failed: ' . h($stmtList->error) . '</p>');
}

$result = $stmtList->get_result();
$rows   = $result->fetch_all(MYSQLI_ASSOC);
$stmtList->close();

$conn->close();

/* Helper for full name */
function full_name(array $row): string {
    $parts = [
        $row['first_name']  ?? '',
        $row['middle_name'] ?? '',
        $row['last_name']   ?? '',
    ];
    return trim(implode(' ', array_filter($parts)));
}

// Build pagination URL helper
function gmrc_logs_url($page, $studentIdFilter) {
    $qs = [];
    if ($studentIdFilter !== '') {
        $qs['student_id'] = $studentIdFilter;
    }
    $qs['page'] = max(1, (int)$page);
    return 'gmrc_logs.php' . '?' . http_build_query($qs);
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>GMRC Certificate History Logs</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <style>
    .gmrc-log-page {
      margin-left: 260px;
      padding: 80px 32px 40px;
      font-family: system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif;
      background:#f3f4f6;
      min-height:100vh;
    }
    .gmrc-log-shell {
      max-width: 1200px;
      margin:0 auto;
    }
    .gmrc-log-header {
      margin-bottom:24px;
      display:flex;
      flex-wrap:wrap;
      justify-content:space-between;
      gap:16px;
      align-items:flex-end;
    }
    .gmrc-log-header h1 {
      margin:0;
      font-size:1.6rem;
      letter-spacing:-0.02em;
    }
    .gmrc-log-header p {
      margin:4px 0 0;
      color:#6b7280;
      font-size:0.95rem;
    }
    .gmrc-log-card {
      background:#fff;
      border-radius:16px;
      border:1px solid #e5e7eb;
      box-shadow:0 18px 35px rgba(15,23,42,.08);
      padding:20px 22px 18px;
    }
    .gmrc-log-filters {
      display:flex;
      flex-wrap:wrap;
      gap:12px;
      margin-bottom:16px;
      align-items:flex-end;
    }
    .gmrc-log-filters label {
      font-size:0.85rem;
      color:#4b5563;
      font-weight:600;
      display:flex;
      flex-direction:column;
      gap:6px;
    }
    .gmrc-log-filters input {
      padding:8px 10px;
      border-radius:10px;
      border:1px solid #d1d5db;
      min-width:190px;
    }
    .gmrc-log-filters button {
      padding:9px 16px;
      border-radius:999px;
      border:1px solid #111827;
      background:#111827;
      color:#fff;
      cursor:pointer;
      font-weight:600;
      font-size:0.9rem;
    }
    .gmrc-log-filters button:hover {
      background:#020617;
      border-color:#020617;
    }
    table.gmrc-log-table {
      width:100%;
      border-collapse:collapse;
      font-size:0.9rem;
    }
    table.gmrc-log-table th,
    table.gmrc-log-table td {
      padding:10px 8px;
      border-bottom:1px solid #e5e7eb;
      text-align:left;
      vertical-align:top;
    }
    table.gmrc-log-table th {
      font-size:0.8rem;
      text-transform:uppercase;
      letter-spacing:0.08em;
      color:#6b7280;
      background:#f9fafb;
    }
    table.gmrc-log-table tbody tr:hover {
      background:#f9fafb;
    }
    .gmrc-tag {
      display:inline-flex;
      padding:2px 8px;
      border-radius:999px;
      background:#eff6ff;
      color:#1d4ed8;
      font-size:0.75rem;
      font-weight:600;
    }
    .gmrc-meta {
      font-size:0.8rem;
      color:#6b7280;
    }
    .gmrc-empty {
      padding:18px 10px;
      text-align:center;
      color:#6b7280;
      font-size:0.95rem;
    }
    .pagination {
      display:flex;
      justify-content:space-between;
      align-items:center;
      margin-top:14px;
      font-size:0.85rem;
      color:#6b7280;
    }
    .pagination .buttons {
      display:flex;
      gap:8px;
    }
    .pagination a,
    .pagination span {
      padding:6px 10px;
      border-radius:999px;
      border:1px solid #d1d5db;
      text-decoration:none;
      color:#111827;
      font-size:0.85rem;
    }
    .pagination span.disabled {
      opacity:0.5;
      cursor:default;
    }
    @media (max-width: 900px) {
      .gmrc-log-page{
        margin-left:0;
        padding:80px 16px 30px;
      }
    }
  </style>
</head>
<body>
<main class="gmrc-log-page">
  <div class="gmrc-log-shell">
    <header class="gmrc-log-header">
      <div>
        <h1>GMRC Certificate History</h1>
        <p>Audit trail of Good Moral certificates generated by CCDU.</p>
      </div>
      <div class="gmrc-meta">
        Total logs: <?= number_format($totalRows) ?>
      </div>
    </header>

    <section class="gmrc-log-card">
      <form class="gmrc-log-filters" method="get" action="gmrc_logs.php">
        <label>
          Student ID
          <input type="text" name="student_id" value="<?= h($searchStudent) ?>" placeholder="e.g. 2021-0001">
        </label>
        <button type="submit">Filter</button>
      </form>

      <?php if (empty($rows)): ?>
        <div class="gmrc-empty">
          No GMRC certificates have been logged yet.
        </div>
      <?php else: ?>
        <div class="gmrc-log-table-wrapper">
          <table class="gmrc-log-table">
            <thead>
              <tr>
                <th>Date / Time</th>
                <th>Student</th>
                <th>Coverage</th>
                <th>Purpose</th>
                <th>Requestor</th>
                <th>Issued by</th>
              </tr>
            </thead>
            <tbody>
            <?php foreach ($rows as $row): ?>
              <?php
                $fullName   = full_name($row);
                $issueDate  = $row['issue_date'] ? date('M d, Y', strtotime($row['issue_date'])) : '—';
                $createdAt  = $row['created_at'] ? date('M d, Y h:i A', strtotime($row['created_at'])) : '—';
                $coverage   = trim(($row['from_semester'] ?? '') . ' ' . ($row['from_ay'] ?? ''));
                $coverageTo = trim(($row['to_semester'] ?? '')   . ' ' . ($row['to_ay'] ?? ''));
              ?>
              <tr>
                <td>
                  <div><?= h($createdAt) ?></div>
                  <div class="gmrc-meta">Issue date: <?= h($issueDate) ?></div>
                </td>
                <td>
                  <div><strong><?= h($row['student_id']) ?></strong></div>
                  <div class="gmrc-meta"><?= $fullName !== '' ? h($fullName) : 'Unknown name' ?></div>
                </td>
                <td>
                  <?php if ($coverage || $coverageTo): ?>
                    <div><?= h($coverage) ?><?= $coverageTo ? ' → ' . h($coverageTo) : '' ?></div>
                  <?php else: ?>
                    <span class="gmrc-meta">Not specified</span>
                  <?php endif; ?>
                </td>
                <td>
                  <?php if (!empty($row['purpose'])): ?>
                    <span class="gmrc-tag"><?= h($row['purpose']) ?></span>
                  <?php else: ?>
                    <span class="gmrc-meta">—</span>
                  <?php endif; ?>
                </td>
                <td>
                  <?= $row['requestor_name'] ? h($row['requestor_name']) : '<span class="gmrc-meta">—</span>' ?>
                </td>
                <td>
                  <?= $row['issued_by'] ? h($row['issued_by']) : '<span class="gmrc-meta">—</span>' ?>
                </td>
              </tr>
            <?php endforeach; ?>
            </tbody>
          </table>
        </div>

        <div class="pagination">
          <div>
            Page <?= $totalRows ? $page : 1 ?> of <?= $totalPages ?> • Showing
            <?= $totalRows ? min($perPage, $totalRows - $offset) : 0 ?>
            of <?= $totalRows ?> logs
          </div>
          <div class="buttons">
            <?php if ($page > 1): ?>
              <a href="<?= h(gmrc_logs_url($page-1, $searchStudent)) ?>">&larr; Prev</a>
            <?php else: ?>
              <span class="disabled">&larr; Prev</span>
            <?php endif; ?>

            <?php if ($page < $totalPages): ?>
              <a href="<?= h(gmrc_logs_url($page+1, $searchStudent)) ?>">Next &rarr;</a>
            <?php else: ?>
              <span class="disabled">Next &rarr;</span>
            <?php endif; ?>
          </div>
        </div>
      <?php endif; ?>
    </section>
  </div>
</main>
</body>
</html>
