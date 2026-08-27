<?php require __DIR__.'/config.php';
echo 'PHP tz: '.date_default_timezone_get().'<br>';
$row = db()->query("SELECT NOW() AS now, @@session.time_zone AS tz")->fetch_assoc();
echo 'MySQL NOW(): '.$row['now'].' (tz '.$row['tz'].')';
