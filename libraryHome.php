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
			overflow: hidden;
			width:100%;
			height: 500px;
		}
		</style>
		
		<script>
				
			
		</script>
		

	</head>
<body>
	<div id="header">
		<div style = "float: left; margin: 5px;"><b>Welcome <?php echo htmlspecialchars($_SESSION['name']);?></b></div>
		<div style = "float: right; margin: 5px 10px;"><a href="logout.php">Log Out</a></div>
	</div>
	<div id="container">
	<center>
		<h3>AL Public Library</h3>
		<p>123 Address Lane, Town IN 12345</p>
		<p>(812)555-1234</p>
	
	<form action="/searchCatalogue.php">
    <input type="submit" value="Search Catalogue" />
	</form>
	<form action="/userInfo.php">
    <input type="submit" value="My Information" />
</form>
	</center>
	</div>
</body>
</html>