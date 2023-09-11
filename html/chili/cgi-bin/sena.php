<!DOCTYPE html>
<html lang="pt-br">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Resultado</title>
	<link rel="stylesheet" href="css/style.css">
</head>

<body>
	<?php
		if(isset($_POST['jogos'])){
		   $jogos = $_POST['jogos'];
		   $dezenas = $_POST['dezenas'];
		}
		$output = `/opt/sena/sena --resume --nocolor -j $jogos $dezenas`;
		echo "<pre><h1>$output</h1></pre>";
	?>
</body>

</head>
</html>
