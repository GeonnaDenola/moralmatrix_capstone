<?php
require 'config.php';

$token = $_GET['token'] ?? '';
$error = '';

$conn = new mysqli(
    $database_settings['servername'],
    $database_settings['username'],
    $database_settings['password'],
    $database_settings['dbname']
);
if ($conn->connect_error) die("Connection failed: " . $conn->connect_error);

// Check token validity
$stmt = $conn->prepare("SELECT record_id, email FROM accounts WHERE reset_token=? AND reset_expires > NOW()");
$stmt->bind_param("s", $token);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows === 0) {
    die("<p style='color:red; text-align:center;'>Invalid or expired token.</p>");
}

$user = $result->fetch_assoc();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $password = $_POST['password'] ?? '';
    $confirm  = $_POST['confirm_password'] ?? '';

    if ($password !== $confirm) {
        $error = 'Passwords do not match.';
    } elseif (
        strlen($password) < 8 ||
        !preg_match('/[A-Z]/', $password) ||        // at least one uppercase
        !preg_match('/[a-z]/', $password) ||        // at least one lowercase
        !preg_match('/\d/', $password) ||           // at least one digit
        !preg_match('/[^A-Za-z0-9]/', $password)    // at least one special char
    ) {
        $error = 'Password must be at least 8 characters and include uppercase, lowercase, a number, and a special character.';
    } else {
        $new_pass = password_hash($password, PASSWORD_BCRYPT);

        $stmt = $conn->prepare("UPDATE accounts SET password=?, reset_token=NULL, reset_expires=NULL
                                WHERE record_id=?");
        $stmt->bind_param("si", $new_pass, $user['record_id']);
        $stmt->execute();

        if (session_status() === PHP_SESSION_NONE) {
            session_start();
        }
        $_SESSION = [];

        session_destroy();

        echo "<p style='color:green; text-align:center;'>Password updated successfully. <a href='login.php'>Login here</a>.</p>";
        exit;
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Reset Password | Moral Matrix</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f6f8;
            display:flex;
            align-items:center;
            justify-content:center;
            height:100vh;
            margin:0;
        }
        form {
            background:#fff;
            padding:2rem;
            border-radius:14px;
            box-shadow:0 10px 25px rgba(15,23,42,0.12);
            width:360px;
        }
        h2 {
            margin-top:0;
            margin-bottom:0.5rem;
        }
        .note {
            font-size:0.85rem;
            color:#555;
            margin-bottom:1rem;
        }

        /* Text/password inputs only */
        .form-input {
            width:100%;
            padding:10px 12px;
            margin-bottom:10px;
            border:1px solid #d1d5db;
            border-radius:8px;
            box-sizing:border-box;
        }

        /* Checkbox styles */
        .toggle-row {
            display:flex;
            align-items:center;
            gap:6px;
            margin:4px 0 14px;
            font-size:0.9rem;
            color:#374151;
        }
        .toggle-row input[type="checkbox"] {
            width:auto;
            margin:0;
        }

        button {
            width:100%;
            padding:10px;
            background:#007bff;
            color:white;
            border:none;
            border-radius:999px;
            font-weight:600;
            cursor:pointer;
        }
        button:hover {
            background:#0056b3;
        }
    </style>
</head>
<body>
    <form method="POST">
        <h2>Reset Your Password</h2>

        <?php if (!empty($error)): ?>
            <p style="color:red; text-align:center;"><?php echo htmlspecialchars($error); ?></p>
        <?php endif; ?>

        <p class="note">
            Password must be at least 8 characters and include uppercase, lowercase, a number, and a special character.
        </p>

       <input
            type="password"
            id="password"
            name="password"
            class="form-input"
            placeholder="Enter new password"
            required
            minlength="8"
            pattern="(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[^A-Za-z\d]).{8,}"
            title="At least 8 characters with uppercase, lowercase, number, and special character"
        />

        <input
            type="password"
            id="confirm_password"
            name="confirm_password"
            class="form-input"
            placeholder="Confirm new password"
            required
            minlength="8"
        />

        <div class="toggle-row">
            <input type="checkbox" id="togglePassword">
            <label for="togglePassword">Show password</label>
        </div>

        <button type="submit">Update Password</button>
    </form>

    <script>
        const toggle = document.getElementById('togglePassword');
        const pwd    = document.getElementById('password');
        const cpwd   = document.getElementById('confirm_password');

        toggle.addEventListener('change', function () {
            const type = this.checked ? 'text' : 'password';
            if (pwd)  pwd.type  = type;
            if (cpwd) cpwd.type = type;
        });
    </script>
</body>
</html>
