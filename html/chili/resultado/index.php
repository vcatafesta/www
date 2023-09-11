<?php
# $output = shell_exec('/var/www/html/megasena/confmega.sh /var/www/html/megasena/jogos444444.txt');
#$output = `./confmega.sh jogos444444.txt`;
$output = shell_exec('./confmega.sh jogos444444.txt');
echo "$output";
?>
