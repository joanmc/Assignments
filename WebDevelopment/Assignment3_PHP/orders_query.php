<?php
    $stmt1 = $conn->prepare("SELECT * FROM orders WHERE status ='In Process'");
    
    if ($stmt1 ->execute()) {
        $result1 = array();
        while ($row = $stmt1->fetch(PDO::FETCH_ASSOC)){
            $result1[] = $row;
        };
    } else {
        echo "Query failed";
    } 

    $stmt2 = $conn->prepare("SELECT * FROM orders WHERE status ='Cancelled'");

    if ($stmt2 ->execute()) {
        $result2 = array();
        while ($row = $stmt2->fetch(PDO::FETCH_ASSOC)){
            $result2[] = $row;
        };
    } else {
        echo "Query failed";
    } 

    $stmt3 = $conn->prepare("SELECT * FROM orders ORDER BY orderDate DESC limit 20");
    
    

    if ($stmt3 ->execute()) {
        $result3 = array();
        while ($row = $stmt3->fetch(PDO::FETCH_ASSOC)){
            $result3[] = $row;
        };
    } else {
        echo "Query failed";
    } 
?>