<?php
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $Id = $_POST['Id'];
    $Password = $_POST['Password'];
    
    // Include the database connection file
    require_once 'dbConnect.php';

    // Update the password in the database
    $sql = "UPDATE user SET Password = '$Password' WHERE Id = '$Id'";
    if ($conn->query($sql) === TRUE) {
        // Password update successful
        $response = array('status' => 'success', 'message' => 'Password updated successfully');
        echo json_encode($response);
    } else {
        // Error occurred during password update
        $response = array('status' => 'error', 'message' => 'Error updating password: ' . $conn->error);
        echo json_encode($response);
    }

    // Close the database connection
    $conn->close();
}
?>
