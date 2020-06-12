# Herramientas para resolver problemas frecuentes

<center>
<img src="/images/error.jpg">
</center>

> Decidimos hacer una recopilacion de herramientas utiles, a la hora de dar soluciones 
> a problemas en general. Si tenes un error en la terminal, si estas tratando de instalar
> un nuevo programa que no funciona acorde a como pretendias. Para saber como instalar
> algun software que necesitas pero tu distribucion de linux no la soporta, y diversas
> problematicas que pudiesen llegar a aparecer.

## 1. Capturas de pantalla (screenshot)
> No siempre podemos transcribir el mensaje de error y/o no mostramos el escenario
> que puede ser fundamental para que otro lo entienda

#### 1.1 Referencias
- [PasteBoard - Ver Pagina](https://pasteboard.co/)

- - -

## 2 Errores de la terminal
> Si tenes inconvenientes al capturar la pantalla, otra manera seria enviar el error 
> de la terminal.

#### 2.1 Referencias
- [Paste Debian - Ver Pagina](https://paste.debian.net/)

- - -

## 3. Archivos en la Nube (Cloud Storage)
> Conocido por **Cloud Storage** tenemos varias opciones para subir nuestros archivos
> ya sea como copia de respaldo, o para acceder de manera inmediata desde cualquier
> dispositivo (tablet, celular, ..)

##### 3.1 Instalar Dropbox en la Distribucion Manjaro
> Observacion, recomendamos la referencia 1 que es la que nos funciono de manera exitosa

##### 3.2 Referencias:
- [Referencia #1 - Ver Pagina](https://medium.com/@mahekarim/install-dropbox-on-arch-linux-or-manjaro-kde-fa06be45d550)
- [Referencia #2 - Ver Pagina](https://www.gestionatuweb.net/instalar-dropbox-en-manjaro-18-illyria/)

- - - 

## 4. Soporte en Canales IRC Configurar Cliente IRC (Weechat)
>Para solucionar problemas a veces (no siempre) se puede recurrir a los canales de soporte de irc
>del programa en cuestion. Resulta una manera mas rapida de plantear dudas en reemplazo a los foros.

>Podemos acceder a estos chat mediante un cliente irc, nosotros explicaremos uno muy particular 
>que se puede abrir desde la terminal (no se recomienda ejecutarlo con el comando sudo)

#### 4.1 Instalación && Configuración de Weechat
1- Agregar el servidor

```
/server add freenode chat.freenode.net/6667 -autoconnect
```

2- Cambiar el nick predeterminado del servidor agregado

```
/set irc.server.freenode.nicks escribirUnNick
```

3- Conectar al servidor

```
/connect freenode
```

4- Crear cuenta en el servidor conectado

```
/msg NickServ REGISTER escribirUnaClave escribirUnCorreo@gmail.com
```

5- Confirmar la cuenta (te llegara un correo)

```
/msg NickServ VERIFY REGISTER escribirUnNick ijgimopaoijv
```

6- Configurar para que se autoconecte al servidor agregado

```
/set irc.server.freenode.autoconnect on
```

7- Agregar seguridad ssl

```
/set irc.server_default.sasl_mechanism dh-blowfish
/set irc.server.freenode.sasl_username "mynick"
/set irc.server.freenode.sasl_password "xxxxxxx"
```

8- Autoconectar a varios canales

```
/set irc.server.freenode.autojoin "#channel1,#channel2"
```

#### 4.2 Otras Configuraciones

##### Modificar opciones

```
/set irc.server.freenode.nombreOpcion unValor
```

##### Mostrar configuraciones

```
/fset weechat.*
/fset irc.*
```

#### 4.3 Canales Sugeridos
> Para conectar utilizamos **/join #nombre-canal**

- org-mode
- emacs
- spacemacs
- arch

#### 4.4 Atajos

| Comando                              | Descripcion                    |
| :----------                          | :-------------------------     |
| <kbd>Alt</kbd>-<kbd>n</kbd>          | Se mueve al canal <kbd>n</kbd> |
| <kbd>Alt</kbd>-<kbd>Arrow Keys</kbd> | Se mueve entre los canales     |


#### 4.5 Referencias

- [Referencia #1 - Ver Pagina](http://www.chiark.greenend.org.uk/doc/weechat-doc/html/weechat_quickstart.en.html)
- [Referencia #2 - Ver Pagina](https://freenode.net/kb/answer/registration) 
- [Referencia #3 - Ver Pagina](https://wiki.archlinux.org/index.php/WeeChat) 
- [Referencia #4 - Ver Pagina](https://freenode.net/kb/answer/weechat)
- [Referencia #5 - Ver Pagina](https://weechat.org/files/doc/stable/weechat_quickstart.en.html)
- [Referencia #6 - Ver Pagina](https://weechat.org/files/doc/devel/weechat_quickstart.en.html)
- [Referencia #7 - Ver Pagina](https://weechat.org/files/doc/stable/weechat_quickstart.es.html)
- [Referencia #8 - Primeros pasos (weechat.org)](https://weechat.org/files/doc/stable/weechat_quickstart.en.html) 
- [Referencia #9 - Configuracion (szorfein.github.io)](https://szorfein.github.io/weechat/tor/configure-weechat/)
