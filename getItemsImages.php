<?php
// Include the database connection file
require_once 'dbConnect.php';

// Check if the form is submitted
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Retrieve the item IDs from the request body
    $itemIds = $_POST['IdItems'];

    // Convert the item IDs to an array
    $itemIds = explode(',', $itemIds);

    // Fetch the item images from the database based on the item IDs
    $itemImages = array();
    foreach ($itemIds as $itemId) {
        $sql = "SELECT * FROM itemimage WHERE IdItems = '$itemId'";
        $result = $conn->query($sql);
        while ($row = $result->fetch_assoc()) {
            $itemImages[] = $row;
        }
    }

    // Return the item images as a JSON response
    $response = array('status' => 'success', 'itemimages' => $itemImages);
    echo json_encode($response);

    // Close the database connection
    $conn->close();
}
?>
