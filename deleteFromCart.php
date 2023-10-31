<?php
// Include the database connection file
require_once 'dbConnect.php';

// Check if the form is submitted
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Retrieve the item ID from the request body
    $Id = $_POST['Id'];

    // Delete the item from the cart
    $deleteSql = "DELETE FROM cart WHERE Id = $Id";
    if ($conn->query($deleteSql) === TRUE) {
        // Item deleted successfully
        $response = array('status' => 'success', 'message' => 'Item removed from cart');
        echo json_encode($response);
    } else {
        // Error occurred while deleting the item
        $response = array('status' => 'error', 'message' => 'Error removing item from cart: ' . $conn->error);
        echo json_encode($response);
    }

    // Close the database connection
    $conn->close();
}
?>
