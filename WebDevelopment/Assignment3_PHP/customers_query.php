<?php
    $stmt3 = $conn->prepare("SELECT customerNumber, customerName, phone, addressLine1, city, country, creditLimit FROM customers GROUP BY country");
    
     if ($stmt3->execute()) {
        $result3 = array();
        while ($row = $stmt3->fetch(PDO::FETCH_ASSOC)){
            $result3[] = $row;
        };
    } else {
        echo "Query failed";
    } 
?>