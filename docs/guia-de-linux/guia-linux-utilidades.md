# Sincronizar Servicios Cloud con Rclone

## Comandos basicos de Rclone

| Comando                                       | Descripcion                                                    |
| rclone listremotes                            | Lista los servicios                                            |
| rclone config                                 | Muestra la configuracion                                       |
| rclone ls unRemoto:                           | Lista los archivos y directorios de unRemoto                   |
| rclone lsd unRemoto:                          | Lista solo los directorios                                     |
| rclone mkdir unRemoto:unaCarpeta              | Crea el directorio unaCarpeta en el remoto unRemoto            |
| rclone sync unRemoto:unaCarpeta ~/Escritorio/ | Sincroniza contenido del remoto a una carpeta la maquina local |
|                                               |                                                                |

**Observaciones:**
- Es posible que necesites agregar sudo 
- Es importante que en los comandos seguido de nombre del remoto Ej. unRemoto, se agreguen dos puntos


## Encriptar archivos 
 - https://rclone.org/crypt/
 - https://www.youtube.com/watch?v=jW_4KRd3Hdo
 - https://www.youtube.com/watch?v=KBr_qf5G4CY
 - https://www.youtube.com/watch?v=-b9Ow2iX2DQ

## Referencias
- [Referencia #1 - Ver video](https://www.youtube.com/watch?v=HblhrGIotFo)
- [Panel de APIs y Servicios (developers.google.com)](https://console.developers.google.com/projectselector2/apis/dashboard)
- [Configurar Google Drive (rclone.org)](https://rclone.org/drive/)
- [Encriptar archivos - Ver Video](https://www.youtube.com/watch?v=jW_4KRd3Hdo)


# Respaldar configuraciones

## Instalaste Stow
>GNU Stow sirve para manejar los archivos de configuracion (conocidos como Dotfiles) mediante el subversionado

1. Primero lo instalamos
``aurman -S stow``

2. Creamos una carpeta **dotfiles** en el Escritorio 
Es donde guardaremos las configuraciones
```
mkdir ~/dotfiles
```

3. Creamos los directorios de los programas a respaldar
```
mkdir spacemacs
mkdir -p emacs emacs.d
```

4. Movemos los archivos de configuracion a las carpetas
```
mv ~/.spacemacs ~/dotfiles/spacemacs
mv ~/.emacs.d/init.el ~/dotfiles/emacs
```

5. Ejecutar el comando stow en los directorios
Lo que va a hacer es crear un enlace simbolico en la ruta ~ de los archivos de configuracion,
por tanto tendras el original en el directorio *dotfiles*

```
stow spacemacs
stow emacs
```

Observacion:
Para que funcione es importante que el directorio **dotfiles** este ubicado en la raiz, asi **~/dotfiles**
porque crea los enlaces simbolos un nivel mas arriba de la carpeta dotfiles es decir ~

[Referencia #1 - Ver Página](https://tomeaton.uk/blog/jekyll/update/2017/10/25/Managing-dotfiles-with-GNU-stow.html)
[Referencia #2 - Ver Página](https://dev.to/writingcode/how-i-manage-my-dotfiles-using-gnu-stow-4l59)
http://www.garin.io/dotfiles-with-stow
[Referencia #3 - Ver Página](https://dotfiles.github.io)

https://blog.resuelve.io/gestionando-dotfiles-con-gnu-stow-b3cb0d7d40a2
https://www.youtube.com/watch?v=zhdO46oqeRw
