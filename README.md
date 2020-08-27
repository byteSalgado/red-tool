# red-tool
Script Bash abrir y cerrar puertos, Hacer IP Forwarding e Escanear un puerto de algun Hosting.

# Funcionalidad:

El script trabaja con nmap e iptables, especificamente en sistemas DEBIAN trae algunos fallos el iptables, 
ya que no permite el adecuado renicio del servicio por lo tanto en estos casos deberan reniciar su maquina 
para que haga efecto el cierre o open del puerto.

# Dependencias: 

* Nmap
* iptables
* Toilet

# Instalacion: 

* git clone https://github.com/byteSalgado/red-tool/
* cd red-tool
* chmod +x install.sh
* ./install.sh

# Creditos:

* Facu Salgado (ByteSalgado)
* Apoyame con una estrella
* Cualquier bug avisarme para corregirlo.
