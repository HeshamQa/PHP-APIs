<?php
// Include the database connection file
require_once 'dbConnect.php';

// Check if the form is submitted
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Retrieve the user ID from the request body
    $IdUsers = $_POST['IdUsers'];

    // Retrieve the cart items for the user from the database
    $sql = "SELECT items.Id, items.Name, items.HomeImage, items.Price, cart.Count ,cart.Id
            FROM cart 
            INNER JOIN items ON cart.IdItem = items.Id 
            WHERE cart.IdUsers = '$IdUsers'";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        // Cart items found
        $cartItems = array();
        while ($row = $result->fetch_assoc()) {
            $cartItems[] = $row;
        }

        // Return the cart items as JSON response
        $response = array('status' => 'success', 'cart' => $cartItems);
        echo json_encode($response);
    } else {
        // No cart items found
        $response = array('status' => 'error', 'message' => 'No cart items found');
        echo json_encode($response);
    }

    // Close the database connection
    $conn->close();
}
?>
