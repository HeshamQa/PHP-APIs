<?php
// Database configuration
$servername = 'localhost'; // Replace with your database server name
$username = 'root'; // Replace with your database username
$password = ''; // Replace with your database password
$dbname = 'paintstore'; // Replace with your database name

// Create a new MySQLi instance
$conn = new mysqli($servername, $username, $password, $dbname);

// Check the connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Set the character set
$conn->set_charset("utf8");
?>
