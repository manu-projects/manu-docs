# Gestores de Paquetes

- - -

## 1. Comandos Basicos

```bash
pacman -S     # Install a package(s)  
pacman -Rs   # Remove a package(s)  
pacman -Ss   #  Search for package(s) 
pacman -Syu # Upgrade Packages    
```

## 1.2 Instalar un package y evitar confirmar la instalación 

```bash
pacman -S --noconfirm apache
# yes | pacman -S apache  # sería otra alternativa
```

## 1.3 Cambiar Gestor de Paquetes

#### 1.3.1 Instalacion
1. Para instalar ingresar lo siguiente en la terminal

```
git clone https://aur.archlinux.org/aurman.git
cd aurman
makepkg -si
```

2. Para buscar paquetes ```aurman -Ss <package-name>```

3. Para instalar paquetes ```aurman -S <package-name>```

#### 1.3.2 Problemas frecuentes

```
==> Validando los archivos source con md5sums...
    aurman_sources ... Omitido
==> Verificando las firmas de las fuentes con gpg...
    aurman_sources git repo ... HA FALLADO (clave pública desconocida 465022E743D71E39)
==> ERROR: ¡No se ha podido verificar alguna de las firmas PGP!
```

**Solucion:**

1- Ingresar en la terminal el comando `gpg --recv-key` seguido de la clave publica que aparezca en el error

```bash
gpg --recv-key 465022E743D71E39
```

2-  Volver a compilar con ``makepkg -si`` 


### 1.3.3 Referencias

- [Problemas al instalar Aurman (forum.manjaro.org)](https://forum.manjaro.org/t/aur-package-fails-to-verify-pgp-gpg-key-unknown-public-key-one-or-more-pgp-signatures-could-not-be-verified/42687)
- [Alternativas para reemplazar yaourt (linuxadictos.com)](https://www.linuxadictos.com/las-mejores-alternativas-para-reemplazar-yaourt-en-arch-linux.html)
- [Yaourt esta deprecado en Arch Linux (maslinux.net)](https://maslinux.es/yaourt-esta-muerto-utiliza-estas-alternativas-para-aur-en-arch-linux/)

- - -

## 2. Posibles errores

#### 2.1 fdisk: cannot open /dev/sda: Permission denied
> Escribir en la terminal `su` presionar Enter, y escribir la password

#### 2.2 No funciona Pacstrap
> El error en consola sería el siguiente:

```
[root@archlinux vagrant]# pacstrap
bash: pacstrap: command not found
```

**Solución:**

```
 # 1. instalamos pkgfile
yes | pacman -S pkgfile

 # 2. lo actualizamos
pkgfile --update


pkgfile pacstrap # 3.  algo..?

 # instalamos los scripts faltantes
yes | pacman -S extra/arch-install-scripts
```

#### 2.3 Referencias

- [Referencia #1 - Arch Linux Arm](https://archlinuxarm.org/forum/viewtopic.php?f=60&t=8529)

- - -

# Referencias 
- [Pacman Comandos - Documentación Oficial ](https://wiki.archlinux.org/index.php/Pacman)
- [Referencia #1 - StackOverflow](https://stackoverflow.com/questions/35343707/linux-apt-get-command-not-found-how-to-install-a-package-in-arch-linux)
- [USB Flash Installation Media - Wiki ArchLinux](https://wiki.archlinux.org/index.php/USB_flash_installation_medium_(Espa%C3%B1ol))
- [Multiboot Usb Drive - Wiki ArchLinux](https://wiki.archlinux.org/index.php/Multiboot_USB_drive_(Espa%C3%B1ol))

