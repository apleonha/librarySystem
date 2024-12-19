<?php 
session_start();

// Database connection details
$servername = "localhost"; 
$username = "user";        
$password = "password";            
$dbname = "al_library_db"; 

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Check if the form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Get form inputs
    $user = $_SESSION['cardNo'];
    $pass = $_POST['currentPass'];
	$newPass =$_POST['newPass'];

	$passMessage = "";
	
    // Prepare a statement to prevent SQL injection
    $stmt = $conn->prepare("SELECT * FROM user WHERE cardNo = ? AND password = ?");
    $stmt->bind_param("ss", $user, $pass);

    // Execute the query
    $stmt->execute();
    $result = $stmt->get_result();

    // Check if the user exists
    if ($result->num_rows > 0) {
      	// Prepare statement to update password
            $stmt1 = $conn->prepare("UPDATE user SET password = ? WHERE cardNo = ?");
            $stmt1->bind_param("ss", $newPass, $user);
            $stmt1->execute();

            // Check if the update was successful
            if ($stmt1->affected_rows > 0) {
                $passMessage = "Password change successful.";
                
            } else {
                $passMessage = "Could not change password.";
            }
        } else {
            $passMessage = "Invalid password.";
        }

        // Close statements
        $stmt->close();
        if ($stmt1) {
            $stmt1->close();
        }
    
    } else {
        $passMessage = "Did not change password.";
    }
 
    $_SESSION['passMessage'] = $passMessage;
    header("Location: editUser.php");
	exit();

$conn->close();
		?>
