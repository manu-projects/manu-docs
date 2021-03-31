# Conceptos basicos

## 1. Particionar Disco

### 1.1 Partición para Almacenamiento
> Creamos una partición primaria del tipo NTFS y le asignamos los permisos al usuario
> Con el comando ``id -u -n`` obtenemos el nombre de usuario, mientras que con ``chown`` 
> le damos acceso a un usuario especifico a un directorio/archivo

```bash
id -u -n # para saber el nombre de usuario
sudo chown nombreUsuario /storage/ # para asignarle los permisos de ese usuario
```

### 1.2 Saber las particiones
> Podemos usar el comando ``lsblk`` o ``fdisk``

```bash
lsblk # listar particiones (no pide permisos administrador)
sudo fdisk -l /dev/sda # listar particiones (pide permisos administrador)
```

### 1.3 Montar la particion de Almacenamiento NTFS
>Si la partición va interactuar entre Windows y Linux, se recomienda que sea NTFS. Si sólo va a ser entre distribuciones Linux, se recomienda Ext4

>Destacamos un comentario de otro usuario linux "A good practice for some static mounted storage system like you are doing is to add a permanent mount point to /etc/fstab. There are several ways to do it, but I just wanted you to be aware."

##### 1.3.1 Creamos el directorio de almacenamiento que vamos a compartir
> Recordando que la ruta **/** es la raiz y **mnt*** el directorio que se 
> se suele utilizar por defecto para acceder desde los demas distribuciones

> Tambien que con el comando ``mkdir`` seguido del parametro **-p** nos facilita
> un directorio A con subdirectorio B (dentro del directorio A)

```
sudo mkdir -p /mnt/mystorage # Creamos el directorio mnt y dentro mystorage
```

##### 1.3.2 Montamos la partición con la carpeta
- Con ``id -u`` nos permite obtener el nombre de usuario que esta en la sesion actual de la terminal
- Los parametros del comando ``mount``
    1. **-uid** le pasamos el usuario que nos devuelve ``id -u``
    2. **dmask** 
    3. **fmask**
    4. **/dev/sda10** es la particion de almacenamiento

```
id -u # nos devuelve el id del usuario con el que iniciamos la sesion

# solo cambiamos el 1001 por lo que nos devuelve id -u
sudo mount -o rw,user,uid=1001,dmask=007,fmask=117 /dev/sda10 /mnt/mystorage

#sudo mount -t ntfs -o ro /dev/sda10 /mnt/mystorage
```

### 1.4 Anclamos la carpeta al Gestor de archivos
> El File manager por defecto de Ubuntu es Nautilus

```
cd /mnt/mystorage # presionar Control+D
```

### 1.5 Referencias

- [Referencia #1 - Ver Video](https://www.youtube.com/watch?v=mPDhoYNao1o)
- [Referencia #2 - Ver Pagina](https://linuxconfig.org/how-to-mount-partition-with-ntfs-file-system-and-read-write-access)
- [Referencia #3 - Ver Página](https://askubuntu.com/questions/11840/how-do-i-use-chmod-on-an-ntfs-or-fat32-partition/956072#956072)
- [Referencia #4 - Ver Video](https://www.youtube.com/watch?v=hIq1dIgZrOc)
- [Referencia #5 - Ver Video](https://www.youtube.com/watch?v=ZlIbGnvTEDI) 
-  [Agregar carpetas al Nautilus - Ver Página](https://askubuntu.com/questions/1109247/how-do-i-add-folder-to-ubuntu-18-04-1-nautilus-bookmark-list)
- [Opciones de Montaje - Ver Pagina (it-swarm.dev)](https://www.it-swarm.dev/es/mount/opciones-de-montaje-dmask-y-fmask/961637140/)
- [Particiones primarias/logicas/extendidas - Ver Video](https://www.youtube.com/watch?v=CSbUiK2pytE)
- [Recuperar Tabla de Particiones - Ver Video](https://www.youtube.com/watch?v=I1-0cpPO3e8)
- [Redimensionar Particiones en Ubuntu - Ver Video](https://www.youtube.com/watch?v=EQMWKwvsltY)
- [Redimensionar particiones - Ver Videos](https://www.youtube.com/watch?v=OSkK_lgSCzk)
- [Particionar disco duro en Ubuntu - Ver Video](https://www.youtube.com/watch?v=xuYhjtpWZuc)

- - -

## 2. Bootear Multiples Sistemas Operativos
> Si tenes un sistema operativo por defecto por ejemplo Windows, y lo queres mantener
> podemos recurrir a como dicen "bootear" varios sistemas operativos, en este caso seria 
> varias distribuciones de linux.
> Por lo general se suele crear un GRUB el que se ira modificando

#### 2.1 Referencias

- [Referencia #1 - Ver Página](https://medium.com/@manujarvinen/setting-up-a-multi-boot-of-5-linux-distributions-ca1fcf8d502)
- [Referencia # 2 - Ver Página](https://www.maketecheasier.com/how-to-run-multiple-linux-distros-without-virtualization/)
- [MultipleLInuxONe - Ver Página](https://itsfoss.com/multiple-linux-one-usb/)
- [Referencia #3 - Ver Página](https://www.solvetic.com/tutoriales/article/5859-como-crear-usb-booteable-linux-con-iso/)
- [Referencia #4 - Ver Página](https://linuxmint-installation-guide.readthedocs.io/es/latest/burn.html)

- - -

## 3. Particionar con GParted
>Es el que se recomienda para particionar el disco

#### 3.1 Referencias

- [Pagina Oficial - Ver Página](https://gparted.org/download.php)

- - -

## 4. Instalar un file manager

```bash
sudo apt-get install thunar
```

- - -

# Mas Referencias

- Como funciona el Filesystem de Linux - # Referencia 1  [Ver Video](https://www.youtube.com/watch?v=HIXzJ3Rz9po)
- Como funciona el Filesystem de Linux - # Referencia 1  [Ver Video](https://www.youtube.com/watch?v=HbgzrKJvDRw)
- [Redimensionar con Gparted en Ubuntu - Ver Video](https://www.youtube.com/watch?v=PBHFud-Dva8)

- - -

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
