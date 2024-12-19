<?php
// Start the session
session_start();

// Check if there's a sign-up message
$message = isset($_SESSION['signUpMessage']) ? $_SESSION['signUpMessage'] : '';

// Clear the message after displaying it
if ($message) {
    unset($_SESSION['signUpMessage']);
}
?>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <style>
        #header {
            height: 30px;
            color: white;
            padding: none;
            margin: none;
            border: none;
            text-align: center;
            background-color: #6495ED;
        }

        body {
            background-color: #D6EAF8;
            padding: none;
            margin: none;
            border: none;
            overflow: hidden;
            width: 100%;
            height: 500px;
        }

        .message {
            padding: 10px;
            margin-top: 20px;
            background-color: #dff0d8;
            color: #3c763d;
            border: 1px solid #d6e9c6;
            border-radius: 4px;
        }
    </style>

    <script>
    function selectLogIn() {
        var HTML = "<form id = 'signInForm' action='processLogIn.php' method = 'POST'><h2>Log In </h2><table><tr><td>Library Card Number:</td>" +
        "<td><input type='text' name='cardNo' required></td></tr><td>Password: </td><td><input type='password' name='password' required></td>" +
        "</tr><tr><td><button type='submit' value='Log In' />Log In</td><td><button type='reset' value='Clear' />Clear</td>" +
        "</tr></table></form>";

        var content = document.getElementById("content");
        content.innerHTML = HTML;
    }

    function selectSignUp() {
        var HTML = "<form id= 'signUpForm' action='processSignUp.php' method = 'POST'><h2>Sign Up </h2><p>For library patrons already having a library card. See your local branch about getting your own library card!</p>" +
        "<table><tr><td>Library Card Number:</td><td><input type='text' name='cardNo' id = 'cardNo' required></td></tr><tr><td>Phone: </td><td><input type = 'tel' name = 'phone' id = 'phone'></td></tr><tr><td>Email: </td><td><input type = 'email' name = 'email' id = 'email'>" +
        "</td></tr><tr><td>Password: </td><td><input type='password' name='password' id = 'password' required></td></tr><tr><td>Re-enter Password: </td><td><input type = 'password' name= 'password2' id = 'password2' required></td></tr><tr><td><button type='submit' id = 'submit' value='Sign Up' />" + 
        "Sign Up</td><td><button type='reset' value='Clear' id = 'clear' />Clear</td></tr></table></form><span id='errorMessage' class='error'></span>";

        var content = document.getElementById("content");
        content.innerHTML = HTML;

        document.getElementById("signUpForm").addEventListener("submit", function (event) {
            const password = document.getElementById("password").value;
            const confirmPassword = document.getElementById("password2").value;
            const phone = document.getElementById("phone").value.trim();
            const email = document.getElementById("email").value.trim();
            const errorMessage = document.getElementById("errorMessage");

            // Clear previous error message
            errorMessage.textContent = "";

            if (password !== confirmPassword) {
                event.preventDefault();
                errorMessage.textContent = "Passwords do not match!";
            } else if (!phone && !email) {
                event.preventDefault();
                errorMessage.textContent = "Please provide either a phone number or an email address.";
            }
        });
    }
    </script>
</head>
<body>
    <div id="header"></div>
    <div id="container">
        <center>
            <h3>AL Public Library</h3>
            <p>123 Address Lane, Town IN 12345</p>
            <p>(812)555-1234</p>

            <div id="select" style="border: 1px solid black; width: 300px;">
                <input type="radio" name="login" value="login" checked onclick="selectLogIn()">Log In
                <input type="radio" name="login" value="signup" onclick="selectSignUp()"> Sign Up<br/>
            </div>

            <div id="content">
                <form action="processLogIn.php" method="POST">
                    <h2>Log In</h2>
                    <table>
                        <tr>
                            <td>Library Card Number:</td>
                            <td><input type="text" name="cardNo" required></td>
                        </tr>
                        <tr>
                            <td>Password: </td>
                            <td><input type="password" name="password" required></td>
                        </tr>
                        <tr>
                            <td><button type="submit" value="Log In" />Log In</td>
                            <td><button type="reset" value="Clear" />Clear</td>
                        </tr>
                    </table>
                </form>
            </div>

            <?php if ($message): ?>
                <div class="message"><?php echo htmlspecialchars($message); ?></div>
            <?php endif; ?>
        </center>
    </div>
</body>
</html>
