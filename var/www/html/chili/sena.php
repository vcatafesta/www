<!DOCTYPE html>
<html>
<head>
<style>
	table, th, td {
   	border: 1px solid black;
   }
   body {background-color:Tomato;}
   h1   {color: blue;}
   p    {color: red;}
</style>
</head>
<body>
	<?php
		if(isset($_POST['jogos'])){
		   $jogos = $_POST['jogos'];
		   $dezenas = $_POST['dezenas'];
		}
		$output = `/opt/sena/sena --nocolor -j $jogos $dezenas`;
		echo "<pre>$output</pre>";
	?>
</body>
</head>
</html>
