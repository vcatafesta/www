#!/bin/bash

echo "Content-type: text/html"
echo ""

echo '<html>'
echo '<head>'
echo '<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">'
echo '<title>Form Example</title>'
echo '</head>'
echo '<body>'

  echo "<form method=GET action=\"${SCRIPT}\">"\
       '<table nowrap>'\
          '<tr><td>Jogos</TD><TD><input type="text" name="val_x" size=12></td></tr>'\
          '<tr><td>Dezenas</td><td><input type="text" name="val_y" size=12 value=""></td>'\
          '</tr></table>'

  echo '<input type="radio" name="val_z" value="1" checked> Option 1<br>'\
       '<input type="radio" name="val_z" value="2"> Option 2<br>'\
       '<input type="radio" name="val_z" value="3"> Option 3'

  echo '<br><input type="submit" value="Process Form">'\
       '<input type="reset" value="Reset"></form>'

  # Make sure we have been invoked properly.

  if [ "$REQUEST_METHOD" != "GET" ]; then
        echo "<hr>Script Error:"\
             "<br>Usage error, cannot complete request, REQUEST_METHOD!=GET."\
             "<br>Check your FORM declaration and be sure to use METHOD=\"GET\".<hr>"
        exit 1
  fi

  # If no search arguments, exit gracefully now.

  if [ -z "$QUERY_STRING" ]; then
        exit 0
  else
     # No looping this time, just extract the data you are looking for with sed:
     XX=`echo "$QUERY_STRING" | sed -n 's/^.*val_x=\([^&]*\).*$/\1/p' | sed "s/%20/ /g"`
     YY=`echo "$QUERY_STRING" | sed -n 's/^.*val_y=\([^&]*\).*$/\1/p' | sed "s/%20/ /g"`
     ZZ=`echo "$QUERY_STRING" | sed -n 's/^.*val_z=\([^&]*\).*$/\1/p' | sed "s/%20/ /g"`
     echo "val_x: " $XX
     echo '<br>'
     echo "val_y: " $YY
     echo '<br>'
     echo "val_z: " $ZZ
/opt/github/sena/sena --nocolor -j $XX $YY	 

  fi

echo '</body>'
echo '</html>'

exit 0