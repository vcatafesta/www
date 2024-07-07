#!/usr/bin/env bash

export PS4=$'${red}${0##*/}${green}[$FUNCNAME]${pink}[$LINENO]${reset} '
set -x

#[ $# -ne 1 ] && { echo "USO: $0 <arquivo com um jogo por linha> <dezenas do resultado>"; exit 1; }

arquivoresult="resultado.txt"
wget http://loterias.caixa.gov.br/wps/portal/loterias -qO $arquivoresult

if [[ $# -eq 1 ]]; then
	file=$1
	shift
fi

#CHECANDO VALIDADE DO ARQUIVO jogos.txt
#Só tem número:  sed -n  '/[[:punct:][:alpha:]]/p' jogos.txt
#Inserir ENTER no final do arquivo: printf "\n" >> jogos.txt
#Excluir linha em branco: sed -i '/^$/d' jogos.txt
#Checar se os números estão no range <6 e >15: awk -F" " 'NF < 6 ; NF > 15 {print}' jogos.txt

result=$(grep -Eo "<li>[0-9]{2}</li>" < $arquivoresult | head -6 | sed 's/<[^>]*>//g' | sort -n | sed ':a;$!N;s/\n/ /;ta;')
result="02 08 34 38 47 51"

########resultformat=$(echo $result | sed 's/ /-/g')
resultformat="02-08-34-38-47-51"
numconcurso=$(awk -F"|" '{print $1}' < $arquivoresult | rev | sed -E 's/([0-9]{3})/\1./g' | rev | sed 's/^\.//')
datasorteio=$(awk -F"|" '{print $12}' < $arquivoresult)
diasemanasorteio=$(echo $datasorteio | awk -F"/" '{print $3"-"$2"-"$1}')
diasemanasorteio=$(date -d "$diasemanasorteio" | awk '{print $1}')
dataproxsorteio=$(awk -F"|" '{print $23}' < $arquivoresult)
diasemanaproxsorteio=$(echo $dataproxsorteio | awk -F"/" '{print $3"-"$2"-"$1}')
diasemanaproxsorteio=$(date -d "$diasemanaproxsorteio" | awk '{print $1}')

case $diasemanasorteio in
	Sun) diasemanasorteio="Domingo";;
	Mon) diasemanasorteio="Segunda-feira";;
	Tue) diasemanasorteio="Terça-feira";;
	Wed) diasemanasorteio="Quarta-feira";;
	Thu) diasemanasorteio="Quinta-feira";;
	Fri) diasemanasorteio="Sexta-feira";;
	Sat) diasemanasorteio="Sábado";;
esac

case $diasemanaproxsorteio in
	Sun) diasemanaproxsorteio="Domingo";;
	Mon) diasemanaproxsorteio="Segunda-feira";;
	Tue) diasemanaproxsorteio="Terça-feira";;
	Wed) diasemanaproxsorteio="Quarta-feira";;
	Thu) diasemanaproxsorteio="Quinta-feira";;
	Fri) diasemanaproxsorteio="Sexta-feira";;
	Sat) diasemanaproxsorteio="Sábado";;
esac

