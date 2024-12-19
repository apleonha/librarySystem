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
	<div id="mainInfo">
		<table style = "padding: 10px;">
			<tr>
				<td>User: </td>
				<td><?php 
					echo htmlspecialchars($_SESSION['name']);
				?>
				</td>
			</tr>
			<tr>
				<td>Library Card No:</td>
				<td><?php 
				echo htmlspecialchars($_SESSION['cardNo']);
				?></td>
			</tr>
			<tr>
				<td>Email:</td>
				<td><?php 
				$con = mysqli_connect("localhost", "user", "password", "al_library_db");
				if(mysqli_connect_errno($con)){
				echo "Failed to connect to database: " . mysqli_connect_error();
				}
				
				$sql = "SELECT email FROM user WHERE cardNo = " . $_SESSION['cardNo'];
				$result = mysqli_query($con, $sql);
				if($result == false){
				echo"Error: ".$con->error;
				}else{
				while($row = mysqli_fetch_array($result)){
					echo $row['email'];} 
					}	
				?></td>
			</tr>
			<tr>
				<td>Phone: </td>
				<td><?php 
				$con = mysqli_connect("localhost", "user", "password", "al_library_db");
				if(mysqli_connect_errno($con)){
				echo "Failed to connect to database: " . mysqli_connect_error();
				}
				
				$sql = "SELECT phone FROM user WHERE cardNo = " . $_SESSION['cardNo'];
				$result = mysqli_query($con, $sql);
				if($result == false){
				echo"Error: ".$con->error;
				}else{
				while($row = mysqli_fetch_array($result)){
					echo $row['phone'];} 
					}	
				?></td>
			</tr>
			<tr>
				<td>Fines Due:</td>
				<td><?php 
				$con = mysqli_connect("localhost", "user", "password", "al_library_db");
				if(mysqli_connect_errno($con)){
				echo "Failed to connect to database: " . mysqli_connect_error();
				}
				
				$sql = "SELECT balance FROM user WHERE cardNo = " . $_SESSION['cardNo'];
				$result = mysqli_query($con, $sql);
				if($result == false){
				echo"Error: ".$con->error;
				}else{
				while($row = mysqli_fetch_array($result)){
					echo $row['balance'];} 
					}	
				?></td>
			</tr>
		</table>
		<br/>
		<hr/>
		<br/>
		<form>
			<center>
			<button type = "button" onclick = "location.href = '/current.php'">Current Holds and CheckOuts</button>
			<button type = "button" onclick = "location.href = '/history.php'">Check Out History</button>
			<button type = "button" onclick = "location.href = 'editUser.php'">Edit Info</button>
			</center>
		</form>
	</div>
	
	</div>
</body>
</html>
