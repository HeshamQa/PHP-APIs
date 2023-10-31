<?php
// Include the database connection file
require_once 'dbConnect.php';

// Check if the form is submitted
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Retrieve the form data
    $Name = $_POST['Name'];
    $Email = $_POST['Email'];
    $Phone = $_POST['Phone'];
    $Password = $_POST['Password'];

    // Validate the form data
    if (empty($Name) || empty($Email) || empty($Phone) || empty($Password)) {
        // Required fields are missing
        $response = array('status' => 'error', 'message' => 'Please fill in all the fields');
        echo json_encode($response);
    } elseif (!filter_var($Email, FILTER_VALIDATE_EMAIL)) {
        // Invalid email format
        $response = array('status' => 'error', 'message' => 'Invalid email format');
        echo json_encode($response);
    } elseif (strlen($Password) < 6) {
        // Password must be at least 6 characters long
        $response = array('status' => 'error', 'message' => 'Password must be at least 6 characters long');
        echo json_encode($response);
    } elseif (!preg_match('/^[0-9]{10}$/', $Phone)) {
        // Invalid phone number format
        $response = array('status' => 'error', 'message' => 'Invalid phone number format');
        echo json_encode($response);
    } else {
        // Insert the user data into the database
        $sql = "INSERT INTO user (Name, Email, Phone, Password) VALUES ('$Name', '$Email', '$Phone', '$Password')";
        if ($conn->query($sql) === TRUE) {
            // User registration successful
            $response = array('status' => 'success', 'message' => 'User registered successfully');
            echo json_encode($response);
        } else {
            // Error occurred during registration
            $response = array('status' => 'error', 'message' => 'Error: ' . $conn->error);
            echo json_encode($response);
        }
    }

    // Close the database connection
    $conn->close();
}
