<?php
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $Id = $_POST['Id'];
    $Name = $_POST['Name'];
    $Phone = $_POST['Phone'];
    
    // Include the database connection file
    require_once 'dbConnect.php';

    // Update the profile in the database
    $sql = "UPDATE user SET Name = '$Name', Phone = '$Phone' WHERE Id = '$Id'";
    if ($conn->query($sql) === TRUE) {
        // Profile update successful
        $response = array('status' => 'success', 'message' => 'Profile updated successfully');
        echo json_encode($response);
    } else {
        // Error occurred during profile update
        $response = array('status' => 'error', 'message' => 'Error updating profile: ' . $conn->error);
        echo json_encode($response);
    }

    // Close the database connection
    $conn->close();
}
?>
