<?php
// Include the database connection file
require_once 'dbConnect.php';

// Check if the form is submitted
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Retrieve the user ID and item ID from the request body
    $userId = $_POST['IdUsers'];
    $itemId = $_POST['IdItems'];

    // Check if the item already exists in the cart
    $checkSql = "SELECT * FROM cart WHERE IdUsers = '$userId' AND IdItem = '$itemId'";
    $checkResult = $conn->query($checkSql);

    if ($checkResult->num_rows > 0) {
        // Item already exists in the cart, increment the count
        $updateSql = "UPDATE cart SET Count = Count + 1 WHERE IdUsers = '$userId' AND IdItem = '$itemId'";
        if ($conn->query($updateSql) === TRUE) {
            // Cart updated successfully
            $response = array('status' => 'success', 'message' => 'Item added to cart');
            echo json_encode($response);
        } else {
            // Error occurred while updating the cart
            $response = array('status' => 'error', 'message' => 'Error updating cart: ' . $conn->error);
            echo json_encode($response);
        }
    } else {
        // Item does not exist in the cart, insert a new record
        $insertSql = "INSERT INTO cart (IdUsers, IdItem, Count) VALUES ('$userId', '$itemId', 1)";
        if ($conn->query($insertSql) === TRUE) {
            // Item added to cart successfully
            $response = array('status' => 'success', 'message' => 'Item added to cart');
            echo json_encode($response);
        } else {
            // Error occurred while adding the item to the cart
            $response = array('status' => 'error', 'message' => 'Error adding item to cart: ' . $conn->error);
            echo json_encode($response);
        }
    }

    // Close the database connection
    $conn->close();
}
?>