numganhadoressenacomponto=$(awk -F"|" '{print $4}' < $arquivoresult)
numganhadoresquinacomponto=$(awk -F"|" '{print $6}' < $arquivoresult)
numganhadoresquadracomponto=$(awk -F"|" '{print $8}' < $arquivoresult)
numganhadoressena=$(echo $numganhadoressenacomponto |sed  's/\.//')
numganhadoresquina=$(echo $numganhadoresquinacomponto | sed  's/\.//')
numganhadoresquadra=$(echo $numganhadoresquadracomponto | sed  's/\.//')
[[ $numganhadoressena -lt 2 ]] && strnumganhadoressena="ganhador"
[[ $numganhadoressena -gt 1 ]] && strnumganhadoressena="ganhadores"
[[ $numganhadoresquina -lt 2 ]] && strnumganhadoresquina="ganhador"
[[ $numganhadoresquina -gt 1 ]] && strnumganhadoresquina="ganhadores"
[[ $numganhadoresquadra -lt 2 ]] && strnumganhadoresquadra="ganhador"
[[ $numganhadoresquadra -gt 1 ]] && strnumganhadoresquadra="ganhadores"
premiosena=$(awk -F"|" '{print $5}' < $arquivoresult)
premioquina=$(awk -F"|" '{print $7}' < $arquivoresult)
premioquadra=$(awk -F"|" '{print $9}' < $arquivoresult)
prevpremioproxconcurso=$(awk -F"|" '{print $22}' < $arquivoresult)
qtdemeusjogos=$(wc -l $file | awk '{print $1}')
diasemana=$(date | awk '{print $1}')
data=$(date +%d/%m/%Y)
hora=$(date +%H:%M:%S)
case $diasemana in
Sun) diasemana="Domingo";;
Mon) diasemana="Segunda";;
Tue) diasemana="Terça";;
Wed) diasemana="Quarta";;
Thu) diasemana="Quinta";;
Fri) diasemana="Sexta";;
Sat) diasemana="Sábado";;
esac
busca=${result// /|}


echo "<!DOCTYPE html>"

echo "<html>"
echo "<head>"
echo "<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>"
echo "<style type="text/css">"

echo "/*just bg and body style*/
.container{
background-color:orange;
padding-bottom:20px;
margin-top:10px;
border-radius:5px;
}
.center{
text-align:center;
}
#top{
margin-top:20px;  
}
.btn-container{
background:#fff;
border-radius:5px;
padding-bottom:20px;
margin-bottom:20px;
}
.white{
color:white;
}
.imgupload{
color:#1E2832;
padding-top:40px;
font-size:7em;
}
#namefile{
color:black;
}
h4>strong{
color:#ff3f3f
}
.btn-primary{
border-color: #ff3f3f !important;
color: #ffffff;
text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25);
background-color: #ff3f3f !important;
border-color: #ff3f3f !important;
}

/*these two are set to not display at start*/
.imgupload.ok{
display:none;
color:green;
}
.imgupload.stop{
display:none;
color:red;
}


/*this sets the actual file input to overlay our button*/ 
#fileup{
opacity: 0;
-moz-opacity: 0;
filter: progid:DXImageTransform.Microsoft.Alpha(opacity=0);
width:200px;
cursor: pointer;
position:absolute;
left: 50%;
transform: translateX(-50%);
bottom: 40px;
height: 50px;
}

/*switch between input and not active input*/
#submitbtn{
  padding:5px 50px;
  display:none;
}
#fakebtn{
  padding:5px 40px;
}


/*www.emilianocostanzo.com*/
#sign{
	color:#1E2832;
	position:fixed;
	right:10px;
	bottom:10px;
	text-shadow:0px 0px 0px #1E2832;
	transition:all.3s;
}
#sign:hover{
	color:#1E2832;
	text-shadow:0px 0px 5px #1E2832;
}"
echo "        /*css global tabela*/"
echo "        .full_table_list{border-collapse: collapse;}"
echo "        /*colocando bordas nas linhas*/"
echo "        .full_table_list tr{border:1px black solid;}"
echo "        /*Definido cor das linhas pares*/"
echo "        .full_table_list tr:nth-child(even) {background: #FFF}"
echo "        /*Definindo cor das Linhas ímpares*/"
echo "        .full_table_list tr:nth-child(odd) {background: #DDD}"
echo "        font75 {font-size: 75%;}"
echo "        font75red {font-size: 75%; color: red;}"
echo "        font90 {font-size: 90%;}"
echo "        font125 {font-size: 125%;}"
echo "        font150 {font-size: 150%;}"
echo "</style>"
echo "</head>"
echo "<body>"
echo "<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet">
<div class="container center">
	<div class="row">
		<div class="col-md-12">
			<h1 class="white"><center>Mega Sena CAIXA</center></h1>
			<!-- <p class="white">In this example, submit is allowed only in case the user uploads a valid image file.</p> -->
		</div>
	</div>

		<div class="row">
			<!-- <div class="col-md-6 col-md-offset-3 center"> -->
			<div class="col-md-12">
			    <div class="btn-container">
					<!--the three icons: default, ok file (img), error file (not an img)-->"
<table class="full_table_list" align="center" border="1" cellpadding="0" cellspacing="0">"
    <tr>
        <td><font90><b>Jogo</b></font90></td>
        <td><font90><b>Dezenas</b></font90></td>
        <td><font90><b>Acertos</b></font90></td>
    </tr>






				</div>
			</div>
		</div>
