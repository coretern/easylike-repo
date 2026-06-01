<?php
// Check if the script is already installed
if (file_exists('../app/config.php')) {
    header('Location: success');
    exit;
}

// Step 1: Collect database credentials and domain
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['step']) && $_POST['step'] == 1) {
    // Validate inputs (example: simple validation, you can enhance this further)
    $db_host = filter_var($_POST['db_host'], FILTER_SANITIZE_STRING);
    $db_user = filter_var($_POST['db_user'], FILTER_SANITIZE_STRING);
    $db_pass = $_POST['db_pass']; // Consider password security measures
    $db_name = filter_var($_POST['db_name'], FILTER_SANITIZE_STRING);
    $domain = filter_var($_POST['domain'], FILTER_SANITIZE_URL);

    // Create database connection (improve error handling)
    $conn = new mysqli($db_host, $db_user, $db_pass, $db_name);
    if ($conn->connect_error) {
        die('Connection failed: ' . $conn->connect_error);
    }

    // Import the database schema (improve error handling)
    $sql = file_get_contents('database.sql');
    if ($conn->multi_query($sql) === TRUE) {
        do {
            // Grab the next result
            if ($result = $conn->store_result()) {
                $result->free();
            }
        } while ($conn->next_result());
        
        // Create configuration file (improve file writing security)
        $config_content = "<?php
define('PATH', realpath('.'));
define('SUBFOLDER', false);
define('URL', 'https://$domain');
define('STYLESHEETS_URL', '//$domain');
date_default_timezone_set('Asia/Kolkata');

/*
ini_set('display_errors', '1');
error_reporting(E_ALL);
*/

error_reporting(0);
return [
  'db' => [
    'name'    => '$db_name',
    'host'    => '$db_host',
    'user'    => '$db_user',
    'pass'    => '$db_pass',
    'charset' => 'utf8mb4'
  ]
];
?>";

        if (file_put_contents('../app/config.php', $config_content) !== false) {
            // Send installation details to admin email
            @sendInstallationEmail($domain);
            header('Location: success.php');
            exit;
        } else {
            die('Error writing configuration file.');
        }
    } else {
        die('Error importing database: ' . $conn->error);
    }
}

function sendInstallationEmail($domain) {
    $to = 'ownsmmpanel@gmail.com';
    $subject = 'New SMM Panel Installation';
    $message = "A new instance of SMM Panel has been installed.\n\n";
    $message .= "Domain: $domain\n";
    $headers = 'From: no-reply@ownsmmpanel.in' . "\r\n" .
               'Reply-To: no-reply@ownsmmpanel.in' . "\r\n" .
               'X-Mailer: PHP/' . phpversion();

    return mail($to, $subject, $message, $headers);
}

?>
<!DOCTYPE html>
<html>
<head>
    <title>Install SMM Panel</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 400px;
            margin: 50px auto;
            padding: 20px;
            background: #fff;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            border-radius: 8px;
        }

        h2 {
            text-align: center;
            color: #333;
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            color: #333;
        }

        input[type="text"],
        input[type="password"] {
            width: calc(100% - 22px);
            padding: 10px;
            margin: 5px 0 10px 0;
            display: inline-block;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            width: 100%;
            background-color: #4CAF50;
            color: white;
            padding: 10px 15px;
            margin: 10px 0;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>SMM Panel Installer</h2>
        <form method="post" id="install-form">
            <input type="hidden" name="step" value="1">
            <div class="form-group">
                <label for="db_host">Database Host:</label>
                <input type="text" name="db_host" id="db_host" required><br>
            </div>
            <div class="form-group">
                <label for="db_user">Database User:</label>
                <input type="text" name="db_user" id="db_user" required><br>
            </div>
            <div class="form-group">
                <label for="db_pass">Database Password:</label>
                <input type="password" name="db_pass" id="db_pass" required><br>
            </div>
            <div class="form-group">
                <label for="db_name">Database Name:</label>
                <input type="text" name="db_name" id="db_name" required><br>
            </div>
            <div class="form-group">
                <label for="domain">Domain:</label>
                <input type="text" name="domain" id="domain" required><br>
            </div>
            <input type="submit" value="Install">
        </form>
    </div>
    <script src="js/script.js"></script>
</body>
</html>
