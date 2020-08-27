#!/bin/bash

#Colors by Hacking.con.H
white="\033[1;37m"
grey="\033[0;37m"
purple="\033[0;35m"
red="\033[1;31m"
green="\033[1;32m"
yellow="\033[1;33m"
Purple="\033[0;35m"
Cyan="\033[0;36m"
Cafe="\033[0;33m"
Fiuscha="\033[0;35m"
blue="\033[1;34m"
nc="\e[0m"


#opciones menu

a="Abrir Puerto"
b="Cerrar Puerto"
c="Escanear Puerto"
d="borrar all rules"
e="Salir"


#entradas puertos

entrada="INPUT"
salida="OUTPUT"

#protocolos

tcp="TCP"
udp="UDP"

if which toilet >/dev/null; then
sleep 1
echo -e "$blue(Toilet)$nc ................................................... Instalado [$green✓$nc]"
else
sleep 1
echo -e "$red(Toilet)$nc No instalado [$red✗$nc]"
sleep 1
echo "Instala escribiendo [sudo apt-get install toilet]"
sleep 1
exit 1
fi

if which nmap >/dev/null; then
sleep 1
echo -e "$blue(nmap)$nc ................................................... Instalado [$green✓$nc]"
else
sleep 1
echo -e "$red(nmap)$nc No instalado [$red✗$nc]"
sleep 1
echo "Instala escribiendo [sudo apt-get install nmap]"
sleep 1
exit 1
fi

if which iptables >/dev/null; then
sleep 1
echo -e "$blue(iptables)$nc ................................................... Instalado [$green✓$nc]"
else
sleep 1
echo -e "$red(iptables)$nc No instalado [$red✗$nc]"
sleep 1
echo "Instala escribiendo [sudo apt-get install iptables]"
sleep 1
exit 1
fi


clear
tput setaf 3  && toilet --filter border Scan Red
echo
echo -e "$green"
echo "Script creado por Facu Salgado"
echo
PS3="Selecciona una Opcion: "


#menu principal

select menu in "$a" "$b" "$c" "$d" "$e";
do
case $menu in
$a)
echo -e "$blue"
echo -e "elige el el tipo de entrada $green"
echo
echo
#comienzo menu INPUT
select tipo in "$entrada" "$salida"
do
case $tipo in
$entrada)
echo -e 
echo -e "$blue"
echo -e "elige el protocolo $green"
echo
echo
#comienzo menu protocol
select protocol in "$tcp" "$udp"
do
case $protocol in
$tcp)
echo -e "$blue"
echo -e "Ingresa el puerto a abrir:$blue "

echo
echo -e "$yellow"
echo -e "ingresaste el puerto TCP numero:$blue $opentcp $yellow"
echo "abriendo puerto por favor espere.."
sleep 2
iptables -A INPUT -p tcp --dport $opentcp -j ACCEPT
sleep 2
echo -e "$green"
echo  -e "Regla Alicada correctamente.. se la mostraremos en 3 segundos$nc"
iptables -L
sleep 2
echo "$green(Saliendo del script)"
exit
;;
$udp)
echo -e "$yellow"
echo -e "Ingresa el puerto a abrir:$blue "
read openudp
echo
echo -e "$yellow"
echo "ingresaste el puerto UDP numero $openudp"
echo "abriendo puerto por favor espere.."
sleep 2
iptables -A INPUT -p udp --dport $openudp -j ACCEPT
sleep 2
echo -e "$green"
echo  "Regla Alicada correctamente.. se la mostraremos en 3 segundos$nc"
iptables -L
sleep 2
echo "$green(Saliendo del script)"
exit
;;
*)
echo "opcion invalida"
;;
esac
done
#fin menu PROTOCOL

;;
$salida)

select protocol in "$tcp" "$udp"
do
case $protocol in
$tcp)
echo -e "$blue"
echo -e "Ingresa el puerto a abrir:$blue "
read opentcp
echo
echo -e "$yellow"
echo -e "ingresaste el puerto TCP numero:$blue $opentcp $yellow"
echo "abriendo puerto por favor espere.."
sleep 2
iptables -A OUTPUT -p tcp --dport $opentcp -j ACCEPT
sleep 2
echo -e "$green"
echo  -e "Regla Alicada correctamente.. se la mostraremos en 3 segundos$nc"
iptables -L
sleep 2
echo  -e "$green(Saliendo del script)$nc"
exit
;;
$udp)
echo -e "$yellow"
echo -e "Ingresa el puerto a abrir:$blue "
read openudp
echo
echo -e "$yellow"
echo "ingresaste el puerto UDP numero $openudp"
echo "abriendo puerto por favor espere.."
sleep 2
iptables -A OUTPUT -p udp --dport $openudp -j ACCEPT
sleep 2
echo -e "$green"
echo  "Regla Alicada correctamente.. se la mostraremos en 3 segundos$nc"
iptables -L
sleep 2
echo -e "$green(Saliendo del script)$nc"
exit
;;
*)
echo "opcion invalida"
;;
esac
done
#fin menu PROTOCOL

