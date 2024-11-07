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
		<div style = "float: left; margin: 5px;"><b>Welcome User!</b></div>
		<div style = "float: right; margin: 5px;">Log Out</div>
	</div>
	<div id="container">
	<center>
		<h3>AL Public Library</h3>
		<p>123 Address Lane, Town IN 12345</p>
		<p>(812)555-1234</p>
		<button onclick ="location.href = '/Applications/MAMP/htdocs/libraryHome.html';">Home</button>
    	<button onclick = "location.href = '/Applications/MAMP/htdocs/searchCatalogue.html';">Search Catalogue</button>
	</center>


<?php
	$con = mysqli_connect("localhost", "johnSmith3", "password", "al_library_db");
				if(mysqli_connect_errno($con)){
				echo "Failed to connect to database: " . mysqli_connect_error();
				}
	
	$sql1 = "SELECT inventorytitles.title, holds.position FROM holds JOIN inventorytitles ON holds.inventoryID = inventorytitles.inventoryID WHERE cardNo = 1";
	$sql2 = "SELECT inventorytitles.title, checkOutHistory.checkOutDate, checkOutHistory.dateDue FROM checkOutHistory JOIN inventorytitles ON checkOutHistory.inventoryID = inventorytitles.inventoryID WHERE cardNo = 1 && checkOutHistory.returnDate IS NULL";
	
	echo("On Hold:<br/>");
	$result1 = $con -> query($sql1);
	if($result1 == false){
		echo "Error: ".$con->error;
	} else if (mysqli_num_rows($result1) == 0){
		echo "No current holds.";
	} else {
	echo "<table border = 1><tr><td>Title</td><td>Waitlist</td><td>Position</td></tr>";
	while($row = $result1->fetch_assoc()){
		echo "<tr><td>".$row['title'] . "</td><td>" . $row['position'] . "</td></tr>";
	}
	echo("</table>");
	}

	echo "<br/><hr/>";

	echo("Checked Out: <br/>");
	$result2 = $con -> query($sql2);
	if($result2 == false){
		echo "Error: ".$con->error;
	} else if (mysqli_num_rows($result2) == 0){
		echo "No items currently checked out.";
	}else {
	echo "<table border=1> <tr> <td> Title </td> <td>Date Checked Out</td><td>Date Due</td></tr>";
	while($row = $result2->fetch_assoc()){
		echo "<tr><td>".$row['title'] . "</td><td>" . $row['checkOutDate'] . "</td><td>" . $row['dateDue'] . "</td></tr>";
	}
	echo("</table>");
	}
?>

</div>
</body>
</html>
	
	