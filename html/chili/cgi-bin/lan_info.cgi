#!/bin/bash

  echo "content-type: text/html"
  echo
  echo "<html>
  <head>
  <title>Monitoramento da LAN</title></head>
  
  <body bgcolor=white>
  <div align=right>Usuário: <b>$REMOTE_USER</b></div>"
  
  VAR=$(sed -n '1p')
  host=$(echo "$VAR" | sed 's/^host=\(.*\)\&.*$/\1/')
  botao=$(echo "$VAR" | cut -d= -f3)
  
  [ "$host" -a "$botao" ] || { echo "Opcao invalida</body></html>";exit; }
  
  if [ "$botao" = "info" ];then
  	ip=$(ping -c1 "$host"  2> /dev/null | sed -n '/^PING/{s/^.*(\([0-9\.]\+\)):.*$/\1/;p;}')
  	echo "<center><h2>Informacoes da maquina: <i>$host</i></h2></center>"
  	echo "<strong>Nome:</strong> $host<br>"
  	echo "<strong>IP:</strong>   $ip<br>"
  	echo "<br>"
  
  	saida=$(rsh "$host" cat /proc/version)
  	[ "$?" -eq "0" ] && echo "<strong>Sistema Operacional</strong><pre>$saida</pre>"
  
  	saida=$(rsh "$host" uptime)
  	[ "$?" -eq "0" ] && echo "<strong>uptime</strong><pre>$saida</pre>"
  
  
  	saida=$(rsh "$host" cat /proc/cpuinfo)
  	[ "$?" -eq "0" ] && echo "<strong>Informacoes da CPU</strong><pre>$saida</pre>"
  
  	saida=$(rsh "$host" free -ok)
  	[ "$?" -eq "0" ] && echo "<strong>Informacoes de Memoria</strong><pre>$saida</pre>"
  	mem=$(rsh $host cat /proc/meminfo)
  	percent=`echo "$mem" | sed -n '2p' | awk '{printf("%d",$3*100/$2)}'`
  	used=$(echo "$percent*2" | bc); free=$(echo "200-$percent*2" | bc)
  	echo "
  	<table border=0 cellspacing=0 cellpadding=2>
  	<tr>
  	<td><font size=\"3\">0%</font></td>
  	<td align=center width=$used bgcolor=red><font size=\"3\" color=white>$percent%</font></td>
  	<td width=$free bgcolor=green><font size=\"3\">&nbsp;</font></td>
  	<td><font size=\"3\">100%</font></td>
  	</tr>
  	</table>"
  	echo "<br><br><strong>Detalhes:</strong>"
  	echo "<pre>$(echo "$mem" | sed '1,3d')"
  	echo "<br><br></pre>"
  
  	echo "<strong>Informacoes de Disco</strong><br>"
  	echo "Discos SCSI <br>"
  	echo "<pre>$(rsh "$host" cat /proc/scsi/scsi 2> /dev/null)</pre>"
  
  	echo "Discos IDE:<br> "
  
  	for i in a b c d; do
  		TEMP=$(rsh "$host" "test -L \"/proc/ide/hd$i\" && echo sim")
  		[ "$TEMP" = "sim" ] && \
  		echo -n "hd$i : $(rsh "$host" cat "/proc/ide/hd$i/{media,model}" | sed 'N;s/\n/ /')<br>" 
  	done
  
  	echo "<br>Particoes dos Discos"
  	echo "<pre>$(rsh "$host" cat /proc/partitions)</pre>"
  	echo "<pre>$(rsh "$host" df -Th)</pre>"
  	echo "<strong><i>swap</i></strong><pre>$(rsh "$host" cat /proc/swaps)</pre>"
  
  
  elif [ "$botao" = "processos" ];then 
  	saida=$(rsh "$host" ps aux)
  	[ "$?" -eq "0" ] && echo "<strong> Informacoes sobre os processos da \
  	maquina: <i>$host</i></strong><pre>$saida</pre>"
  fi
  echo "</body></html>"
