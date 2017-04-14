<!DOCTYPE html>
<html>
    <head>
		<title>Products</title>
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
            <h1>Products</h1>
            <?php include 'connectDB.php';?>
            <!-- Format dropdown -->
            <?php include 'index_query.php';?>
        
            <form action="products.php" method="get">
                Select a Product:
                <select id="products" name="products"></select>
                <input type="submit" value="Submit">
            </form>
            <script type="text/javascript">
                var obj = <?php echo json_encode($result); ?>;
                var select = document.getElementById("products");
                for (i = 0; i < obj.length; i += 1) {
                    var option = document.createElement("option");
                    option.value = obj[i].productLine;
                    option.textContent = obj[i].productLine;
                    select.appendChild(option);
                }
            </script>
            <?php include 'products_query.php';?>
            <?php include 'display_table.php';
                    displayTable($result2, 1); ?>
            <?php $conn=null;?>
        </div>
        <?php include 'footer.php';?>
    </body>
    
</html>
