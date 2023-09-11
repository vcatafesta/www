#!/bin/bash
#source /chili/core.sh
#maxcol=200
echo "content-type: text/plain;charset=UTF-8"; echo
/opt/sena/sena --nocolor -V
#replicate '#' $maxcol

echo
/opt/sena/sena --nocolor -h
#replicate '#' $maxcol

echo
/opt/sena/sena --quiet --nocolor -j 10
#replicate '#' $maxcol

echo
/opt/sena/sena --nocolor -c
replicate '#' $maxcol
