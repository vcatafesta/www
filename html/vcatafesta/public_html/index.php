<!DOCTYPE html>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Gerador de jogos da Sena na Web</title>
      <style>
         th     { border: 0px solid white;}
         td     { border: 0px solid white;}
         table  { border: 1px solid white;}
			body   { background-color: DodgerBlue;}
			h1     {color: white;}
			p      {color: blue;}
      </style>
   </head>

   <body>
      <form method="post" action="sena.php">
      <table style="width:100%" cellpadding="6">
	  	   <tr><th><h1>Sena</th></tr>
         <tr><th><h2>Jogos   : <input type="text" id="jogos"   size="20" name="jogos"   value="10"><td style="text-align:right"></th></tr>
         <tr><th>Dezenas : <input type="text" id="dezenas" size="20" name="dezenas" value="6"> <td style="text-align:right"></th></tr>
         <tr><th>                      <input type="submit" value="Processar palpites"></th></tr>
         </form>
      </table>
   <body>
</table>
</html>
