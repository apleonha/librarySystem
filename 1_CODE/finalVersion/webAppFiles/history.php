<?php
		// Start the session
		session_start();

		// Check if the user is logged in
		if (!isset($_SESSION['cardNo']) || !isset($_SESSION['name'])) {
   		// Redirect to login page if not logged in
    	header("Location: login.php");
   		exit();
		}
?>

<!DOCTYPE html>
<html>
<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		
		<style>
		#header{
		width:100%;
		height:30px;
		color: white;
		padding:none;
		margin:none;
		border:none;
		text-align: center;
		background-color: #6495ED;
		}
		
		body{
			background-color: #D6EAF8;
			padding: none;
			margin:none;
			border:none;
			width:100%;
			height: 1000px;
		}
		
		#mainInfo {
		background-color:white;
		padding: 20px 200px;
		margin: 20px 50px;
		}
		
		td{
		width: 200px;
		}
		</style>
		
		<script>
		</script>
	</head>
<body>

	<div id="header">
		<div style = "float: left; margin: 5px;"><b>Welcome <?php echo htmlspecialchars($_SESSION['name']);?></b></div>
		<div style = "float: right; margin: 5px;"><a href="logout.php">Log Out</a></div>
	</div>
	<div id="container">
	<center>
		<h3>AL Public Library</h3>
		<p>123 Address Lane, Town IN 12345</p>
		<p>(812)555-1234</p>
		<button onclick ="location.href = '/libraryHome.php';">Home</button>
    	<button onclick = "location.href = '/searchCatalogue.php';">Search Catalogue</button>
	</center>


<?php
	$con = mysqli_connect("localhost", "user", "password", "al_library_db");
				if(mysqli_connect_errno($con)){
				echo "Failed to connect to database: " . mysqli_connect_error();
				}
	
	$sql1 = "SELECT inventorytitles.title, checkOutHistory.checkOutDate, checkOutHistory.dateDue, checkOutHistory.returnDate FROM checkOutHistory JOIN inventorytitles ON checkOutHistory.inventoryID = inventorytitles.inventoryID WHERE cardNo = " . $_SESSION['cardNo'];
	
	$result1 = $con -> query($sql1);
	if($result1 == false){
		echo "Error: ".$con->error;
	} else if (mysqli_num_rows($result1) == 0){
		echo "Nothing has been checked out yet.";
	} else {
	echo "<table border = 1><tr><td>Title</td><td>Date Checked Out</td><td>Date Due</td><td>Date Returned</td></tr>";
	while($row = $result1->fetch_assoc()){
		echo "<tr><td>".$row['title'] . "</td><td>" . $row['checkOutDate'] . "</td><td>" . $row['dateDue'] . "</td><td>" . $row['returnDate'] . "</td></tr>";
	}
	echo("</table>");
	}
?>

</div>
</body>
</html>
	
	
