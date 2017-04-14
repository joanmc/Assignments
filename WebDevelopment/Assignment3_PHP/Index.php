<!DOCTYPE html>
<html>
    <head>
		<title>Index</title>
        <link rel="icon" type="image/x-icon" href="images/.ico" />
        <link rel="stylesheet" type="text/css" href="css/reset.css"/>
		<link type="text/css" rel="stylesheet" href="css/style.css"/>
		<meta charset="utf-8"/>
        <link href='https://fonts.googleapis.com/css?family=Josefin+Sans' rel='stylesheet' type='text/css'>
	</head>
    
    <body>
        <div class="menu">
            <?php include 'menu.php';?>
        </div>
        <div id="content">
            <h1>Index</h1>
            <?php include 'connectDB.php';?>
            <?php include 'index_query.php';?>
            <?php include 'display_table.php';
                    displayTable($result, 1); ?>
            <?php $conn=null;?>
        </div>
        <?php include 'footer.php';?>

    </body>
</html>