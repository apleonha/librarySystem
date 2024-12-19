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

    // Initialize session message
    $signUpMessage = "";

    // Add a check to prevent undefined $stmt1 error
    $stmt1 = null;

    // Check if both email and phone are provided
    if (isset($_POST['email']) && isset($_POST['phone'])) {
        $email = $_POST['email'];
        $phone = $_POST['phone'];

        // Prepare statement to check user
        $stmt = $conn->prepare("SELECT * FROM user WHERE cardNo = ? AND email = ? AND phone = ? AND password IS NULL");
        $stmt->bind_param("sss", $user, $email, $phone);
        $stmt->execute();
        $result = $stmt->get_result();


        // Check if the user exists
        if ($result->num_rows > 0) {
            // Prepare statement to update password
            $stmt1 = $conn->prepare("UPDATE user SET password = ? WHERE cardNo = ?");
            $stmt1->bind_param("ss", $pass, $user);
            $stmt1->execute();

            // Check if the update was successful by checking affected rows
            if ($stmt1->affected_rows > 0) {
                $signUpMessage = "Sign-up successful! You can now log in.";
            } else {
                $signUpMessage = "Sign-up unsuccessful. Check credentials and try again.";
            }
        } else {
            $signUpMessage = "Sign-up unsuccessful. Check credentials and try again.";
        }

        // Close statements
        $stmt->close();
        if ($stmt1) {
            $stmt1->close();
        }
    } 
    // If only email is provided
    else if (isset($_POST['email'])) {
        $email = $_POST['email'];

        // Prepare statement to check user
        $stmt = $conn->prepare("SELECT * FROM user WHERE cardNo = ? AND email = '? AND password IS NULL");
        $stmt->bind_param("ss", $user, $email);
        $stmt->execute();
        $result = $stmt->get_result();

        // Check if the user exists
        if ($result->num_rows > 0) {
            // Prepare statement to update password
            $stmt1 = $conn->prepare("UPDATE user SET password = '?' WHERE cardNo = ?");
            $stmt1->bind_param("ss", $pass, $user);
            $stmt1->execute();

            // Check if the update was successful
            if ($stmt1->affected_rows > 0) {
                $signUpMessage = "Sign-up successful! You can now log in.";
            } else {
                $signUpMessage = "Sign-up unsuccessful. Check credentials and try again.";
            }
        } else {
            $signUpMessage = "Sign-up unsuccessful. Check credentials and try again.";
        }

        // Close statements
       $stmt->close();
        if ($stmt1) {
        $stmt1->close();
        }
    }
    // If only phone is provided
    else if (isset($_POST['phone'])) {
        $phone = $_POST['phone'];

        // Prepare statement to check user
        $stmt = $conn->prepare("SELECT * FROM user WHERE cardNo = ? AND phone = ? AND password IS NULL");
        $stmt->bind_param("ss", $user, $phone);
        $stmt->execute();
        $result = $stmt->get_result();

        // Check if the user exists
        if ($result->num_rows > 0) {
            // Prepare statement to update password
            $stmt1 = $conn->prepare("UPDATE user SET password = ? WHERE cardNo = ?");
            $stmt1->bind_param("ss", $pass, $user);
            $stmt1->execute();

            // Check if the update was successful
            if ($stmt1->affected_rows > 0) {
                $signUpMessage = "Sign-up successful! You can now log in.";
                
            } else {
                $signUpMessage = "Sign-up unsuccessful. Check credentials and try again.";
            }
        } else {
            $signUpMessage = "Sign-up unsuccessful. Check credentials and try again.";
        }

        // Close statements
        $stmt->close();
        if ($stmt1) {
            $stmt1->close();
        }
    }

    // Set session message and redirect to login
    $_SESSION['signUpMessage'] = $signUpMessage;
    header("Location: login.php");
	exit();
}

// Close connection
$conn->close();
?>