<?php
    $stmt = $conn->query("SELECT productLine, textDescription FROM productlines");
   
    if ($stmt -> execute()) {
        $result = array();
        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)){
            $result[] = $row;
        };
    } else {
        echo "Query failed";
    } 
?>