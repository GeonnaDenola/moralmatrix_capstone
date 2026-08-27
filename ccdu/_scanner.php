<?php
// ccdu/_scanner.php — scanner + backend validator
declare(strict_types=1);

require_once __DIR__ . '/../config.php';

/* =======================================================
   BACKEND: VALIDATION ENDPOINT (same file)
   =======================================================*/
if (isset($_GET['mode']) && $_GET['mode'] === 'check') {

    header('Content-Type: application/json; charset=utf-8');
    header('Cache-Control: no-cache, no-store, must-revalidate');

    $studentId = $_GET['student_id'] ?? '';

    // Invalid format
    if (!preg_match('/^\d{4}-\d{4}$/', $studentId)) {
        echo json_encode([
            'ok' => false,
            'reason' => 'invalid_format'
        ]);
        exit;
    }

    // DB lookup
    $conn = db();
    $stmt = $conn->prepare("SELECT student_id FROM student_account WHERE student_id = ?");
    $stmt->bind_param("s", $studentId);
    $stmt->execute();
    $stmt->store_result();

    if ($stmt->num_rows === 0) {
        echo json_encode([
            'ok' => false,
            'reason' => 'not_found'
        ]);
        exit;
    }

    // Build target URL (final redirect page)
    $scheme = (!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off') ? 'https' : 'http';
    $host   = $_SERVER['HTTP_HOST'] ?? 'localhost';
    $base   = rtrim(BASE_URL, '/');

    $target = $scheme . '://' . $host . $base . '/ccdu/view_student.php?student_id=' . urlencode($studentId);

    echo json_encode([
        'ok' => true,
        'target' => $target
    ]);
    exit;
}

/* =======================================================
   FRONTEND: SCANNER JAVASCRIPT
   =======================================================*/

// Build scanner URLs
$scheme = (!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off') ? 'https' : 'http';
$host   = $_SERVER['HTTP_HOST'] ?? 'localhost';
$base   = rtrim(BASE_URL, '/');

// final destination after validation
$finalView = $scheme . '://' . $host . $base . '/ccdu/view_student.php';

// backend validator (this SAME file!)
$qrCheck = $scheme . '://' . $host . $base . '/ccdu/_scanner.php?mode=check';

?>
<script>
(() => {

  if (window.__MM_SCANNER_ACTIVE__) return;
  window.__MM_SCANNER_ACTIVE__ = true;

  const FINAL_VIEW_URL = <?= json_encode($finalView) ?>;
  const QR_CHECK_URL   = <?= json_encode($qrCheck) ?>;

  const GAP_RESET_MS = 80;
  const AUTO_FIRE_MS = 140;
  const MAX_LEN = 256;

  let active = true;
  let buf = '';
  let lastTs = 0;
  let idleTimer = null;

  function popup(title, message){
    const overlay = document.createElement('div');
    overlay.style.cssText =
      'position:fixed;inset:0;z-index:100000;background:rgba(0,0,0,.45);display:flex;align-items:center;justify-content:center';

    const box = document.createElement('div');
    box.style.cssText =
      'background:#fff;border-radius:12px;padding:18px 20px;box-shadow:0 12px 32px rgba(0,0,0,.25);' +
      'min-width:260px;max-width:90vw;text-align:center;font:14px system-ui;color:#111';

    box.innerHTML =
      `<div style="font-weight:700;margin-bottom:6px;color:#b91c1c;">${title}</div>
       <div style="font-size:12px;color:#6b7280;margin-bottom:12px;">${message}</div>
       <button type="button" style="padding:8px 14px;border:0;border-radius:10px;cursor:pointer;background:#111827;color:#fff;">OK</button>`;

    box.querySelector('button').onclick = () => overlay.remove();
    overlay.onclick = e => { if (e.target === overlay) overlay.remove(); };

    overlay.appendChild(box);
    document.body.appendChild(overlay);
  }

  const ui = document.createElement('div');
  ui.style.cssText =
    'position:fixed;right:10px;bottom:10px;z-index:99999;font:12px system-ui;background:#eef6ff;color:#0369a1;' +
    'padding:6px 10px;border-radius:8px;box-shadow:0 2px 8px rgba(0,0,0,.08);opacity:.9';
  ui.textContent = 'Scan ready (Ctrl+Shift+S)';

  const line = document.createElement('div');
  line.style.cssText =
    'margin-top:4px;color:#64748b;max-width:40vw;overflow:hidden;text-overflow:ellipsis;white-space:nowrap';

  document.addEventListener('DOMContentLoaded', () => {
    ui.appendChild(line);
    document.body.appendChild(ui);
  });

  const setStatus = (msg, ok = true) => {
    ui.style.background = ok ? '#eef6ff' : '#fee2e2';
    ui.style.color = ok ? '#0369a1' : '#991b1b';
    ui.firstChild.nodeValue = msg;
  };

  const showReady = () =>
    setStatus(active ? 'Scan ready (Ctrl+Shift+S)' : 'Scan paused (Ctrl+Shift+S)');

  const resetBuf = () => {
    buf = '';
    lastTs = 0;
    clearTimeout(idleTimer);
    idleTimer = null;
    line.textContent = '';
  };

  const armIdleFire = () => {
    clearTimeout(idleTimer);
    idleTimer = setTimeout(() => { if (buf) process(buf); }, AUTO_FIRE_MS);
  };

  const normalize = s => (s || '').replace(/[\u2010-\u2015]/g, '-').trim();
  const isEditable = el =>
    el && (el.tagName === 'INPUT' || el.tagName === 'TEXTAREA' || el.isContentEditable);

  function extractStudentID(val){
    return (val.match(/\b(\d{4}-\d{4})\b/) || [])[1] ||
           (val.match(/student_id=(\d{4}-\d{4})/i) || [])[1] ||
           '';
  }

  async function process(raw){
    const val = normalize(raw);
    if (!val){ resetBuf(); return; }

    line.textContent = val;
    const studentId = extractStudentID(val);

    if (!studentId) {
      popup("Invalid QR Code", "QR format does not contain a valid Student ID.");
      setStatus("Invalid format", false);
      setTimeout(showReady, 1500);
      resetBuf();
      return;
    }

    try {
      const res = await fetch(`${QR_CHECK_URL}&student_id=${encodeURIComponent(studentId)}`);
      const data = await res.json().catch(() => ({}));

      if (!data.ok && data.reason === "not_found") {
        popup("Student Not Found", `No record found for ID: ${studentId}`);
        setStatus("ID not found", false);
        setTimeout(showReady, 2000);
        resetBuf();
        return;
      }

      if (!data.ok) {
        popup("Invalid QR", "The QR code is revoked or not registered.");
        setStatus("Invalid QR", false);
        setTimeout(showReady, 2000);
        resetBuf();
        return;
      }

      window.location.assign(data.target);

    } catch (err) {
      popup("Network Error", "Could not verify QR code.");
      setStatus("Network error", false);
      setTimeout(showReady, 1500);
    }

    resetBuf();
  }

  window.addEventListener('keydown', e => {
    if (e.ctrlKey && e.shiftKey && e.code === 'KeyS'){
      active = !active;
      showReady();
    }
  });

  window.addEventListener('keydown', e => {
    if (!active) return;
    if (isEditable(document.activeElement)) return;

    if (e.key === 'Enter'){
      e.preventDefault();
      if (buf) process(buf);
      resetBuf();
      return;
    }

    if (e.key && e.key.length === 1){
      e.preventDefault();
      const now = performance.now();
      if (lastTs && now - lastTs > GAP_RESET_MS){
        buf = '';
        line.textContent = '';
      }
      lastTs = now;
      if (buf.length < MAX_LEN){
        buf += e.key;
        line.textContent = buf;
      }
      armIdleFire();
      return;
    }

    if (e.key === 'Backspace'){
      e.preventDefault();
      buf = buf.slice(0, -1);
      line.textContent = buf;
      armIdleFire();
    }

  }, true);

})();
</script>
