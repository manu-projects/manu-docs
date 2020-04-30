# Revisar Links
https://unix.stackexchange.com/questions/466625/cp-cannot-create-regular-file-permission-denied
https://www.linuxadictos.com/solucion-al-error-read-only-file-system.html

```
grub-install -v # saber la version de grub 
```

>I install Ubuntu GNOME (mount point: / ) into /dev/sda5. I remember to give mount points to /work (ext4) and /storage (NTFS) like mentioned in the 2.3 section of this article. Be careful not to mark them as to be formatted.
>The Swap partition gets automatically recognized, no need to worry about that.

- - -

>I install Manjaro XFCE to /dev/sda6 partition. And once again, I remember to give mount points to /work (ext4) and /storage (NTFS) and to NOT format them.

- - -

>I install Kubuntu ( / ) to /dev/sda8. Mount points also to /work (ext4) and /storage (NTFS), again. 
>And, the Swap partition gets automatically recognized, again. And finally, after installation is successfully finished, one last time to install the Refind boot manager in Terminal in Xubuntu:

- - -

# 1. Particionar

## 1.1 Partición para Almacenamiento

1. Crear una partición primaria del tipo NTFS
2. Asignarle desde la terminal los permisos al usuario
Para esto usamos `id -u -n` en caso de que no sepamos el nombre de usuario
```bash
sudo chown nombreUsuario /storage/
```
## 1.2 Saber las particiones

```bash
lsblk # listado de particiones
```
## 1.3 Montar la particion de Almacenamiento NTFS
>Si la partición va interactuar entre Windows y Linux, se recomienda que sea NTFS. Si sólo va a ser entre distribuciones Linux, se recomienda Ext4

>A good practice for some static mounted storage system like you are doing is to add a permanent mount point to /etc/fstab. There are several ways to do it, but I just wanted you to be aware.

https://www.youtube.com/watch?v=mPDhoYNao1o

```bash
# mnt: para acceder desde cualquier distro
# particion de almacenamiento: sda10

# 1. creamos el directorio de almacenamiento
sudo mkdir -p /mnt/mystorage


# 2. montamos la partición con la carpeta
# para saber el id de un usuario
id -u
# cambiamos el 1001 por lo el ID del usuario
sudo mount -o rw,user,uid=1001,dmask=007,fmask=117 /dev/sda10 /mnt/mystorage

#sudo mount -t ntfs -o ro /dev/sda10 /mnt/mystorage

# 3. agregamos la carpeta en Nautilus
# es el windows manager de ubuntu
cd /mnt/mystorage # presionar Control+D
```

[Referencia #1 - Más info](https://linuxconfig.org/how-to-mount-partition-with-ntfs-file-system-and-read-write-access)
[Referencia #2 - Ver Página](https://askubuntu.com/questions/11840/how-do-i-use-chmod-on-an-ntfs-or-fat32-partition/956072#956072)

[Referencia #2 - Ver Video](https://www.youtube.com/watch?v=hIq1dIgZrOc)
https://www.youtube.com/watch?v=ZlIbGnvTEDI
Agregar carpetas al Nautilus[Ver Página](https://askubuntu.com/questions/1109247/how-do-i-add-folder-to-ubuntu-18-04-1-nautilus-bookmark-list)

## 1.3 Instalar un file manager

```bash
sudo apt-get install thunar
```

- - -

## 1. Multiples Distribuciones
[Referencia #1 - Ver Página](https://medium.com/@manujarvinen/setting-up-a-multi-boot-of-5-linux-distributions-ca1fcf8d502)
[Referencia # 2 - Ver Página](https://www.maketecheasier.com/how-to-run-multiple-linux-distros-without-virtualization/)

- - -

## 2. Bootear multiples distro de linux en USB
> Para crear un GRUB con varias distribuciones, se recomienda usar **MutipleLInuxOne**

[MultipleLInuxONe - Ver Página](https://itsfoss.com/multiple-linux-one-usb/)

- - -

## 3. Particionar con GParted
>Es el que se recomienda para particionar el disco

[Pagina Oficial - Ver Página](https://gparted.org/download.php)

- - -

## Otras maneras
[Referencia #1 - Ver Página](https://www.solvetic.com/tutoriales/article/5859-como-crear-usb-booteable-linux-con-iso/)
[Referencia #2 - Ver Página](https://linuxmint-installation-guide.readthedocs.io/es/latest/burn.html)

- - -

# Referencias

- Como funciona el Filesystem de Linux - # Referencia 1  [Ver Video](https://www.youtube.com/watch?v=HIXzJ3Rz9po)

- Como funciona el Filesystem de Linux - # Referencia 1  [Ver Video](https://www.youtube.com/watch?v=HbgzrKJvDRw)
