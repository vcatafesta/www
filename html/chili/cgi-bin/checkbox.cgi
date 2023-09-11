#!/bin/bash
  
  echo "content-type: text/plain"
  echo 
  VAR=$(sed -n 1p)
  echo "$VAR"
  echo 
  [ "$VAR" ] || { echo "voce nao gosta de nada";exit; }
  echo "Voce gosta de :"
  echo
  IFS="&"
  for i in `echo "$VAR"`;do
  echo " $(echo $i | cut -d= -f1)"
  done
