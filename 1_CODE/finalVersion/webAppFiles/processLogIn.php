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
    $user = $_POST['cardNo'];
    $pass = $_POST['password'];

    // Prepare a statement to prevent SQL injection
    $stmt = $conn->prepare("SELECT * FROM user WHERE cardNo = ? AND password = ?");
    $stmt->bind_param("ss", $user, $pass);

    // Execute the query
    $stmt->execute();
    $result = $stmt->get_result();

    // Check if the user exists
    if ($result->num_rows > 0) {
        // Login successful
        session_start();
        
       $row = $result->fetch_assoc();
         $_SESSION['cardNo'] = $row['cardNo'];
         $_SESSION['name'] = $row['firstName'] . " " . $row['lastName'];
        // Redirect to the welcome page
        header("Location: libraryHome.php");
        exit();
    } else {
        // Invalid login
        echo "Invalid username or password.";
    }

    // Close statement and connection
    $stmt->close();
}

$conn->close();
		?>
