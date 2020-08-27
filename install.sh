#!/bin/bash
clear
printf "\e[1;33mHola este script su funcion es monitorear las redes\n"
sleep 5
printf "\e[1;33mcon este script podras abrir y cerrar puertos y escanear puertos\n"
sleep 5
printf "\e[1;33mel objetivo principal es automatizar el proceso y hacerlo mas sencillo\n"
sleep 5
printf "\e[1;33mel script trabaja con IPTABLES, en sistemas debian puede causar algunos fallos\n"
sleep 5
printf "\e[1;32minstalaremos nmap e iptables para que pueda ejecutar el script\n"
sleep 3
apt-get install nmap -y
apt-get install iptables -y
apt-get install toilet -y
clear
printf "\e[1;32mPrograma instalado, ejecutaremos el script\n"
sleep 5
chmod +x menu.sh
bash menu.sh
