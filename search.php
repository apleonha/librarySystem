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
	<button onclick ="location.href = '/libraryHome.html';">Home</button>
	 <button onclick = "location.href = '/searchCatalogue.html';">Search Catalogue</button>
    <button onclick = "location.href = '/userInfo.php';">My Information</button>
	</center>
	<div id = "container">
	<?php
	$con = mysqli_connect("localhost", "johnSmith3", "password", "al_library_db");
			if(mysqli_connect_errno($con)){
			echo "Failed to connect to database: " . mysqli_connect_error();
		}
	
			
		if(isset($_POST['type']) && $_POST['type'] == 'book'){
			$sqlb = "SELECT bookinfo.ISBN, bookinfo.title, bookinfo.author, genre.genre, bookinfo.status, inventory.waitlist
			FROM bookinfo
			JOIN book ON bookinfo.ISBN = book.ISBN
			JOIN genre ON book.genreID = genre.genreID 
			JOIN inventory ON bookinfo.inventoryID = inventory.inventoryID";
			
			$conditions = []; 
			
			if(!empty($_POST['title'])){
				$title = mysqli_real_escape_string($con, $_POST['title']);
				$conditions[] = "bookinfo.title LIKE '%$title%'";
			} 
			if(!empty($_POST['author'])){
				$author = mysqli_real_escape_string($con, $_POST['author']);
				$conditions[] = "bookinfo.author LIKE '%$author%'";
			} 
			if(!empty($_POST['genre'])){
				$genre = mysqli_real_escape_string($con, $_POST['genre']);
				$conditions[] = "bookinfo.genre LIKE '%$genre%'";
			}
			
			if(count($conditions) > 0){
			$sqlb .= " WHERE " . implode(" AND ", $conditions);
			}
			
			$result = $con -> query($sqlb);
			if($result === false){
				echo "Error: " . $con->error;
			} else {
				echo "<table border = 1><tr><td>ISBN</td><td>Title</td><td>Author</td><td>Genre</td><td>Status</td><td>Waitlist</td></tr>";
			while($row = $result->fetch_assoc()){
				echo "<tr><td>".$row['ISBN'] . "</td><td>" . $row['title'] . "</td><td>" . $row['author'] . "</td><td>" . $row['genre'] . "</td><td>" . $row['status'] . "</td><td>" . $row['waitlist'] . "</td></tr>";
			}
			echo("</table>");
				}
		} else if(isset($_POST['type']) && $_POST['type'] == 'dvd'){
			$sqld = "SELECT dvdinfo.dvdTitle, director.director, studio.studio, genre.genre, dvdinfo.status, inventory.waitlist
				FROM dvdinfo
				JOIN dvd ON dvdinfo.dvdID = dvd.dvdID
				JOIN dvdDirector ON dvd.dvdID = dvdDirector.dvdID
				JOIN director ON dvdDirector.directorID = director.directorID
				JOIN studio ON dvd.studioID = studio.studioID
				JOIN genre ON dvd.genreID = genre.genreID
				JOIN inventory ON dvdinfo.inventoryID = inventory.inventoryID";
			
			$conditions2 = []; 
			
			if(!empty($_POST['title'])){
				$title = mysqli_real_escape_string($con, $_POST['title']);
				$conditions2[] = "dvdinfo.dvdTitle LIKE '%$title%'";
			} 
			if(!empty($_POST['director'])){
				$director = mysqli_real_escape_string($con, $_POST['director']);
				$conditions2[] = "director LIKE '%$director%'";
			} 
			if(!empty($_POST['studio'])){
				$studio = mysqli_real_escape_string($con, $_POST['studio']);
				$conditions2[] = "studio LIKE '%$studio%'";
			} 
			if(!empty($_POST['genre'])){
				$genre = mysqli_real_escape_string($con, $_POST['genre']);
				$conditions2[] = "genre LIKE '%$genre%'";
			}
			
			if(count($conditions2) > 0){
			$sqld .= " WHERE " . implode(" AND ", $conditions2);
			}
			
			$result2 = $con -> query($sqld);
			if($result2 === false){
				echo "Error: " . $con->error;
			} else {
				echo "<table border = 1><tr><td>Title</td><td>Director</td><td>Studio</td><td>Genre</td><td>Status</td><td>Waitlist</td></tr>";
				while($row = $result2->fetch_assoc()){
				echo "<tr><td>".$row['dvdTitle'] . "</td><td>" . $row['director'] . "</td><td>" . $row['studio'] . "</td><td>" . $row['genre'] . "</td><td>" . $row['status'] . "</td><td>" . $row['waitlist'] . "</td></tr>";
				}
				echo("</table>");
				}
		} else if(isset($_POST['type']) && $_POST['type'] == 'cd'){
			$sqlc = "SELECT cdinfo.cdTitle, cdinfo.artistName, audioGenre.audioGenre, cdinfo.status, inventory.waitlist
						FROM cdinfo
						JOIN cd ON cdinfo.cdID = cd.cdID
						JOIN audioGenre ON cd.audioGenreID = audioGenre.audioGenreID 
						JOIN inventory ON cdinfo.inventoryID = inventory.inventoryID";
			
			$conditions3 = []; 
			
			if(!empty($_POST['title'])){
				$ctitle = mysqli_real_escape_string($con, $_POST['title']);
				$conditions3[] = "cdTitle LIKE '%$ctitle%'";
			} 
			if(!empty($_POST['artist'])){
				$artist = mysqli_real_escape_string($con, $_POST['artist']);
				$conditions3[] = "artistName LIKE '%$artist%'";
			} 
			if(!empty($_POST['genre'])){
				$cgenre = mysqli_real_escape_string($con, $_POST['genre']);
				$conditions3[] = "audioGenre LIKE '%$cgenre%'";
			}
			
			if(count($conditions3) > 0){
			$sqlc .= " WHERE " . implode(" AND ", $conditions3);
			}
			
			$result3 = $con -> query($sqlc);
			if($result3 === false){
				echo "Error: " . $con->error;
			} else {
				echo "<table border = 1><tr><td>Title</td><td>Artist</td><td>Genre</td><td>Status</td><td>Waitlist</td></tr>";
				while($row = $result3->fetch_assoc()){
					echo "<tr><td>".$row['cdTitle'] . "</td><td>" . $row['artistName'] . "</td><td>" . $row['audioGenre'] . "</td><td>" . $row['status'] . "</td><td>" . $row['waitlist'] . "</td></tr>";
				}
				echo("</table>");
				}
			} else {
				echo "Invalid Search.";			
			}
?>
	</div>
</body>
</html>