;;
*)
echo "opcion invalida"
;;
esac
done
#fin menu INPUT TYPE

;;

$b)

echo -e "$blue"
echo -e "elige el el tipo de entrada $green"
echo
echo
#comienzo menu INPUT
select tipo in "$entrada" "$salida"
do
case $tipo in
$entrada)
echo -e 
echo -e "$blue"
echo -e "elige el protocolo $green"
echo
echo
#comienzo menu protocol
select protocol in "$tcp" "$udp"
do
case $protocol in
$tcp)
echo -e "$blue"
echo -e "Ingresa el puerto a cerrar:$blue "
read closetcp
echo
echo -e "$yellow"
echo -e "ingresaste el puerto TCP numero:$blue $closetcp $yellow"
echo "cerrando puerto por favor espere.."
sleep 2
iptables -A INPUT -p tcp --dport $closetcp -j DROP
sleep 2
echo -e "$green"
echo  -e "Regla Alicada correctamente.. se la mostraremos en 3 segundos$nc"
iptables -L
sleep 2
echo -e "$green(Saliendo del script)$nc"
exit
;;
$udp)
echo -e "$yellow"
echo -e "Ingresa el puerto a cerrar:$blue "
read closeudp
echo
echo -e "$yellow"
echo "ingresaste el puerto UDP numero $closeudp"
echo "cerrando puerto por favor espere.."
sleep 2
iptables -A INPUT -p udp --dport $closeudp -j DROP
sleep 2
echo -e "$green"
echo  -e "Regla Alicada correctamente.. se la mostraremos en 3 segundos$nc"
iptables -L
sleep 2
echo -e "$green(Saliendo del script)$nc"
exit
;;
*)
echo -e "$red(opcion invalida)$green"
;;
esac
done
#fin menu PROTOCOL

;;
$salida)

select protocol in "$tcp" "$udp"
do
case $protocol in
$tcp)
echo -e "$blue"
echo -e "Ingresa el puerto a cerrar:$blue "
read closetcp
echo
echo -e "$yellow"
echo -e "ingresaste el puerto TCP numero:$blue $closetcp $yellow"
echo "cerrando puerto por favor espere.."
sleep 2
iptables -A OUTPUT -p tcp --dport $closetcp -j DROP
sleep 2
echo -e "$green"
echo  -e "Regla Alicada correctamente.. se la mostraremos en 3 segundos$nc"
iptables -L
sleep 2
echo  -e "$green(Saliendo del script)$nc"
exit
;;
$udp)
echo -e "$yellow"
echo -e "Ingresa el puerto a cerrar:$blue "
read openudp
echo
echo -e "$yellow"
echo "ingresaste el puerto UDP numero $openudp"
echo "cerrando puerto por favor espere.."
sleep 2
iptables -A OUTPUT -p udp --dport $openudp -j DROP
sleep 2
echo -e "$green"
echo  -e "Regla Alicada correctamente.. se la mostraremos en 3 segundos$nc"
iptables -L
sleep 2
echo -e "$green(Saliendo del script)$nc"
exit
;;
*)
echo -e "$red(opcion invalida)$green"
;;
esac
done
#fin menu PROTOCOL

;;
*)
echo -e "$red(opcion invalida)$green"
;;
esac
done
#fin menu INPUT TYPE



;;
$c)
printf "\e[1;32mIntroduce  la IP que quieras escanear ejemplo 127.0.0.1:\e[1;35m " ,
read ipscan
printf "\e[1;32mIntroduce el puerto ejemplo 80:\e[1;35m " ,
read portscan
sleep 4
sleep 3
printf "\e[1;32mSe Escaneara el puerto ejemplo $portscan en la IP $ipscan \e[1;35m \n"
nmap $ipscan -p $portscan

printf "\e[1;32Analisis finalizado saliendo del script \e[1;32m \n"
sleep 4
echo
echo -e "$nc"
exit
;;
$d)
echo -e "$red(Borrando todas las reglas en 5 segundos.."
sleep 1
echo "4"
sleep 1
echo "3"
sleep 1
echo "2"
sleep 1
echo "1"
sleep 1
iptables -F
sleep 2
echo -e "$green(Reglas borradas exitosamente)$nc"
sleep 2
iptables -L
echo
echo
echo -e "$green(saliendo del script)$nc"
exit
;;
$e)
echo -e "$red(Saliendo Del script) en 3"
sleep 1
echo "2"
sleep 1
echo "1"
echo -e "$green(Saliendo del script)"
echo -e "Gracias por utilizarlo by facu salgado$nc"
break
;;
*)
echo "opcion invalida"
;;
esac
done
#fin menu principal

