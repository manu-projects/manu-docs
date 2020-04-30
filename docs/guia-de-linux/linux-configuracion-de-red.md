# Guia de Linux - Configuración de Red

>Por el momento no pude documentar por completo documentacion de este tipo
>pero debajo dejo algunas referencias.

## Investigando de Proxy (squid) && firewall (ufw)

https://www.pks.mpg.de/~mueller/docs/suse10.2/html/opensuse-manual_en/manual/sec.squid.configfile.html
https://doxfer.webmin.com/Webmin/Squid_Proxy_Server


Página Oficial de Squid [Ver Página](http://www.squid-cache.org)
Configurar Squid en Ubuntu - Ajpsoft [Ver Página](https://www.ajpdsoft.com/modules.php?name=News&file=article&sid=441)
Conceptos de Proxy con Squid - Educacion ITE [Ver Página](http://www.ite.educacion.es/formacion/materiales/85/cd/linux/m6/proxy_squid.html)
Configurar Squid en Ubuntu - Kacharreando [Ver Página](http://www.kacharreando.com/ubuntu/configurar-proxy-squid/)

Que es Squid - Wiki [Ver Página](https://es.wikipedia.org/wiki/Squid_(programa))
Configurar Servicios Linux con Proxy [Ver Página](https://www.sysadminsdecuba.com/2017/11/tips-configuracion-de-proxy-para-los-servicios-de-linux/)

## Comandos
>Comandos para archlinux

1. Para iniciar el servicio usar `sudo systemctl start squid`
2. Para saber el estado `sudo systemctl status squid`
3. Reiniciar `sudo systemctl restart squid`
4. Revisar si no hay errores `sudo squid -k check`

# Configuración de red

>Según la distribución de Linux los comandos pueden variar, estos se hacen en ArchLinux

## Comandos
1. Listar interfaces de red
```
ip link # listar interfaces
```

2. Mostrar IP de las interfaces
```
ip address show
```

3. Otros
```
nmcli # para ver las conexiones
nmtui # editar conexiones via terminal 
nm-connection-editor #gui de conexiones
```

- - -

## Conceptos
>En Linux se identifican las interfaces de red de la siguiente forma:

- Adaptadores Ethernet: eth0, eth1, eth2, eth3 ...
- Adaptadores Inalambricos: wlan0, wlan1, wlan2, wlan3..
- Adaptador de LoopBack: lo 

>**Nota:** El adaptador o interfaz de loopback es un adaptador virtual de la misma maquina y se accede de a traves de la direccion 127.0.0.1 o del nombre de dominio localhost

- - -
Documentación Oficial de Redes -TLDP [Ver Página](http://www.tldp.org/LDP/nag2/)
Configuración de red - Wiki Arch [Ver Página](https://wiki.archlinux.org/index.php/Network_configuration)
Como usar NetworkManager [Ver Página](https://linuxhint.com/arch_linux_network_manager/)

Configurar Red - CetemRedes [Ver Página](http://cetemredes2.blogspot.com/2014/04/configurar-adaptador-de-red.html)
Configurar Red en Ubuntu - Danjared [Ver Página](https://danjared.wordpress.com/2011/03/09/configurar-el-proxy-en-ubuntu/)
Configurar Proxy con Tor [Ver Página](https://securityhacklabs.net/articulo/enrutando-todo-tu-trafico-bajo-la-red-tor-como-un-proxy-transparente-en-linux)

Conceptos de Redes [Ver Página](http://www.nexolinux.com/configurar-red-en-linux/)


- - -

## Configurar Proxy
>Se deben modificar el archivo de configuración 
```
ip address show
ip route show
```

1. Abrir el archivo de configuración 
```
sudo nano /etc/environment 
```

2. Agregar la siguiente configuración
```
http_proxy="http://192.168.1.89:3128/"
https_proxy="https://192.168.1.89:3128/"
no_proxy="localhost,127.0.0.1,::1
```
>Observación: El puerto 3128 es el predeterminado por squid

3. Configuración via terminal (alternativa al paso 1 y 2)
>Agregar en la terminal las siguientes lineas de comando
```
export http_proxy=http://192.168.1.89:3128/
export https_proxy=http://192.168.1.89:3128/
# 3128 es el puerto
# esta modificación solo afecta a la sesión abierta
# investigar sobre como correrlo en la shell zsh al iniciar
```

4. Ver variables globales de configuración
>Para verificar que se aplicaron los cambios
```
env | grep proxy
```
5. Modificar en opera
>Cada navegador tomar diferente los proxy

```
# para más información ingresar lo sig en la url de direcciones
# opera://linux-proxy-config

# en la terminal abrir opera de la sig manera
opera --proxy-server="http://192.168.1.89.3128/"
```

- - -

## agregar donde sea necesario lo siguiente
```
#para ver errores de squid antes de correr el servicio
sudo squid -k check 
sudo squid -k reconfigure # lanza error si hay algo mal configurado
```

Configurar Proxy en la Shell ZSH [Ver Página](https://ketansingh.net/setting-proxy-for-archlinux/

Configurar en Ubuntu [Ver Video](https://www.youtube.com/watch?v=6qLRHDXPda8)
Configurar Proxy - Garron [Ver Página](https://www.garron.me/es/gnu-linux/configurar-proxy-ubuntu-desktop-server.html)
Configurar en Ubuntu [Ver Página](https://www.sololinux.es/instalar-squid-proxy-server-en-ubuntu-18-04/)
Configurar Enviroment [Ver Página](https://medium.com/@krish.raghuram/setting-up-proxy-in-ubuntu-95058da0b2d4)

- - -

User Agent [Ver Página](http://www.user-agents.org)
Conocer user agente[Ver pÁGINA](https://www.whoishostingthis.com/tools/user-agent/)
otros[ver](https://www.linuxquestions.org/questions/linux-server-73/block-a-browser-in-squid-924596/)
[instalar](https://www.sololinux.es/instalar-squid-proxy-server-en-ubuntu-18-04/)

- - -

## Iptables

[Referencia #1 - Youtube ](https://www.youtube.com/watch?v=Yk61s5Ec6YA)
[Referencia #2 - YOutube](https://www.youtube.com/watch?v=qPEA6J9pjG8)
[Referencia #3 - youtube](https://www.youtube.com/watch?v=zELPIdxoGaQ&t=93s)

- - -
# Referencias
- Comando ifconfig, The Linux Documentation Project 
 [Ver Pagina](http://es.tldp.org/Manuales-LuCAS/GARL2/garl2/x-087-2-iface.ifconfig.html)

- Configurar Interfaces, LinuxConfig
 [Ver Pagina](https://linuxconfig.org/configuring-virtual-network-interfaces-in-linux)

- Configurar manual ip permanente/temporal, Meltit
 [Ver Pagina](http://www.meltit.com.ar/linux-configuracion-internetip-manual-permanente-y-temporal-route-nameserver-interf
aces-ifconfig-gateway)

- Configuracion de la Interfaz - IngDiaz
 [Ver Pagina](http://www.ingdiaz.org/configuracion-de-interfaces-de-red-en-ubuntu-distros-basados-en-debian/)

- Comando ip y ifconfig, Linux Party
 [Ver Pagina](https://www.linux-party.com/29-internet/10036-ifconfig-vs-ip-diferencia-y-comparacion-de-la-configuracion-de-red)

- Comando ifconfig con ejemplos, Mas Linux
 [Ver Pagina](https://maslinux.es/comando-ifconfig-aprende-con-algunos-ejemplos/)

- Curso de Administracion de Sistemas y Redes
 [Ver Pagina](http://persoal.citius.usc.es/tf.pena/ASR/Tema_3html/node21.html)

- Curso de Redes
 [Ver Pagina](http://e-ghost.deusto.es/docs/articulo.redes.html)
