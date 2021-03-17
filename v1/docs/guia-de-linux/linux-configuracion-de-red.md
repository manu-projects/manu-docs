# Guia de Linux - Configuración de Red

Por el momento no pude documentar por completo documentacion de este tipo
pero debajo dejo algunas referencias importantes para entrar en tema.

## 1. Proxy (con Squid) && Firewall (con Ufw)

#### 1.1 Comandos básicos

Comandos utilizados en la distribución **ArchLinux** puede llegar a diferir según cual tengan instalado.

1. Para iniciar el servicio usar `sudo systemctl start squid`
2. Para saber el estado `sudo systemctl status squid`
3. Reiniciar `sudo systemctl restart squid`
4. Revisar si no hay errores `sudo squid -k check`

##### 1.2 Referencias

- Página Oficial de Squid [Ver Página](http://www.squid-cache.org)
- Configurar Squid en Ubuntu - Ajpsoft [Ver Página](https://www.ajpdsoft.com/modules.php?name=News&file=article&sid=441)
- Conceptos de Proxy con Squid - Educacion ITE [Ver Página](http://www.ite.educacion.es/formacion/materiales/85/cd/linux/m6/proxy_squid.html)
- Configurar Squid en Ubuntu - Kacharreando [Ver Página](http://www.kacharreando.com/ubuntu/configurar-proxy-squid/)
- Que es Squid - Wiki [Ver Página](https://es.wikipedia.org/wiki/Squid_(programa))
- Configurar Servicios Linux con Proxy [Ver Página](https://www.sysadminsdecuba.com/2017/11/tips-configuracion-de-proxy-para-los-servicios-de-linux/)
- [Manual de Configuración](https://www.pks.mpg.de/~mueller/docs/suse10.2/html/opensuse-manual_en/manual/sec.squid.configfile.html)
- [Breve introducción a Squid Server](https://doxfer.webmin.com/Webmin/Squid_Proxy_Server)

- - -

## 2 Configuración de red

Según la distribución de Linux los comandos pueden variar, estos se hacen en ArchLinux

#### 2.1 Comandos

1- Listar interfaces de red

```bash
ip link # listar interfaces
```

2- Mostrar IP de las interfaces

```bash
ip address show
```

3- Otros

```bash
nmcli # para ver las conexiones
nmtui # editar conexiones via terminal 
nm-connection-editor #gui de conexiones
```

- - -

## 3. Conceptos

En Linux se identifican las interfaces de red de la siguiente forma:

- Adaptadores Ethernet: eth0, eth1, eth2, eth3 ...
- Adaptadores Inalambricos: wlan0, wlan1, wlan2, wlan3..
- Adaptador de LoopBack: lo 

>**Nota:** El adaptador o interfaz de loopback es un adaptador virtual de la misma maquina y se accede de a traves de la direccion 127.0.0.1 o del nombre de dominio localhost

#### 3.2 Referencias

- Documentación Oficial de Redes -TLDP [Ver Página](http://www.tldp.org/LDP/nag2/)
- Configuración de red - Wiki Arch [Ver Página](https://wiki.archlinux.org/index.php/Network_configuration)
- Como usar NetworkManager [Ver Página](https://linuxhint.com/arch_linux_network_manager/)
- Configurar Red - CetemRedes [Ver Página](http://cetemredes2.blogspot.com/2014/04/configurar-adaptador-de-red.html)
- Configurar Red en Ubuntu - Danjared [Ver Página](https://danjared.wordpress.com/2011/03/09/configurar-el-proxy-en-ubuntu/)
- Configurar Proxy con Tor [Ver Página](https://securityhacklabs.net/articulo/enrutando-todo-tu-trafico-bajo-la-red-tor-como-un-proxy-transparente-en-linux)
- Conceptos de Redes [Ver Página](http://www.nexolinux.com/configurar-red-en-linux/)

- - -

## 4. Configurar Proxy

Se debe modificar el archivo de configuración 

```bash
ip address show
ip route show
```

1- Abrir el archivo de configuración 

```bash
sudo nano /etc/environment 
```

2- Agregar la siguiente configuración

```bash
http_proxy="http://192.168.1.89:3128/"
https_proxy="https://192.168.1.89:3128/"
no_proxy="localhost,127.0.0.1,::1
```

>**Observación:** El puerto 3128 es el predeterminado por squid

3- Configuración via terminal (alternativa al paso 1 y 2)

Agregar en la terminal las siguientes lineas de comando

```bash
export http_proxy=http://192.168.1.89:3128/
export https_proxy=http://192.168.1.89:3128/
```

> **Observación:** 3128 es el puerto, esta modificación solo afecta a la sesión abierta
investigar sobre como correrlo en la shell zsh al iniciar

4- Ver variables globales de configuración

Para verificar que se aplicaron los cambios

```bash
env | grep proxy
```

5- Modificar en el navegador web Opera

Cada navegador tomar diferente los proxy

```bash
opera --proxy-server="http://192.168.1.89.3128/"
```

> **Observación:** Para más información ingresar lo siguiente en la barra de direcciones `opera://linux-proxy-config`

6- Para ver errores de Squid

Para ver los errores de squid antes de correr del servicio 

```bash
sudo squid -k check
sudo squid -k reconfigure # lanza error si hay algo mal configurado
```

#### 4.2 Referencias

- [Configurar Proxy en la Shell ZSH](https://ketansingh.net/setting-proxy-for-archlinux/
- Configurar en Ubuntu [Ver Video](https://www.youtube.com/watch?v=6qLRHDXPda8)
- [Configurar Proxy - Garron](https://www.garron.me/es/gnu-linux/configurar-proxy-ubuntu-desktop-server.html)
- [Configurar en Ubuntu](https://www.sololinux.es/instalar-squid-proxy-server-en-ubuntu-18-04/)
- [Configurar Enviroment](https://medium.com/@krish.raghuram/setting-up-proxy-in-ubuntu-95058da0b2d4)
- [User Agent](http://www.user-agents.org)
- [Conocer user agente](https://www.whoishostingthis.com/tools/user-agent/)
- [Block a Browser in Squid](https://www.linuxquestions.org/questions/linux-server-73/block-a-browser-in-squid-924596/)
- [Instalar Squid Proxy Server en Ubuntu](https://www.sololinux.es/instalar-squid-proxy-server-en-ubuntu-18-04/)

- - -

## 5. Iptables

#### 5.1 Referencias

- [Referencia #1 - Youtube ](https://www.youtube.com/watch?v=Yk61s5Ec6YA)
- [Referencia #2 - YOutube](https://www.youtube.com/watch?v=qPEA6J9pjG8)
- [Referencia #3 - youtube](https://www.youtube.com/watch?v=zELPIdxoGaQ&t=93s)

- - -

## 6. Referencias

- [Comando ifconfig, The Linux Documentation Project](http://es.tldp.org/Manuales-LuCAS/GARL2/garl2/x-087-2-iface.ifconfig.html)
- [Configurar Interfaces, LinuxConfig](https://linuxconfig.org/configuring-virtual-network-interfaces-in-linux)
- [Configurar manual ip permanente/temporal, Meltit](http://www.meltit.com.ar/linux-configuracion-internetip-manual-permanente-y-temporal-route-nameserver-interf
aces-ifconfig-gateway)
- [Configuracion de la Interfaz - IngDiaz](http://www.ingdiaz.org/configuracion-de-interfaces-de-red-en-ubuntu-distros-basados-en-debian/)
- [Comando ip y ifconfig, Linux Party](https://www.linux-party.com/29-internet/10036-ifconfig-vs-ip-diferencia-y-comparacion-de-la-configuracion-de-red)
- [Comando ifconfig con ejemplos, Mas Linux](https://maslinux.es/comando-ifconfig-aprende-con-algunos-ejemplos/)
- [Curso de Administracion de Sistemas y Redes](http://persoal.citius.usc.es/tf.pena/ASR/Tema_3html/node21.html)
- [Curso de Redes](http://e-ghost.deusto.es/docs/articulo.redes.html)
