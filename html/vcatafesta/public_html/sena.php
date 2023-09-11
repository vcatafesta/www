<!DOCTYPE html>
<html>
<head>
<style>
	table, th, td {
   	border: 1px solid black;
   }
   body {background-color:green;}
   h1   {color: white;}
   p    {color: red;}
</style>
</head>
<body>
	<?php
		if(isset($_POST['jogos'])){
		   $jogos = $_POST['jogos'];
		   $dezenas = $_POST['dezenas'];
		}
		$output = `/opt/sena/sena --resume --nocolor -j $jogos $dezenas`;
		echo "<pre><h1>$output</pre>";
	?>
</body>
</head>
</html>
