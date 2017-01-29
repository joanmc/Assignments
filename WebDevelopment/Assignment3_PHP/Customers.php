<!DOCTYPE html>
<html>
    <head>
		<title>Customers</title>
        <link rel="icon" type="image/x-icon" href="images/car.ico" />
        <link rel="stylesheet" type="text/css" href="css/reset.css"/>
		<link type="text/css" rel="stylesheet" href="css/style.css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <link href='https://fonts.googleapis.com/css?family=Josefin+Sans' rel='stylesheet' type='text/css'>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
	</head>
    
    <body>
        <div class="menu">
            <?php include 'menu.php';?>
        </div>
        <div id="content">
            <h1>Customers</h1>
            <?php include 'connectDB.php';?>
            <?php include 'customers_query.php';?>
            <?php include 'display_table.php';
                    displayTable($result3, 1);?>
            <script>
                $click = 0;
                
                $(document).ready(function() {
                        $('td:nth-child(1),th:nth-child(1)').hide();
                        $('td:nth-child(3),th:nth-child(3)').hide();
                        $('td:nth-child(4),th:nth-child(4)').hide();
                        $('td:nth-child(5),th:nth-child(5)').hide();
                        $('td:nth-child(7),th:nth-child(7)').hide();
                });
                
                $('tr td').click(function(){
                    if($(this).index() == 1) {
                        var row = $(this).parent().parent().children().index($(this).parent());
                        var rowClass = "row" + row;
                    if($click == 0) {
                        $('th:nth-child(1)').show();
                        $('th:nth-child(3)').show();
                        $('th:nth-child(4)').show();
                        $('th:nth-child(5)').show();
                        $('th:nth-child(7)').show();
                        $click += 1;
                    }
                        
                        $('.' + rowClass + ' td:nth-child(1)').toggle();
                        $('.' + rowClass + ' td:nth-child(3)').toggle();
                        $('.' + rowClass + ' td:nth-child(4)').toggle();
                        $('.' + rowClass + ' td:nth-child(5)').toggle();
                        $('.' + rowClass + ' td:nth-child(7)').toggle();
                    }
                });
                
            </script>
            <?php $conn=null;?>
        </div>
        <?php include 'footer.php';?>

    </body>
</html>