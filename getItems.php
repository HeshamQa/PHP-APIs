<?php
// Include the database connection file
require_once 'dbConnect.php';

// Check if the form is submitted
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Retrieve the items from the database
    $sql = "SELECT * FROM items";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        // Items found
        $items = array();
        while ($row = $result->fetch_assoc()) {
            $items[] = $row;
        }

        // Return the items as JSON response
        $response = array('status' => 'success', 'items' => $items);
        echo json_encode($response);
    } else {
        // No items found
        $response = array('status' => 'error', 'message' => 'No items found');
        echo json_encode($response);
    }

    // Close the database connection
    $conn->close();
}
?>
