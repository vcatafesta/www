#!/usr/bin/env bash

arquivoresult="resultado.txt"
SITE='https://servicebus2.caixa.gov.br/portaldeloterias/api/megasena/'
#[ $# -ne 1 ] && { echo "USO: $0 <arquivo com um jogo por linha> <dezenas do resultado>"; exit 1; }
file=$1
shift

function DiaExtenso() {
  case $1 in
  Sun) echo "Domingo" ;;
  Mon) echo "Segunda-feira" ;;
  Tue) echo "Terça-feira" ;;
  Wed) echo "Quarta-feira" ;;
  Thu) echo "Quinta-feira" ;;
  Fri) echo "Sexta-feira" ;;
  Sat) echo "Sábado" ;;
  esac
}

sh_linecount() {
  awk 'END {print NR}' "$1"
}

sh_table() {
  echo "<div>
		   <table class='resultado'>
			<caption>"$2"</caption>
	  	   <tr>
	      	<td bgcolor="$1" align='center'><b>JOGO</td>
		      <td bgcolor="$1" align='center'><b>DEZENAS</td>
		      <td bgcolor="$1" align='center'><b>ACERTOS</td>
	      </tr>
			<br>
	"
}

sh_td_acerto() {
  echo "<td align='center'>$contador</td><td align='center'>$line</td><td align='center'><b>$hits</b></td>"
  echo "<tr>"
}

sh_td_erro() {
  echo "<td align='center'>$contador</td><td align='center'><del>$line</del></td><td align='center'> 0</td>"
  echo "<tr>"
}

curl --compressed --insecure -s --url "$SITE" --output "$arquivoresult"
numconcurso=$(jq -r '.numero' $arquivoresult)
dataProximoConcurso=$(jq -r '.dataProximoConcurso' $arquivoresult)
dataApuracao=$(jq -r '.dataApuracao' $arquivoresult)
Dezena1=$(jq -r '.listaDezenas[range(0;1)]' "$arquivoresult")
Dezena2=$(jq -r '.listaDezenas[range(1;2)]' "$arquivoresult")
Dezena3=$(jq -r '.listaDezenas[range(2;3)]' "$arquivoresult")
Dezena4=$(jq -r '.listaDezenas[range(3;4)]' "$arquivoresult")
Dezena5=$(jq -r '.listaDezenas[range(4;5)]' "$arquivoresult")
Dezena6=$(jq -r '.listaDezenas[range(5;6)]' "$arquivoresult")
listaDezenas=$(jq -r '.listaDezenas[range(0;6)]' "$arquivoresult")
listaDezenas="${listaDezenas//$'\n'/ }" #remove \n
resultformat=$(sed 's/ /-/g' <<<"$listaDezenas")
numGanhadoresSena=$(jq -r '.listaRateioPremio[0].numeroDeGanhadores' "$arquivoresult")
valorPremioSena=$(jq -r '.listaRateioPremio[0].valorPremio' "$arquivoresult" | awk '{printf "%.2f\n" ,$1}' | sed -e :a -e 's/\(.*[0-9]\)\([0-9]\{3\}\)/\1,\2/;ta' | tr ',.' '.,')
numGanhadoresQuina=$(jq -r '.listaRateioPremio[1].numeroDeGanhadores' "$arquivoresult")
valorPremioQuina=$(jq -r '.listaRateioPremio[1].valorPremio' "$arquivoresult" | awk '{printf "%.2f\n" ,$1}' | sed -e :a -e 's/\(.*[0-9]\)\([0-9]\{3\}\)/\1,\2/;ta' | tr ',.' '.,')
numGanhadoresQuadra=$(jq -r '.listaRateioPremio[2].numeroDeGanhadores' "$arquivoresult")
valorPremioQuadra=$(jq -r '.listaRateioPremio[2].valorPremio' "$arquivoresult" | awk '{printf "%.2f\n" ,$1}' | sed -e :a -e 's/\(.*[0-9]\)\([0-9]\{3\}\)/\1,\2/;ta' | tr ',.' '.,')
valorEstimadoProximoConcurso=$(jq -r '.valorEstimadoProximoConcurso' $arquivoresult | awk '{printf "%.2f\n" ,$1}' | sed -e :a -e 's/\(.*[0-9]\)\([0-9]\{3\}\)/\1,\2/;ta' | tr ',.' '.,')
diasemanasorteio=$(echo "$dataApuracao" | awk -F"/" '{print $3"-"$2"-"$1}')
diasemanasorteio=$(date -d "$diasemanasorteio" | awk '{print $1}')
diasemanaproxsorteio=$(echo "$dataProximoConcurso" | awk -F"/" '{print $3"-"$2"-"$1}')
diasemanaproxsorteio=$(date -d "$diasemanaproxsorteio" | awk '{print $1}')
diasemanasorteio=$(DiaExtenso "$diasemanasorteio")
diasemanaproxsorteio=$(DiaExtenso "$diasemanaproxsorteio")

if ((numGanhadoresSena == 0)); then
  numGanhadoresSena="ACUMULADA"
fi

qtdemeusjogos=$(sh_linecount "$file")
diasemana=$(date | awk '{print $1}')
data=$(date +%d/%m/%Y)
hora=$(date +%H:%M:%S)
diasemana=$(DiaExtenso "$diasemana")

echo "<!DOCTYPE html>
<html lang="pt_br">

<head>
  <meta charset='UTF-8'>
  <meta name='description' content='Conferencia de Jogos da MegaSena.'>
  <meta http-equiv='X-UA-Compatible' content='IE=edge'>
  <meta http-equiv='Content-Type' content='text/html charset=UTF-8'>
  <meta name='viewport' content='width=device-width, initial-scale=1.0'>
  <link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css'>
  <link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800 & display=swap'>
  <script src='https://kit.fontawesome.com/d5beb840ab.js' crossorigin='anonymous'></script>
  <link rel='stylesheet' href='style.css'>
  <title>Resultado Loterias</title>