</div>"
echo "<font face="Arial">"
echo "<table align="center" border="0">"
echo "    <tr>"
echo "        <td><font150><b>Resultado do último concurso</b></font150></td>"
echo "    </tr>"
echo "    <tr>"
echo "        <td align="center"><font75><i>Fonte: <a href="http://www1.caixa.gov.br/loterias/loterias/megasena/megasena_pesquisa_new.asp" target="_blank">CAIXA Loterias</a></td>"
echo "    </tr>"
echo "    <tr>"
echo "        <td align="center"><font75><b>$diasemana, $data - $hora hs.</b></font75><p><p></td>"
echo "    </tr>"
echo "</table>"
echo "<table align="center" border="0">"
echo "    <tr>"
echo "        <td><li>Nº concurso: <b>$numconcurso</b></td>"
echo "    </tr>"
echo "    <tr>"
echo "        <td><li>Data sorteio: <b>$datasorteio</b> ($diasemanasorteio)</td>"
echo "    </tr>"
echo "    <tr>"
echo "        <td><li>Dezenas sorteadas: <b>$resultformat</b></td>"
echo "    </tr>"
echo "    </tr>"
echo "    <tr>"
echo "        <td><li>Prêmio sena: <b>R$ $premiosena</b> (<b>$numganhadoressenacomponto</b> $strnumganhadoressena)</td>"
echo "    </tr>"
echo "    </tr>"
echo "    <tr>"
echo "        <td><li>Prêmio quina: <b>R$ $premioquina</b> (<b>$numganhadoresquinacomponto</b> $strnumganhadoresquina)</td>"
echo "    </tr>"
echo "    </tr>"
echo "    <tr>"
echo "        <td><li>Prêmio quadra: <b>R$ $premioquadra</b> (<b>$numganhadoresquadracomponto</b> $strnumganhadoresquadra)</td>"
echo "    </tr>"
echo "    <tr>"
echo "        <td><li>Data próximo sorteio: <b>$dataproxsorteio </b>($diasemanaproxsorteio)</td>"
echo "    </tr>"
echo "    <tr>"
echo "        <td><li>Previsão prêmio próximo concurso: <b>R$ $prevpremioproxconcurso</b><p></td>"
echo "    </tr>"
echo "</table>"
echo "<table align="center" border="0">"
echo "    <tr>"
echo "        <td><font125><b>Conferindo $qtdemeusjogos jogos</b></font125><p align="center"><i><font75>*Dezenas acertadas em</font75><b><font75> negrito</font75></b></p></td>"
echo "    </tr>"
echo "</table>"
echo "<table class="full_table_list" align="center" border="1" cellpadding="0" cellspacing="0">"
echo "    <tr>"
echo "        <td><font90><b>Jogo</b></font90></td>"
echo "        <td><font90><b>Dezenas</b></font90></td>"
echo "        <td><font90><b>Acertos</b></font90></td>"
echo "    </tr>"

contador=1
while read -r line; do
	hits=0
	for i in $result; do
		# marca os numeros acertados com a cor vermelha
		#[[ $(grep -o $i <<< $line) ]] && { let hits++; line=$(sed "s/$i/\<b\>\<font color=red\>$i\<\/font\>\<\/b\>/g"  <<< $line );}
		# marca os numeros acertados com negrito
		[[ $(grep -o $i <<< $line) ]] && { let hits++; line=$(sed "s/$i/\<b\>$i\<\/b\>/g" <<< $line );}
		line=$(echo $line | sed 's/ /-/g')
	done
	[ $hits -gt 0 ] && echo "<td align="center"><font90>$contador</font90></td><td><font90> $line </font90></td>"
	[ $hits -eq 0 ] && echo "<td align="center"><font90>$contador</font90></td><td></font90><font90>$line</font90></td><td align="center"><font90> 0</font90></td>" \
	|| { echo " <td align="center"><font90><b>$hits</b></font90></td>" }
	echo "    <tr>"
	contador=$(($contador+1))
done < $file
echo "<table>"
echo "</body>"
echo "</html>"
rm $arquivoresult
