## Herramientas para resolver problemas

1. Instalar un cliente IRC (WeeChat)

## Otras herramientas

Para subir screenshots rapido
https://pasteboard.co/

Para subir errores de terminal
https://paste.debian.net/


## Instalar Dropbox en Manjaro
>Observacion, yo hice lo de la pagina 1 y anda perfecto

[Ver Pagina 1](https://medium.com/@mahekarim/install-dropbox-on-arch-linux-or-manjaro-kde-fa06be45d550)
[Ver Pagina 2](https://www.gestionatuweb.net/instalar-dropbox-en-manjaro-18-illyria/)

## Configurar Cliente IRC (Weechat)

1. Agregar el servidor
/server add freenode chat.freenode.net/6667 -autoconnect

2. Cambiar el nick predeterminado del servidor agregado
/set irc.server.freenode.nicks escribirUnNick

3. Conectar al servidor
/connect freenode

4. Crear cuenta en el servidor conectado
/msg NickServ REGISTER escribirUnaClave escribirUnCorreo@gmail.com

5. Confirmar la cuenta (te llegara un correo)
/msg NickServ VERIFY REGISTER escribirUnNick ijgimopaoijv

6. Configurar para que se autoconecte al servidor agregado
/set irc.server.freenode.autoconnect on

7. Agregar seguridad ssl
/set irc.server_default.sasl_mechanism dh-blowfish
/set irc.server.freenode.sasl_username "mynick"
/set irc.server.freenode.sasl_password "xxxxxxx"

8. Autoconectar a varios canales
/set irc.server.freenode.autojoin "#channel1,#channel2"

## Otras Configuraciones

### Modificar opciones
/set irc.server.freenode.nombreOpcion unValor

### Mostrar configuraciones
/fset weechat.*
/fset irc.*

https://weechat.org/files/doc/stable/weechat_quickstart.en.html
https://szorfein.github.io/weechat/tor/configure-weechat/

### Canales Sugeridos
> Para conectar utilizamos **/join #nombre-canal**

- #org-mode
- #emacs
- #spacemacs
- #arch

## Atajos
| Comando     | Descripcion                |
| Alt <n>     | Se mueve al canal <n>       |
| Alt <Arrow> | Se mueve entre los canales |



Para hacer consultas en los canales de IRC
weechat y freenode

http://www.chiark.greenend.org.uk/doc/weechat-doc/html/weechat_quickstart.en.html
https://freenode.net/kb/answer/registration
https://wiki.archlinux.org/index.php/WeeChat
https://freenode.net/kb/answer/weechat
https://weechat.org/files/doc/stable/weechat_quickstart.en.html
https://weechat.org/files/doc/devel/weechat_quickstart.en.html
https://weechat.org/files/doc/stable/weechat_quickstart.es.html