</head>
<body>
  <div>
    <header>
      <h1>Mega Sena CAIXA</h1>
      <h2>Resultado concurso "$numconcurso" ("$dataApuracao")</h2>
      <sub>fonte: <a href='https://loterias.caixa.gov.br/Paginas/Mega-Sena.aspx' target='_blank'>CAIXA Loterias</a></sub>
  </div>
  <br>
  <div>
    <table class='resultado'>
      <tr>
        <td align="center">
          <ul class="resultado-loteria" ng-show="destaque.acumulado">
            <li ng-repeat="dezena in destaque.dezenas " class="ng-binding ng-scope">$Dezena1</li>
            <li ng-repeat="dezena in destaque.dezenas " class="ng-binding ng-scope">$Dezena2</li>
            <li ng-repeat="dezena in destaque.dezenas " class="ng-binding ng-scope">$Dezena3</li>
            <li ng-repeat="dezena in destaque.dezenas " class="ng-binding ng-scope">$Dezena4</li>
            <li ng-repeat="dezena in destaque.dezenas " class="ng-binding ng-scope">$Dezena5</li>
            <li ng-repeat="dezena in destaque.dezenas " class="ng-binding ng-scope">$Dezena6</li>
          </ul>
        </td>
      </tr>
    </table>
  </div>
  <br>

<div>
  <table class="resultado">
    <tr>
      <td>
        <li>Nº concurso:</li>
      </td>
      <td class="td-yellow">
        <b>$numconcurso</b>
      </td>
    </tr>
    <tr>
      <td><li>Data sorteio:</li></td>
      <td class='td-yellow'><b>$dataApuracao</b></td>
      <td class='td-yellow'>(<b>$diasemanasorteio</b>)</td>
    </tr>
    <tr>
      <td>
        <li>Dezenas sorteadas:</li>
      </td>
      <td class='td-yellow'>
        <b>$resultformat</b>
      </td>
    </tr>
    <tr>
      <td>
        <li>Prêmio sena:</li>
      </td>
      <td class='td-yellow'>
        <b>R$ $valorPremioSena</b>
      </td>
      <td class='td-yellow'>(<b>$numGanhadoresSena</b>)</td>
    </tr>
    <tr>
      <td>
        <li>Prêmio quina:</li>
      </td>
      <td class='td-yellow'>
        <b>R$ $valorPremioQuina</b>
      </td>
      <td class='td-yellow'>(<b>$numGanhadoresQuina</b> ganhadores)</td>
    </tr>
    <tr>
      <td>
        <li>Prêmio quadra:</li>
      </td>
      <td class='td-yellow'>
        <b>R$ $valorPremioQuadra</b>
      </td>
      <td class='td-yellow'>(<b>$numGanhadoresQuadra</b> ganhadores)</td>
    </tr>
    <tr>
      <td>
        <li>Data próximo concurso:</li>
      </td>
      <td class='td-yellow'>
        <b>$dataProximoConcurso</b>
      </td>
      <td class='td-yellow'>(<b>$diasemanaproxsorteio</b>)</td>
    </tr>
    <tr>
      <td>
        <li>Previsão prêmio próximo concurso:</li>
      </td>
      <td class='td-yellow'>
        <b>R$ $valorEstimadoProximoConcurso</b>
      </td>
    </tr>
  </table>
</div>
<br>
<div>
  <table class='resultado'>
    <tr>
      <td align='center'>Conferindo (<b>$qtdemeusjogos)</b> jogos</td>
    </tr>
    <tr>
      <td align='center'>Dezenas acertadas em <b><font color=red>vermelho</b></td>
    </tr>
  </table>
</div>
"

declare -a aHits
contador=1
while read -r line; do
  hits=0
  for i in $listaDezenas; do
    # marca os numeros acertados com a cor vermelha
    if grep -qo "$i" <<<"$line"; then
      ((++hits))
      line=$(sed "s/$i/\<b\>\<font color=red\>$i\<\/font\>\<\/b\>/g" <<<"$line")
    fi
  done
  aHits+=($hits,$contador,"$line")
  ((++contador))
done <"$file"

readarray -t Sorted < <(sort -r < <(printf '%s\n' "${aHits[@]}"))
declare -i sena=0
declare -i quina=0
declare -i quadra=0
declare -i acerto=0
declare -i zero=0

for list in "${Sorted[@]}"; do
  hits=$(cut -d, -f1 <<<"$list")
  contador=$(cut -d, -f2 <<<"$list")
  line=$(cut -d, -f3 <<<"$list")

  case $hits in
  6) ! ((sena)) && {
    sh_table "red" "VOCÊ ACERTOU NA SENA!"
    sena=1
  } ;;
  5) ! ((quina)) && {
    sh_table "blue" "VOCÊ ACERTOU NA QUINA!"
    quina=1
  } ;;
  4) ! ((quadra)) && {
    sh_table "green" "VOCÊ ACERTOU NA QUADRA!"
    quadra=1
  } ;;
  3 | 2 | 1) ! ((acerto)) && {
    sh_table "orange" ""
    acerto=1
  } ;;
  0) ! ((zero)) && {
    sh_table "black" ""
    zero=1
  } ;;
  esac
  ((hits == 0)) && sh_td_erro || sh_td_acerto
done
echo "</table>
      </div>
		</body>
      <br>
      <footer>
        <div>
          <h1>Mega Sena CAIXA</h1>
		    <tr>
		      <sub><td align='center'>$diasemana, $data - $hora</td>
		    </tr>
        </div>
      </footer>
		</html>
"
rm $arquivoresult
