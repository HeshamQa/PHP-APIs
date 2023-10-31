<?php
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $Email = $_POST['Email'];
    $Password = $_POST['Password'];
    $sql = "SELECT * FROM user WHERE Email = '$Email' AND `Password` = '$Password'";
    require_once("dbConnect.php");
    $result = mysqli_query($conn, $sql);

    if ($result === false) {
        // Error occurred during query execution
        echo json_encode(array('result' => false, 'msg' => mysqli_error($conn)));
    } elseif (mysqli_num_rows($result) > 0) {
        // User login successful
        $row = mysqli_fetch_array($result);
        echo json_encode(array(
            'result' => true,
            'Id' => (int) $row['Id'],
            'Name' => $row['Name'],
            'Email' => $row['Email'],
            'Phone' => $row['Phone'],
            'IdUserType' => (int) $row['IdUserType'],
        ));
    } else {
        // Invalid credentials
        echo json_encode(array('result' => false, 'msg' => 'email or password incorrect'));
    }
    mysqli_close($conn);
}
?>
