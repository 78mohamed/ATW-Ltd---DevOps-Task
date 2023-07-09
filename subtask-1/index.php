<?php
// Connect to MySQL database

require __DIR__ . '/vendor/autoload.php';
$dotenv = Dotenv\Dotenv::createImmutable(__DIR__);
$dotenv->load();

$servername = $_ENV['DB_HOST'];
$username = $_ENV['USER_NAME'];
$password = $_ENV['DB_PASSWORD'];
$dbname = $_ENV['DB_NAME'];

$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Get visitor's IP address
$ip = $_SERVER['REMOTE_ADDR'];

// Get current time
date_default_timezone_set('Africa/Cairo');
$time = date('Y-m-d H:i:s');

// Insert IP address and time into database
$sql = "INSERT INTO visitors (ip_address, visit_time) VALUES ('$ip', '$time')";
if ($conn->query($sql) !== TRUE) {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

// Display greeting message
echo "Hello world!" . "<br>";
echo "Hello visitor!" . "<br>";
echo "Your IP address is: " . $ip . "<br>";
echo "The current time is: " . $time . "<br>";
// Close database connection
$conn->close();
?>
