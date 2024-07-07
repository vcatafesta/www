#!/bin/bash

ARQ="/tmp/page.hits"
n="$(cat $ARQ 2> /dev/null)" || n=0
echo $((n=n+1)) > "$ARQ"
echo "content-type: text/html"
echo
echo "<html>"
echo "   <head>"
echo '      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">'
echo "      <title>Gerador de jogos da Sena na Web</title>"
echo "      <style>"
echo "         th     { border: 0px solid white;}"
echo "         td     { border: 0px solid white;}"
echo "         table  { border: 1px solid white;}"
echo "         body   { background-color: DodgerBlue;}"
echo "         h1     {color: white;}"
echo "         p      {color: blue;}"
echo "      </style>"
echo "   </head>"
echo "<body>"
echo "<table>"
echo "<tr><td><h1>Esta página já foi visualizada: $n vezes</h1></tr>"
echo "</table>"
echo "<br></body></html>"
