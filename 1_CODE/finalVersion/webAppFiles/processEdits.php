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


if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = $_POST['email'];
    $phone = $_POST['phone'];
    $user = $_SESSION['cardNo'];
    $firstName = $_POST['firstName'];
    $lastName = $_POST['lastName'];

	 // Initialize message
    $editMessage = "";

    // Check if email already exists
    $stmt = $conn->prepare("SELECT * FROM user WHERE email = ? AND cardNo != ?");
    $stmt->bind_param("ss", $email, $user);
    $stmt->execute();
    $result = $stmt->get_result();
    
    if ($result->num_rows > 0) {
        $editMessage .= "Email already exists!";
    }

    // Check if phone already exists
    $stmt = $conn->prepare("SELECT * FROM user WHERE phone = ? AND cardNo != ?");
    $stmt->bind_param("ss", $phone, $user);
    $stmt->execute();
    $result = $stmt->get_result();
    
    if ($result->num_rows > 0) {
        $editMessage .=  "Phone number already exists!";
    }

    // All validations passed, proceed with updating the database
    if (empty($editMessage)) {
    $stmt = $conn->prepare("UPDATE user SET firstName = ?, lastName = ?, email = ?, phone = ? WHERE cardNo = ?");
    $stmt->bind_param("sssss", $firstName, $lastName, $email, $phone, $user);
    $stmt->execute();

    if ($stmt->affected_rows > 0) {
        $editMessage =  "Information updated successfully.";
        $_SESSION['name'] = $firstName . $lastName;
    } else {
        $editMessage = "No changes made.";
    }
	
    $stmt->close();
    }
}
    // Set message and redirect to login
    $_SESSION['editMessage'] = $editMessage;
    
    header("Location: editUser.php");
	exit();


$conn->close();
?>
