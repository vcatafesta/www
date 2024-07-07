#!/bin/bash


echo -e 'Content-type: text/html

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
   <title>Welcome - Gerador de palpites da MegaSena</title>
   <meta name="description" content="Gerador de palpite da MegaSena.">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
   <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800&display=swap">
   <script src="https://kit.fontawesome.com/d5beb840ab.js" crossorigin="anonymous"></script>
</head>
<style>
	html {
  		font-family: 'Open Sans', sans-serif;
  		height: 100%;
  		margin: 0px;
  		padding: 0px;
  		width: 100%;
   	border: 1px solid #000;
		border-radius: 10px;
	}

   header   {
   	background-color: blue;
   	border: 1px solid white;
		border-radius: 10px;
   }

   body   {
   	background-color: DodgerBlue;
   	border: 1px solid black;
		border-radius: 10px;
   }
	table {
   	background-color: blue;
   	border: 1px solid white;
		border-radius: 10px;
	}
	th     { border: 0px solid white;}
   td     { border: 0px solid white;}
   h1     { color: yellow;}
   h2     { color: white;}
   p      { color: blue;}

	.jogos1 {
	    position:relative;
	    left:50%;
	    margin-left:-180px;
	    color:#FFF;
	    font-weight:700;
	}
	.jogos {
		 position: relative;
	    width: 20%;
	    margin: auto;
		 color:#FFF;
	    font-weight:700;
	}
	.resultado {
		 position: relative;
	    width: 50%;
	    margin: auto;
		 color:#FFF;
	    font-weight:700;
	}
	.table-responsive{
  		width: 100% !important;
	}

	.table {
   	border: 1px solid red;
    	width: 50% !important; /*Importante manter o !important rs */
    	margin: auto;
	}

	.table-status {
		margin-top: 20px;
    	margin-bottom: 20px !important;
	}

	form [type="submit"] {
   	display: block;
    	margin: auto;
	}

	form [type="reset"] {
   	display: block;
    	margin: auto;
	}

	.botao{
 		color: #FFF;
    	background-color: green;
    	height: 40px;
    	line-height: 30px;
    	padding: 0 20px;
    	text-transform: capitalize;
 		font-size: 14px;
    	font-weight: bold;
    	cursor: pointer;
    	border-radius: 20px;
	}

	.botao:hover {
    	transform: scale(1.05);
	}

</style>
<header>
<body>
'
echo -e "<form method=GET action=\"${SCRIPT}\">
				<table class="resultado">
			  		<caption><h1>ENTRE COM DADOS PARA GERAR PALPITES</h1></caption>
		     		<tr>
		     			<td>Entre com a quantidade de Palpites/Jogos    : </td>
		     				<td>
		     					<input type="text" name="val_x"> min 1
		     				</td>
		     			</tr>
		     			<tr>
		     				<td>Entre com a quantidade de Dezenas cada jogo : </td>
		     			<td>
		     				<input type="text" name="val_y"> min 6 - max 15
		     			</td>
		     		</tr>
		 	  	</table>
				<br>
					<input class="botao" type="submit" value="Gerar palpites">
					<input class="botao" type="reset"  value="Limpar">
			</form>
"

if [ "$REQUEST_METHOD" != "GET" ]; then
	echo "<hr>Script Error:"\
        "<br>Usage error, cannot complete request, REQUEST_METHOD!=GET."\
        "<br>Check your FORM declaration and be sure to use METHOD=\"GET\".<hr>"
	exit 1
fi

echo '</header>'

if [ -z "$QUERY_STRING" ]; then
	exit 0
else
	XX=`echo "$QUERY_STRING" | sed -n 's/^.*val_x=\([^&]*\).*$/\1/p' | sed "s/%20/ /g"`
	YY=`echo "$QUERY_STRING" | sed -n 's/^.*val_y=\([^&]*\).*$/\1/p' | sed "s/%20/ /g"`
	ZZ=`echo "$QUERY_STRING" | sed -n 's/^.*val_z=\([^&]*\).*$/\1/p' | sed "s/%20/ /g"`
	echo -e "<div class="container">
					<div class="table-responsive">
						<table class="jogos table table-status">
							<thead>
	  							<tr class="status">
	  								<th><span><h2>  JOGOS $XX</h1></span></th>
	  								<td>
	  								<th><span><h2>DEZENAS $YY</h1></span></th>
	  								</td>
								</tr>
							</thead>
						</table>
					</div>
				</div>
				<div class="container">
					<div class="table-responsive">
						<table class="resultado table table-status">
							<caption><h1>PALPITES GERADOS</caption>
							<thead>
	  							<tr class="status">
									<th><strong><h1><pre>$(/opt/sena/sena --resume --nocolor -j $XX $YY)</pre></th>
								</tr>
							</thead>
						</table>
					</div>
				</div>

				<div class="container">
					<div class="table-responsive">
						<table class="resultado table table-status">
							<caption><h1>RECADO</caption>
							<thead>
	  							<tr class="status">
	  								<th><span><h2>Caso ganhar, considere fazer alguma doacao para os desenvolvedores deste software :)</h2></span></th>
								</tr>
							</thead>
						</table>
					</div>
				</div>
			  "
 fi
echo '</body>'
echo '</html>'
exit 0
