<!DOCTYPE html>
<html>
    <head>
		<title>Orders</title>
        <link rel="icon" type="image/x-icon" href="images/.ico" />
        <link rel="stylesheet" type="text/css" href="css/reset.css"/>
		<link type="text/css" rel="stylesheet" href="css/style.css"/>
		<meta charset="utf-8"/>
        <link href='https://fonts.googleapis.com/css?family=Josefin+Sans' rel='stylesheet' type='text/css'>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
    </head>
    <body>

        <div class="menu">
            <?php include 'menu.php';?>
        </div>
        <div id="content">
            <h1>Orders</h1>
            <?php include 'connectDB.php';?>
            <?php include 'orders_query.php';?>
            <?php include 'display_table.php';
                    echo '<h2>Orders In Process</h2>';
                    displayTable($result1, 1);
                    echo '<h2>Orders Cancelled</h2>';
                    displayTable($result2, 2);
                    echo '<h2>20 Most Recent Orders</h2>';
                    displayTable($result3, 3); ?>
            <script>
              $( document ).ready(function() {
                        $('td:nth-child(3),th:nth-child(3)').hide();
                        $('td:nth-child(4),th:nth-child(4)').hide();
                        $('td:nth-child(6),th:nth-child(6)').hide();
                        $('td:nth-child(7),th:nth-child(7)').hide();
                });
                
                $('#table1 tr td').click(function(){
                    if($(this).index() == 0){
                        $click1 = 0;
                        if($click1 == 0) {
                            $('#table1 th:nth-child(3)').show();
                            $('#table1 th:nth-child(4)').show();
                            $('#table1 th:nth-child(6)').show();
                            $('#table1 th:nth-child(7)').show();
                            $click1 += 1;
                        }
                        
                        var row = $(this).parent().parent().children().index($(this).parent());
                        var rowClass = "row" + row;
                        $('#table1 .' + rowClass + ' td:nth-child(3)').toggle();
                        $('#table1 .' + rowClass + ' td:nth-child(4)').toggle();
                        $('#table1 .' + rowClass + ' td:nth-child(6)').toggle();
                        $('#table1 .' + rowClass + ' td:nth-child(7)').toggle();
                    }
                });
            
                  $('#table2 tr td').click(function(){
                    if($(this).index() == 0){
                        $click2 = 0;
                        if($click2 == 0) {
                            $('#table2 th:nth-child(3)').show();
                            $('#table2 th:nth-child(4)').show();
                            $('#table2 th:nth-child(6)').show();
                            $('#table2 th:nth-child(7)').show();
                            $click2 += 1;
                        }
                        
                        var row = $(this).parent().parent().children().index($(this).parent());
                        var rowClass = "row" + row;
                        $('#table2 .' + rowClass + ' td:nth-child(3)').toggle();
                        $('#table2 .' + rowClass + ' td:nth-child(4)').toggle();
                        $('#table2 .' + rowClass + ' td:nth-child(6)').toggle();
                        $('#table2 .' + rowClass + ' td:nth-child(7)').toggle();
                    }
                });
                
                  $('#table3 tr td').click(function(){
                    if($(this).index() == 0){
                        $click3 = 0;
                        if($click3 == 0) {
                            $('#table3 th:nth-child(3)').show();
                            $('#table3 th:nth-child(4)').show();
                            $('#table3 th:nth-child(6)').show();
                            $('#table3 th:nth-child(7)').show();
                            $click3 += 1;
                        }
                        
                        var row = $(this).parent().parent().children().index($(this).parent());
                        var rowClass = "row" + row;
                        $('#table3 .' + rowClass + ' td:nth-child(3)').toggle();
                        $('#table3 .' + rowClass + ' td:nth-child(4)').toggle();
                        $('#table3 .' + rowClass + ' td:nth-child(6)').toggle();
                        $('#table3 .' + rowClass + ' td:nth-child(7)').toggle();
                    }
                });
            </script>
            <!-- JS - show/hide -->
            <?php $conn=null;?>
        </div>
        <?php include 'footer.php';?>
            
    </body>
</html>
            