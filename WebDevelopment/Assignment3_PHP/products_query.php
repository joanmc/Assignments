<?php
    $stmt2 = $conn->prepare("SELECT * FROM products WHERE productLine = :parameter");
    $stmt2->bindParam(':parameter', $_GET['products'], PDO::PARAM_STR);
    
    if ($stmt2 -> execute()) {
        $result2 = array();
        while ($row = $stmt2->fetch(PDO::FETCH_ASSOC)){
        $result2[] = $row;
        };
    } else {
        echo "Query failed";
    }
?>