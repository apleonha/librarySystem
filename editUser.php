<?php
		// Start the session
		session_start();

		// Check if the user is logged in
		if (!isset($_SESSION['cardNo']) || !isset($_SESSION['name'])) {
   		// Redirect to login page if not logged in
    	header("Location: login.php");
   		exit();
		}
		
		
		// Check if there's a sign-up message
		$emessage = isset($_SESSION['editMessage']) ? $_SESSION['editMessage'] : '';

		// Clear the message after displaying it
		if ($emessage) {
    	unset($_SESSION['editMessage']);
		}
		
		// Check if there's a sign-up message
		$pmessage = isset($_SESSION['passMessage']) ? $_SESSION['passMessage'] : '';

		// Clear the message after displaying it
		if ($pmessage) {
    	unset($_SESSION['passMessage']);
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
		function changePassword() {
		var HTML = "<form id = 'changePassForm' action='changePass.php' method = 'POST'><table><tr><td>Current Password:</td>" +
        "<td><input type='password' name='currentPass' id = 'currentPass' required></td></tr><tr><td>New Password: </td><td><input type='password' name='newPass' id = 'newPass' required></td></tr>" +
        "<tr><td>Re-Enter New Password: </td><td><input type='password' name= 'newPass2' id = 'newPass2' required></td></tr><tr><td><button type='submit'>Submit</button></td><td><button type='reset'>Clear</button></td>" +
        "</tr></table></form><span id='errorMessage' class='error'></span>";

        var content = document.getElementById("passChange");
        content.innerHTML = HTML;
        
        document.getElementById("changePassForm").addEventListener("submit", function (event) {
            const password = document.getElementById("newPass").value;
            const confirmPassword = document.getElementById("newPass2").value;
            const errorMessage = document.getElementById("errorMessage");

            // Clear previous error message
            errorMessage.textContent = "";

            if (password !== confirmPassword) {
                event.preventDefault();
                errorMessage.textContent = "Passwords do not match!";
            }
        	});
		}
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
	<form id="editForm" action="processEdits.php" method="POST">
		<table style = "padding: 10px;">
		<?php
		// Database connection
		$con = mysqli_connect("localhost", "user", "password", "al_library_db");
		if(mysqli_connect_errno($con)){
   			 echo "Failed to connect to database: " . mysqli_connect_error();
			}
		// Fetch user data once
		$sql = "SELECT firstName, lastName, email, phone FROM user WHERE cardNo = " . $_SESSION['cardNo'];
		$result = mysqli_query($con, $sql);
		if($result == false){
    		echo "Error: " . mysqli_error($con);
		} else {
   			 $user = mysqli_fetch_assoc($result);
			}
		?>
			<tr>
				<td>User: </td>
				<td><input type = 'text' id = 'firstName' name = 'firstName' value = "<?php echo htmlspecialchars($user['firstName']); ?>" required>
				<input type = 'text' id = 'lastName' name = 'lastName' value = "<?php echo htmlspecialchars($user['lastName']); ?>" required>
				</td>
			</tr>
			<tr>
				<td>Email: </td>
				<td><input type = 'email' id = 'email' name = 'email' value = "<?php echo htmlspecialchars($user['email']); ?>" required></td>
				</tr>
				<tr>
				<td>Phone: </td>
				<td><input type = 'tel' id = 'phone' name = 'phone' value = "<?php echo htmlspecialchars($user['phone']); ?>" required></td>
			</tr>
		</table>
		 <?php if ($emessage): ?>
                <div class="message"><?php echo htmlspecialchars($emessage); ?></div>
            <?php endif; ?>
		<br/>
		<hr/>
		<br/>
			<center>
			<button type="submit">Save</button>
			<button type = "reset">Reset</button>
            <button type = "button" onclick = "location.href = 'userInfo.php'">Exit</button>
			</center>
		</form>
		<br/><br/>
		<center><div id="passChange"><button type = "button" onclick = "changePassword()"/>Change Password</div>
		<br/><?php if ($pmessage): ?>
                <div class="message"><?php echo htmlspecialchars($pmessage); ?></div>
            <?php endif; ?></center>
		
	</div>
	
	</div>
</body>