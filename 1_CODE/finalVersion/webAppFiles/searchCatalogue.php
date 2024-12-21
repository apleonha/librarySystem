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
		width:98%;
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
			height: 700px;
		}
		
		form{
		background-color:white;
		padding: 20px 200px;
		margin: 20px 50px;
		}
		
		</style>
		
		<script>
		document.addEventListener("DOMContentLoaded", function () {
  // Initialize with books
  selectBook();
});

function selectBook() {
  const HTML = `
    <form id="searchForm" action="search.php" method="POST">
      <table style="padding:10px; float:center;">
        <tr>
          <td>Item Type:</td>
          <td>
            <fieldset>
              <legend>I'm looking for:</legend>
              <input type="radio" name="type" value="book" checked> books<br/>
              <input type="radio" name="type" value="dvd"> DVDs<br/>
              <input type="radio" name="type" value="cd"> CDs
            </fieldset>
          </td>
        </tr>
        <tr><td>Title: </td><td><input type="text" name="title"></td></tr>
        <tr><td>Author:</td><td><input type="text" name="author"></td></tr>
        <tr><td>Genre:</td><td><input type="text" name="genre"></td></tr>
        <tr>
          <td><button type="submit" name="search">Search Now</button></td>
          <td><button type="reset" name="reset">Reset</button></td>
        </tr>
      </table>
    </form>`;
  document.getElementById("searchInput").innerHTML = HTML;

  addRadioListeners();
}

function selectDVD() {
  const HTML = `
    <form id="searchForm" action="search.php" method="POST">
      <table style="padding:10px; float:center;">
        <tr>
          <td>Item Type:</td>
          <td>
            <fieldset>
              <legend>I'm looking for:</legend>
              <input type="radio" name="type" value="book"> books<br/>
              <input type="radio" name="type" value="dvd" checked> DVDs<br/>
              <input type="radio" name="type" value="cd"> CDs
            </fieldset>
          </td>
        </tr>
        <tr><td>Title: </td><td><input type="text" name="title"></td></tr>
        <tr><td>Director:</td><td><input type="text" name="director"></td></tr>
        <tr><td>Studio:</td><td><input type="text" name="studio"></td></tr>
        <tr><td>Genre:</td><td><input type="text" name="genre"></td></tr>
        <tr>
          <td><button type="submit" name="search">Search Now</button></td>
          <td><button type="reset" name="reset">Reset</button></td>
        </tr>
      </table>
    </form>`;
  document.getElementById("searchInput").innerHTML = HTML;

  addRadioListeners();
}

function selectCD() {
  const HTML = `
    <form id="searchForm" action="search.php" method="POST">
      <table style="padding:10px; float:center;">
        <tr>
          <td>Item Type:</td>
          <td>
            <fieldset>
              <legend>I'm looking for:</legend>
              <input type="radio" name="type" value="book"> books<br/>
              <input type="radio" name="type" value="dvd"> DVDs<br/>
              <input type="radio" name="type" value="cd" checked> CDs
            </fieldset>
          </td>
        </tr>
        <tr><td>Title: </td><td><input type="text" name="title"></td></tr>
        <tr><td>Artist:</td><td><input type="text" name="artist"></td></tr>
        <tr><td>Genre:</td><td><input type="text" name="audioGenre"></td></tr>
        <tr>
          <td><button type="submit" name="search">Search Now</button></td>
          <td><button type="reset" name="reset">Reset</button></td>
        </tr>
      </table>
    </form>`;
  document.getElementById("searchInput").innerHTML = HTML;

  addRadioListeners();
}

function addRadioListeners() {
  const radios = document.querySelectorAll("input[name='type']");
  radios.forEach((radio) => {
    radio.addEventListener("change", (event) => {
      switch (event.target.value) {
        case "book":
          selectBook();
          break;
        case "dvd":
          selectDVD();
          break;
        case "cd":
          selectCD();
          break;
      }
    });
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
		<p>123 Address Lane, Town, IN 12345</p>
		<p>(812)555-1234</p>
	<button onclick ="location.href = '/libraryHome.php';">Home</button>
    <button onclick = "location.href = '/userInfo.php';">My Information</button>
	</center>
	<div id="searchInput">
	<form id="searchForm" action = "search.php" method = "POST">
		<table style="padding:10px; float:center;">
		<tr>
			<td>Item Type:</td>
			<td>
			<fieldset>
			<legend>I'm looking for:</legend>
				<input type="radio" name="type" value="book" checked onclick = "selectBook()"> books<br/>
				<input type="radio" name="type" value="dvd" onclick = "selectDVD()"> DVDs <br/>
				<input type="radio" name="type" value="cd" onclick = "selectCD()"> CDs
			</fieldset>
			</td>
		</tr>
		<tr>
			<td>Title: </td>
			<td><input type="text" name="title"></td>
		</tr>
		<tr>
			<td>Author:</td>
			<td><input type="text" name="author"></td>
		</tr>
		<tr>
			<td>Genre:</td>
			<td><input type="text" name="genre"></td>
		</tr>
		<tr>
			<td><button type="submit" name="search">Search Now</button></td>
			<td><button type="reset" name="reset">Reset</button></td>
		</tr>
		</table>
		</form>
	</div>
	</div>
</body>
</html>


