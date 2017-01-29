<?php 
function displayTable($result, $tableNum){
    
    if (count($result) == count($result, COUNT_RECURSIVE)) 
    {
        //echo 'array is not multidimensional';
        $keys = array_keys($result);
        echo "<br><br><table id=table" . $tableNum . "><tr>";
        $i = 1;
        foreach ($keys as $item){
            echo "<th class=col" . $i . ">" . $item. "</th>";
            $i += 1;
        }
        echo "</tr>";
        
        echo "<tr>";
        $i = 1;
        foreach ($result as $k => $v){
            echo "<td class=col" . $i . ">" . $v. "</td>";
            $i += 1;
        }
        echo "</tr>";
    }
    else
    {
        //echo 'array is multidimensional';
        $keys = array_keys($result[0]);
        echo "<table id=table" . $tableNum . "><tr>";
        $i = 1;
        foreach ($keys as $item){
            echo "<th class=col" . $i . ">" . $item. "</th>";
            $i += 1;
        }
        echo "</tr>";
        
        $i = 1;
        foreach ($result as $array) {
            echo "<tr class=row" . $i . ">";
            $j = 1;
            foreach ($array as $k => $v){
                echo "<td class=col" . $j . ">"  . $v. "</td>";
                $j += 1;
            }
            echo "</tr>";
            $i += 1;
        }
        echo "</table><br><br>";
    }
}
?>