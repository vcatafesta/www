#!/bin/bash
_VERSION_='2.56.20220714'
DEPENDENCIES=(curl wget grep printf mktemp sort sed awk tail cat tput stat dialog whiptail find jq)

#paths/files/urls
CPATH=$PWD
filejogos="$CPATH/jogos.txt"
filejogosformatado="$CPATH/jogosformatado.txt"
fileresult="$CPATH/resultadosena.txt"
fileUltSorteio='/tmp/UltSorteio.txt'
fileUltSorteioAtualizado='/tmp/UltSorteioAtualizado.txt'
SITE='https://servicebus2.caixa.gov.br/portaldeloterias/api/megasena/'
URL_GITHUB_RESULTADOSENA='https://github.com/vcatafesta/sena/raw/main/resultadosena.txt'
function mensagem {
echo "<html>
  <body> 
  <font face="Arial"> Arial </font>
  <font face="Courier"> Courier </font>
  <font face="Georgia"> Georgia </font>
  <font face="Helvetica"> Helvetica </font>
  <font face="Times"> Times </font>
  <font face="Tribuchet"> Trebuchet </font>
  <font face="Verdana"> Verdana </font>
 </body>
 </html>"
}

function help {
echo "<html>
  <body> 
   <font face="Arial" color="red"> Versão:  $_VERSION_</font>
Uso:
   sena -j 3                # jogar 03 palpites (padrão 6 dezenas)
   sena -j 10               # jogar 10 palpites (padrão 6 dezenas)
   sena -j 10 6             # jogar 10 palpites com 06 (min) dezenas
   sena -j 5 15             # jogar 05 palpites com 15 (max) dezenas
   sena -h | --help         # este help
   sena -c | --compare      # comparar palpites com o BD
   sena -l | --log          # exibir log de palpites efetuados - (exibição com dialog sem bordas - default)
   sena -lw | --logw        # exibir log de palpites efetuados - (exibiçao com whiptail)
   sena -ld | --logd        # exibir log de palpites efetuados - (exibição com dialog com bordas)
   sena -U | --update       # atualizar BD com a CAIXA
   sena -F | --force        # força a atualização do zero do BD com a CAIXA
   sena -V | --version      # exibe versão do aplicativo
 </body>
 </html>"
}

function sh_logo {
	echo $_VERSION_
	printf '%s\n' #"$bold$yellow"
	cat << 'LOGO'
   ________  ____  ____ _
  / ___/ _ \/ __ \/ __ `/
 (__  )  __/ / / / /_/ /
/____/\___/_/ /_/\__,_/
LOGO
	printf '%s' # "$reset"
}


echo "content-type: text/html"
echo

cat <<FIM
<html>
<head>
<meta charset=UTF-8>
</head>
<body>
<!-- <h2>Informações da máquina</h2>
$(uname -a)
<hr>
$(uptime)
<h2>Variáveis de ambiente do CGI</h2>
<pre>$(env)</pre> -->
<h2>HELP</h2>
<pre>$(help)</pre>
<h2>VERSÃO:$_VERSION_</h2>
<pre>$(mensagem)</pre>
<pre>$(setvarcolors)</pre>
<pre>$(log_prefix)</pre>
<pre>$(check_deps)</pre>
<pre>$(sh_ascii_lines)</pre>
<h2>Variáveis de ambiente do CGI</h2>
<pre>$(env)</pre>
<h2>Logo</h2>
<pre>$(sh_logo)</pre>
<h2>Palpites</h2>
<pre>$(/opt/github/sena/sena --nocolor -j 10 6)</pre>

</body>
</html>
FIM
