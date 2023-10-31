<?php
// Include the database connection file
require_once 'dbConnect.php';

// Check if the form is submitted
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Retrieve the item ID and new count from the request body
    $itemId = $_POST['Id'];
    $newCount = $_POST['Count'];

    if ($newCount <= 0) {
        // If the new count is zero or less, delete the item from the cart
        $deleteSql = "DELETE FROM cart WHERE Id = '$itemId'";
        if ($conn->query($deleteSql) === TRUE) {
            // Item deleted successfully
            $response = array('status' => 'success', 'message' => 'Item removed from cart');
            echo json_encode($response);
        } else {
            // Error occurred while deleting the item
            $response = array('status' => 'error', 'message' => 'Error removing item from cart: ' . $conn->error);
            echo json_encode($response);
        }
    } else {
        print_r($itemId);
        // Update the item count in the cart
        $updateSql = "UPDATE cart SET Count = '$newCount' WHERE Id = '$itemId'";
        if ($conn->query($updateSql) === TRUE) {
            // Item count updated successfully
            $response = array('status' => 'success', 'message' => 'Item count updated in cart');
            echo json_encode($response);
        } else {
            // Error occurred while updating the item count
            $response = array('status' => 'error', 'message' => 'Error updating item count in cart: ' . $conn->error);
            echo json_encode($response);
        }
    }

    // Close the database connection
    $conn->close();
}
?>
