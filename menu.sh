#!/bin/bash

opciones="Abrir_Puerto Cerrar_Puerto forwarding escanear_puerto salir "



function scan {

printf "\e[1;32mIntroduce  la IP que quieras escanear ejemplo 127.0.0.1:\e[1;35m " ,
read ipscan
printf "\e[1;32mIntroduce el puerto ejemplo 80:\e[1;35m " ,
read portscan
sleep 4
sleep 3
printf "\e[1;32mSe Escaneara el puerto ejemplo $portscan en la IP $ipscan \e[1;35m \n"
nmap $ipscan -p $portscan

printf "\e[1;32Analisis finalizado \e[1;32m \n"
sleep 4
echo
echo
printf "\e[1;34mSelecciona una opcion\e[1;32m \n"
echo
echo
select opcion in $opciones,
do
if [ $opcion = "Abrir_Puerto" ]; then
opentcp
elif [ $opcion = "Cerrar_Puerto" ]; then
closetcp


elif [ $opcion = "forwarding" ]; then
forward
elif [ $opcion = "escanear_puerto" ]; then
scan
elif [ $opcion = "salir" ]; then
printf "\e[1;34mGracias por usar mi script\n"
exit

else
printf "\e[1;31mERROR:Opcion no valida\n"
exit
fi
done

}


function opentcp {

printf "\e[1;32mIntroduce el puerto que quieres abrir Ejemplo 123:\e[1;35m " ,
read puertotcp
printf "\e[1;32mAbriendo PUerto.. por favor aguarde..\n"
sleep 4
iptables -I INPUT -p tcp --dport $puertotcp -j ACCEPT
service iptables save
service iptables restart
printf "\e[1;34mPuerto TCP Numero:\e[1;35m $puertotcp\e[1;32m OPEN\n"
sleep 4
printf "\e[1;32mEscaneando puerto..\n"
sleep 4
nmap localhost -p $puertotcp
sleep 4
printf "\e[1;33mFin del escaneo..\n"
sleep 4
echo
echo
printf "\e[1;34mSelecciona una opcion\e[1;32m \n"
echo
echo
select opcion in $opciones,
do
if [ $opcion = "Abrir_Puerto" ]; then
opentcp
elif [ $opcion = "Cerrar_Puerto" ]; then
closetcp


elif [ $opcion = "forwarding" ]; then
forward
elif [ $opcion = "escanear_puerto" ]; then
scan
elif [ $opcion = "salir" ]; then
printf "\e[1;34mGracias por usar mi script\n"
exit

else
printf "\e[1;31mERROR:Opcion no valida\n"
exit
fi
done

}

function forward {

printf "\e[1;32mIntroduce el puerto origen:\e[1;35m " ,
read portorigen
printf "\e[1;32mIntroduce IP destino\e[1;35m " ,
read ipdestino
printf "\e[1;32mIntroduce el puerto destino:\e[1;35m " ,
read puertodestino


printf "\e[1;32mEl trafico TCP puerto:\e[1;35m $portorigen \e[1;32mSera reridigido a la ip\e[1;35m $ipdestino \e[1;32men el puerto\e[1;35m $puertodestino \n"
sleep 3
printf "\e[1;32mHabilitando IP Forwarding, aguarde\n"
sleep 2
sysctl net.ipv4.ip_forward=1
iptables -A FORWARD -d localhost -p tcp -m tcp --dport $portorigen -j ACCEPT
iptables -t nat -A PREROUTING -d localhost -p tcp -m tcp --dport $portorigen  -j DNAT --to-destination $ipdestino:$puertodestino
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
iptables -t nat -A POSTROUTING -o wlan0 -j MASQUERADE
sleep 2
printf "\e[1;32mRegla Apliacada correctamente\n"
sleep 5
service iptables save
service iptables reload
sudo /sbin/iptables-save
clear
echo
echo
printf "\e[1;34mSelecciona una opcion\e[1;32m \n"
echo
echo
select opcion in $opciones,
do
if [ $opcion = "Abrir_Puerto" ]; then
opentcp
elif [ $opcion = "Cerrar_Puerto" ]; then
closetcp


elif [ $opcion = "forwarding" ]; then
forward
elif [ $opcion = "escanear_puerto" ]; then
scan
elif [ $opcion = "salir" ]; then
printf "\e[1;34mGracias por usar mi script\n"
exit

else
printf "\e[1;31mERROR:Opcion no valida\n"

fi
done

}






function closetcp {

printf "\e[1;32mIntroduce el puerto que quieres  cerrar 123:\e[1;35m " ,
read closeport
printf "\e[1;32mCerrando Puerto.. por favor aguarde..\n"
sleep 4
iptables -I INPUT -p tcp --dport $closeport -j DROP
service iptables save
service iptables restart
printf "\e[1;34mPuerto TCP Numero:\e[1;35m $closeport\e[1;31m CLOSED\n"
sleep 4
printf "\e[1;32mEscaneando puerto..\n"
sleep 4
nmap localhost -p $closeport
sleep 4
printf "\e[1;33mFin del escaneo..\n"
sleep 4
echo
echo
printf "\e[1;34mSelecciona una opcion\e[1;32m \n"
echo
echo
select opcion in $opciones,
do
if [ $opcion = "Abrir_Puerto" ]; then
opentcp
elif [ $opcion = "Cerrar_Puerto" ]; then
closetcp
elif [ $opcion = "forwarding" ]; then
forward
elif [ $opcion = "escanear_puerto" ]; then
scan
elif [ $opcion = "salir" ]; then
printf "\e[1;34mGracias por usar mi script\n"
exit

else
printf "\e[1;31mERROR:Opcion no valida\n"
exit
fi
done

}
clear
printf "\e[1;35m
#     #  ######  #       #        ####
#     #  #       #       #       #    #
#######  #####   #       #       #    #
#     #  #       #       #       #    #
#     #  #       #       #       #    #
#     #  ######  ######  ######   ####


\n"
sleep 2
printf "\e[1;33mScript Creado por facu Salgado\n"
sleep 1
printf "\e[1;34mSelecciona una opcion\e[1;32m \n"
echo
echo


select opcion in $opciones,
do
if [ $opcion = "Abrir_Puerto" ]; then
opentcp
elif [ $opcion = "Cerrar_Puerto" ]; then
closetcp
elif [ $opcion = "forwarding" ]; then
forward
elif [ $opcion = "escanear_puerto" ]; then
scan
elif [ $opcion = "salir" ]; then
printf "\e[1;34mGracias por usar mi script\n"
exit


else
printf "\e[1;31mERROR:Opcion no valida\n"
fi
done
