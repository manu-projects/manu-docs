<img src=/images/i3wm-gnome.png>

POLYBAR es para el statusbar
COMPTON es compositor


## Varios dotfiles
 - https://github.com/notthebee/dotfiles
 - Entendiendo i3 [Ver Pagina](https://github.com/Airblader/i3)
 

- - -
#  ZShell

https://ohmyz.sh/

## Introducción

https://github.com/robbyrussell/oh-my-zsh/wiki/Themes

## Instalación
```bash
sudo apt-get install zsh git
sudo apt-get install fonts-powerline # para instalar las fuentes
```

## Configuración
```bash
chsh -s /usr/bin/zsh # cambiamos de bash a zshell
# agregar info de la fuente de melonn.... #############################
#######
#https://github.com/powerline/fonts/tree/master/Inconsolata # bajar la fuente
```

# OCULTAR EL HOSTNAME DEL PROMPT
# TE FALTA TERMINAR DE REVISAR ESTO.. PARA ACORTAR EL PROMPT
# https://charles4code.blogspot.com/2018/07/show-username-only-without-hostname-in.html
```
sudo nano .zshrc # abrimos archivo de configuracion de zsh

source .zshrc # para aplicar los cambios (ej. cambiar el theme)
```

```bash
prompt_context() {
  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    #prompt_segment black default "%(!.%{%F{yellow}%}.)%n@%m" # este tiene user@hostname
    prompt_segment black default "%(!.%{%F{yellow}%}.)%n" # este tiene user
  fi
}
```



- - -

# 1. Terminal RXVT Unicode

## 1.1 Introducción
>Existe una gran variedad de terminales, entre las más conocidas son:
-Rxvt
-Terminator
-Tilix
-Gnome
-Xterm

<img src=/images/urxvt-unicode-terminal.jpg>

## 1.2 Instalación
>Si queremos cambiar a una terminal más personalizada y sin limitaciones,
>podemos hacer uso de **rxvt** que a diferencia de la predeterminada gnome de ubuntu
```bash
sudo apt install rxvt-unicode
```

## 1.3 Configuración
>En el archivo oculto `.Xresources` guardaremos las configuraciones que luego aplicaremos los
>cambios colocando en la terminal `xrdb .Xresources` suponiendo que estamos ubicados en el
>directorio `~/`

Ejecutamos las siguientes comandos en la terminal
```bash
touch ~/.Xresources # creamos el archivo de configuración
mkdir ~/.rxvt/ext # creamos directorio donde guardaremos plugins
```

## 1.4 Configuración Personal
>Les comparto la configuración que fui adaptando con lo que iba investigando, pueden personalizarlo a gusto.

```xresources
!Para aplicar cambios ejecutar en la terminal la sig linea de comando
!xrdb ~/.Xresources

!Configuramos la ruta donde agregamos las extensiones
URxvt.perl-lib: ~/.urxvt/ext/

!Configuramos la fuente
!URxvt.font: xft:DejaVu Sans Mono:size=11
URxvt.font: xft:Meslo LG L DZ for Powerline:size=11 !la necesita theme agnoster de zshell

!! URxvt Appearance
URxvt.letterSpace: 0
URxvt.lineSpace: 0
URxvt.geometry: 92x24
URxvt.internalBorder: 24
URxvt.cursorBlink: true
URxvt.cursorUnderline: false
URxvt.saveline: 2048
URxvt.scrollBar: false
URxvt.scrollBar_right: false
URxvt.urgentOnBell: true
URxvt.depth: 32
URxvt.iso14755: false

!! Common Keybinds for Navigations
URxvt.keysym.Shift-Up: command:\033]720;1\007
URxvt.keysym.Shift-Down: command:\033]721;1\007
URxvt.keysym.Control-Up: \033[1;5A
URxvt.keysym.Control-Down: \033[1;5B
URxvt.keysym.Control-Right: \033[1;5C
URxvt.keysym.Control-Left: \033[1;5D

!! Copy Paste & Other Extensions
!URxvt.perl-ext-common: default,selection-to-clipboard,pasta,matcher,keyboard-select
URxvt.perl-ext-common: default,clipboard,url-select,keyboard-select
URxvt.copyCommand: xclip -i -selection clipboard
URxvt.pasteCommand: xclip -o -selection clipboard
URxvt.keysym.M-c: perl:clipboard:copy
URxvt.keysym.M-v: perl:clipboard:paste
URxvt.keysym.M-C-v: perl:clipboard:paste_escaped
URxvt.keysym.M-Escape: perl:keyboard-select:activate
URxvt.keysym.M-s: perl:keyboard-select:search
URxvt.keysym.M-u: perl:url-select:select_next
URxvt.urlLauncher: firefox
URxvt.underlineURLs: true
URxvt.urlButton: 1

!! Colorscheme
!! Para cambiar a otros diseños podemos elegir en  https://terminal.sexy/
! special
*.foreground: #93a1a1
*.background: #141c21
*.cursorColor: #afbfbf

! black
*.color0: #263640
*.color8: #4a697d

! red
*.color1: #d12f2c
*.color9: #fa3935

! green
*.color2: #819400
*.color10: #a4bd00

! yellow
*.color3: #b08500
*.color11: #d9a400

! blue
*.color4: #2587cc
*.color12: #2ca2f5

! magenta
*.color5: #696ebf
*.color13: #8086e8

! cyan
*.color6: #289c93
*.color14: #33c5ba

! white
*.color7: #bfbaac
*.color15: #fdf6e3
```

## 1.4. Atajos

| Comando            | Descripción                                     | | | | |
|:-------------------|:------------------------------------------------|-|-|-|-|
| Shift+ArrowUp      | Scroll hacia arriba                             |<td colspan=4>
| Shift+ArrowDown    | Scroll hacia abajo                              |<td colspan=4>
| C+ArrowLeft        | Desplazar el cursor palabra por palabra         |<td colspan=4>
| C+ArrowRight       | Desplazar el cursor palabra por palabra         |<td colspan=4>
| M-w                | Copia texto seleccionado hacia el portapapeles  |<td colspan=4>
| C-y                | Pega el texto del portapapeles                  |<td colspan=4>

>*Observaciones:*
- Con *M*  nos referimos a MetaKey, que es la tecla Alt
- Con *C* hacemos referencia a la tecla Control
- Los shortcuts de copiar y pegar, los adapte por costumbre de usar Emacs

- - -

# 2. Windows Manager i3wm

## 2.1 Introducción

>Podemos usar el *i3* que no se refiere al procesador, sino al nombre del
>programa que nos permite manejar las terminales de una manera más eficiente
>mediante atajos (shortcuts)
>Más info en https://i3wm.org/docs/userguide.html
https://ericren.me/posts/2019-01-27-minimal-ubuntu-tiling-wm-setup/
https://www.maketecheasier.com/install-use-i3-window-manager-ubuntu/
https://www.dagorret.com.ar/instalar-utilizar-i3-window-manager-ubuntu/
https://opensource.com/article/18/8/getting-started-i3-window-manager

## 2.2 Instalación
```
sudo apt-get install i3 i3status i3lock compton nitrogen -y

# i3: El programa para manejar las ventanas
# i3status: Es la barra de estado que muestra la hora, espacios de trabajo, etc..
# i3lock: Cuando se bloquea la sesión
# compton: Da efectos a las ventanas, como transparencia cuando se hace transición de una ventana a otra
# nitrogen: Para cambiar el wallpaper del espacio de trabajo
```

## 2.3 Configuración
1. Debemos modificar el archivo de i3wm con `sudo nano ~/.config/i3/config`
2. Agregamos a la configuración `bindsym $mod+Return exec rxvt` para abra la terminal **rxvt unicode**
y presionamos el shortcut `Super+Shift+r` para reiniciar **i3wm**
3. Modificamos la configuración de bash con `sudo nano ~./.bashrc/`
4. Agregamos las siguientes lineas
```
# ejecuto neofetch
neofetch --w3m $HOME/Pictures/Wallpapers/wallpaper-hacksign3.jpg
# habilito la zshell
zsh
````

>**Observación**: Cada vez que se abra una terminal con `Super+Ret` se abrirá con la terminal rxvt unicode,
>con el programa neofetch y con la zshell habilitada


## 2.4 Atajos
>Hay ciertos atajos que nos facilitan desplazarnos entre las ventanas, espacios de trabajo, etc..
>sin la necesidad de utilizar el mouse.

| Comando            | Descripción																														|
|:-------------------|:-----------------------------------------------------------------------|
|Super+Ret					 | Abre una terminal																											|
|Super+Shift+e			 | Cerrar sesion de i3																										|
|Super+d 						 | Despliega un menu para ejecutar lineas de comando											|
|Super+Shift+r 			 | Reinicia el entorno i3 y mantiene los espacios de trabajo							|
|Super+Shift+c 			 | Recarga archivos de configuración de i3																|
|Super+Shift+Q 			 | Cierra la ventana																											|
|Super+Flecha 			 | Cambiar cursor a otra ventana																					|
|Super+Shift+ArrowKey| Mueve la ventana																												|
|Super+n						 | Cambia el espacio de trabajo (Siendo **n** un número)									|
|Super+v Super+Ret 	 | Establece que las próximas ventanas se abran en vertical							 	|
|-Super+Shift+n 	 	 | Mueve una ventana a otro espacio de trabajo (Siendo **n** un número) 	|

> La combinación de comandos `Super+v Super+Ret`, quiere decir que luego de presionar `Super+v` presionamos  `Super+Ret`
> y las proximas nuevas ventanas que se abran con `Super+Ret` se apilaran debajo de la que estemos posicionados.

**Modo Resize:**
>Para cambiar el tamaño de las ventanas
    1. Super+r Activa el modo Resize
		2. ArrowKey (para ajustar el tamaño)
		3. Ret (para aplicar el cambio)
		
**Modo Widescreen:**
>Para agrupar varias pestañas que estan una debajo de la otra en una sola con tantas pestañas como ventanas tuviera debajo
    -Super+w superpone la ventana a las que tenga arriba y debajo
		-Super+ArrowKey para desplazarnos entre las pestañas
		-Super+e Desactiva el modo Widescreen

>**Observaciones**:
- **Super** es la tecla que asignamos al configurar i3 (suele ser Windows ó Alt).
- **Ret** se suele referir a la tecla **Enter**
- **ArrowKey** es cualquiera de las flechas del teclado

- - -

# 3. Usando w3m y w3m-img
>Con el programa `w3m` podemos navegar via internet mediante la terminal de comandos,
>mientras que con `w3m-img` nos permite visualizar imagenes desde la terminal.


- - -

# 4. Rofi

<img src=/images/rufi-menu.png>

## 4.1 Introducción
>Parecido a una terminal? permite ejecutar comandos, diferencia? facilidad?
>Este programa nos despliega un menu (parecido al dmenu) y facilita la ejecución de
>programas mediante lineas de comando, evitando tener que abrir una terminal.

## 4.2 Instalación
```bash
sudo apt-get install rofi -y # instalamos el paquete
rofi -show run # para probar que se instaló con éxito, deberia desplegar un menú
```

## 4.3 Configuración - Cambiar Theme

>Suponiendo que ya tenemos instalado y configurado con i3

1. Desplegamos el menú de lineas de comandos con `Super+d`  (Por default abre dmenu, pero en mi configuración ejecuta Rofi)
2. Escribimos `rofi-theme-selector` y luego seleccionamos el theme que querramos (Monokai, Solarized, etc..)
3. Para ver la lista de themes instalados escribimos `ls /usr/share/rofi/themes`
4. Modificamos el archivo de configuración de **i3wm**
```bash
sudo nano ~/.config/i3/config/
```

5 . Agregamos la siguiente linea en el archivo del paso anterior
```
bindsym $mod+d exec rofi -show run -opacity "80" -columns 2 -theme Monokai
# $mod+d: es el atajo de teclas
# exec rofi: ejecutamos el programa Rofi

# los parámetros son los siguientes:
# -show run: despliega el menu de Rofi
# -opacity "80": le agrega transparencia a la ventana del menu
# -columns 2: separa la lista de comandos en 2 columnas
# -theme Monokai: le asigna el theme Monokai que instalamos previamente
```

6 . Reiniciamos el **i3wm** con `Mod+Shift+R`

Por último podemos probar si los cambios surtieron efectos ejecutando `Mod+d`

- - -

# 5. Nitrogen

>Nos da la opción de elegir y agregar fondos de pantalla al sistema

<img src=/images/nitrogen.jpg>

## 5.1 Instalación
```bash
sudo apt-get install nitrogen -y
```

## 5.2 Configuración
>Para seleccionar los wallpaper es necesario indicar en donde
>estan localizados, por tanto en la terminal escribimos lo siguiente
```bash
nitrogen $HOME/Pictures/Wallpapers
```
Luego aparecerá una pantalla con las imágenes guardadas en esa ruta,
elegimos la imagen preferida aplicamos los cambios presionando en **Apply**

- - -

# 6. Compton

>Es un compositor de ventanas, que agrega efectos como animación
>de desvanecimiento cuando nos movemos entre ventanas.

<img src=/images/mrHacmk.png>

## 6.1 Instalación
>Ejecutamos la siguiente linea de comando en la terminal
```bash
sudo apt-get install compton -y
```

## 6.2 Configuración
>Suponiendo que tenemos instalado y configurado **i3wm**, agregamos en el
>archivo de configuración la siguiente linea
```
exec_always compton -f # este comando se ejecutará cada vez que inicie i3wm
```

- - - 

# 7. i3Blocks
>Muestra la información de la barra de estado en formato json,
>y nos facilita decirle al i3wm que datos mostrar.

## 7.1 Instalación
>Ejecutamos la siguiente linea de comando en la terminal
```bash
apt-get install i3blocks -y
```

## 7.2 Configuración

1. Copiamos la configuración al directorio de **i3wm** `cp /etc/i3blocks.conf ~/.config/i3/`
2. Modificamos en `~/.config/i3/i3blocks.conf` lo que queremos que aparezca en la barra de estado
3. Reiniciamos el **i3wm** con `Super+Shift+R`
4. Modificamos la configuración de **i3wm** con `sudo nano ~/.config/i3/config` y buscamos la linea
que diga **bar**
```bash
bar{
		status_command i3blocks ~/.config/i3/i3blocks.conf  # para modificar la barra de estado
		position top # con esto se posiciona arriba de la pantalla
}
```

- - -

# 8. Ranger File Manager 
>Para navegar de forma didáctica por los directorios mediante la terminal,
>además del manejo de archivos (Copiar, mover, borrar, etc..)

## 8.1 Instalacion && Ejecucion
>En la terminal solo ejecutamos la siguiente linea de codigo
```bash
sudo apt-get install ranger -y # para instalar en ubuntu
```

**Observación:** Para iniciarlo ejecutamos desde la terminal con `ranger`

## 8.2 Atajos
- Shift+q Salir de la terminal

## 8.3 Configuración
1. Modificamos el archivo de configuración con `sudo nano ~/.config/ranger/rc.conf`
2. Buscar las lineas que dejamos comentadas con **#** y cambiar por la que aparece debajo
```
# set preview_images false 
set preview_images true

# set draw_borders false
set draw_borders true

set preview_images_method w3m
```
3. Nos aseguramos de tener instalado w3m ejecutando `sudo apt-get install w3m -y`
4. Aplicamos los cambios de la configuración `source ~/.config/ranger/rc.conf`

- - -

# 9. Neofetch
>Para ver información del sistema operativo

## 9.1 Instalación
```bash
sudo add-apt-repository ppa:dawidd0811/neofetch
```

## 9.2 Configuración
1. Modificamos el archivo de configuración de bash con `sudo nano ~/.bashrc`
2. Agregamos la siguiente configuración
```bash
# Cada vez que se abra la terminal aparecerá la información del sistema
# y además la imagen que aparece en esa ruta
neofetch --w3m $HOME/Pictures/Wallpapers/wallpaper-hacksign3.jpg
```

>**Observación**: Se debe tener cuidado al modificar el archivo `.bashrc`

- - -

# 10. Otros

## 10.1 Agregar color a la terminal
>Una de las maneras es mediante la página **Gogh**[Ir a Página](https://www.linuxuprising.com/2019/07/179-color-schemes-for-your-gtk-based.html)

## 10.2 Fuentes 
>Con el **Font manager** podemos elegir entre varias fuentes para cambiar la tipografía [Ir a Página](https://itsfoss.com/install-fonts-ubuntu/#targetText=To%20install%20several%20fonts%20at,show%20hidden%20files%20in%20Ubuntu.)

- - -

# Referencias
- Configuraciones de otros usuarios
    - Referencia #1 - Gerardbm [Ver Página](https://github.com/gerardbm/dotfiles)
		- Referencia #2 - HackerNoon [Ver Página](https://hackernoon.com/how-to-trick-out-terminal-287c0e93fce0)
    - Referencia #3 - Reddit [Ver Página](https://www.reddit.com/r/unixporn/)
    - Referencia #4 - Reddit [Ver Página](https://www.reddit.com/r/unixporn/comments/baz6j0/bspwm_rxvtunicode_redgreenblueshift/
    - Referencia #5 - Manjaro [Ver Página](https://forum.manjaro.org/t/noteworthy-november-2016-screenshots/11997/7)
    - Referencia #6 - BrianCaffey [Ver Página](https://briancaffey.github.io/2017/10/17/moving-from-gnome-to-i3-on-arch-linux.html)

- ZShell
    - Referencia #1 - [Ver Vídeo](https://www.youtube.com/watch?v=ADytC9a2g2Y)
		- Referencia #2 - [Ver Video](https://www.youtube.com/watch?v=4KBuPCeF9Gc)
		- Personalizar Theme Agnoster [Ver Página](https://charles4code.blogspot.com/2018/07/show-username-only-without-hostname-in.html)

- Neofetch - Ver Informacion del Sistema
    - Referencia #1 - DylanRaps [Ver Página](https://github.com/dylanaraps/neofetch/wiki/Image-Backends)
    - Referencia #2 - DesdeLinux [Ver Página](https://blog.desdelinux.net/neofetch-obten-informacion-de-tu-equipo-y-sistema-en-la-terminal/)
    - Referencia #3 - OsTechnix [Ver Página](https://www.ostechnix.com/neofetch-display-linux-systems-information/)		

-Instalar y configurar i3wm
    - Documentación Oficial #1 [Ver Página](https://i3wm.org/)
    - Documentación Oficial #2 [Ver Página](https://i3wm.org/docs/userguide.html#_configuring_i3bar)
    - Opcion #1 [Ver Video](https://www.youtube.com/watch?v=8-S0cWnLBKg)
    - Opcion #2 [Ver Vídeo](https://www.youtube.com/watch?v=CREit-6_IgI&t=928s)

- Compton [Ver Vídeo](https://www.youtube.com/watch?v=5GpyaSEe0VY)
- Polybar [Ver Vídeo](https://www.youtube.com/watch?v=7RNgpvBMua0)

- Rofi
    - Referencia #1 [Ver Video](https://www.youtube.com/watch?v=wcMyH3o5FMg)
    - Referencia #2 [Ver Video](https://www.youtube.com/watch?v=Sa9SWMvAMIU)

- Terminal RXVT Unicode
    - Documentación #1 por ArchLinux [Ver Pagina](https://wiki.archlinux.org/index.php/Rxvt-unicode_(Espa%C3%B1ol))
    - Documentación #2 por Gentoo [Ver Página](https://wiki.gentoo.org/wiki/Rxvt-unicode)
    - Configuración #1 por Addy [Ver Pagina](https://addy-dclxvi.github.io/post/configuring-urxvt/)		
    - Configuración #2 [Ver Vídeo](https://www.youtube.com/watch?v=_kjbj-Ez1vU)
    - Pugins [Ver Página](https://github.com/muennich/urxvt-perls)
    - Habilitar transparencia [Ver Pagina](https://wiki.archlinux.org/index.php/Rxvt-unicode/Tips_and_tricks#Transparency)
		
- Ranger Terminal File Manager
    -Documentacion Oficial [Ver Pagina](https://github.com/ranger/ranger)
    -Wiki, por ArchLinux [Ver Pagina](https://wiki.archlinux.org/index.php/Ranger)
    -Referencia 1, por Vitux [Ver Pagina](https://vitux.com/how-to-install-ranger-terminal-file-manager-on-linux/)
    -Referencia 2, por Vultr [Ver Pagina](https://www.vultr.com/docs/how-to-install-ranger-terminal-file-manager-on-linux)
		
- Fuentes recomendadas para programar
    - Fuentes por Webos [Ver Página](https://wesbos.com/programming-fonts/)
    - Referencia #1 Hivellogic [Ver Página](http://hivelogic.com/articles/top-10-programming-fonts/)
    - Referencia #2 Narga [Ver Página](https://www.narga.net/top-best-programing-fonts/)
    - Referencia #3 Slant [Ver Página](https://www.slant.co/topics/7014/~fonts-to-use-in-a-terminal-emulator)

https://github.com/bookercodes/dotfiles/tree/arch


