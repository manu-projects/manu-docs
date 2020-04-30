# 1. Particionar disco

## 1.1 Crear particiones
> Creamos dos particiones primarias y una SWAP
1. Una particion primaria **/home** que usaremos como escritorio, le asignamos 20,50GB o el espacio que querramos
2. Una partición primaria **/** que será para el sistema, le asignamos 8 GB
3. Una SWAP para la memoria, asignamos 2GB

```bash
# iniciamos el proceso de particionar
fdisk /dev/sda
# presionamos 'n' para crear una particion
# presionamos 'p' para listar las particiones creadas
# presionamos 'w' para guardar los cambios

 # listamos las particiones, para verificar que aparezcan
fdisk -l
```

>Observación: La virtualbox bajada con vagrant solo necesitas crear 1 partición primaria /home, y formatear esta nueva.

## 1.2 Formatear particiones primarias

```bash
# cambiamos /dev/sda3 por el que aparezca cuando creamos las particiones primarias

mkfs.ext4 /dev/sda3
```

>Observación: En mi caso solo tuve que formatear una sola,

## 1.3 Montamos las unidades (Filesystem)

```bash
mkdir /mnt/home
mount /dev/sda3 /mnt/home
```

- - -

# 2. Paquetes

## 2.1 Agregamos el pacstrap
> Investigar en detalle
> Sino lo hacemos no podremos correr el comando pacstrap

```bash
yes | pacman -S pkgfile # 1. instalamos pkgfile
pkgfile --update # 2. lo actualizamos
pkgfile pacstrap # 3.  algo..?
yes | pacman -S extra/arch-install-scripts  # instalamos los scripts faltantes
```

## 2.2 Agregamos mas paquetes
> Investigar más

```bash
pacstrap /mnt base base-devel
```

- - - 

# 3. Modificamos el la red

## 3.1 Configuramos el hosts

```bash
nano /etc/hosts
127.0.0.1	localhost
::1		localhost
127.0.0.1	arch-linux.localdomain	arch-linux
```

## 3.2 Configuramos los DNS

```bash
nano /etc/resolv.conf
nameserver 1.1.1.1
nameserver 8.8.8.8
```

- - - 

# 3. Configuración GRUB


```bash
pacman -S --noconfirm grub # instalamos package grub
grub-install /dev/sda # instalamos el grub en el disco

# no tuve que crear el mkconfig porque ya estaba creada
#grub-mkconfig -o /boot/grub/grub.cfg # creamos la configuración 
#passwd root # para cambiar la clave del root

pacman -Syu # para actualizar el linux (es como un apt-get upgrade)
```

# 3.2 Agregamos la nueva unidad al filesystem

```bash
nano /etc/fstab
/dev/sda3 /home ext4 defaults 0 2
```

- - -

## 4. configuración de red

- - -

## 5. Entorno gráfico
>Para poder empezar a usar una interfaz gráfica

```bash
pacman -Syu # actualizamos la distribución de linux
pacman -S --noconfirm -xorg-server # instalamos el servidor para el entorno gráfico
pacman -S --noconfirm gnome gnome-extra # instalamos el escritorio Gnome

systemctl enable gdm # activamos el servicio del escritorio Gnome (se creará un enlace simbólico)
```

- - -

# Referencias
[Configuración - Ver Video](https://www.youtube.com/watch?v=AdDw8qIQzW8)
[Configuración # 1 - Ver Página](https://www.drivemeca.com/arch-linux-guia-de-instalacion/)
[Configuración #2 - Ver Página](https://www.vagrantup.com/docs/cli/ssh_config.html)

- - -

# Vagrant

## Conectarse a mariadb
>Para evitar errores al conectarse ingresar la siguiente linea de comando

```
# pedirá la contraseña que ingresamos al momento de instalar mariadb-server
mysql -u root -p
```

# Compartir directorios
>Para compartir archivos y directorios entre la maquina local y la virtual

1. Entramos al servidor `vagrant ssh`
2. Creamos el archivo o carpeta en `~/vagrant/`
3. Luego ya podemos acceder desde la maquina local en el directorio que tengamos el Vagrantfile

Ej.

```
mkdir ~/vagrant/curso-mysql # creamos una carpeta
touch ~/vagrant/archivo.sql # creamos un archivo sql
```

[Referencia #1 - Vagrantup](https://www.vagrantup.com/intro/getting-started/synced_folders.html)
[Referencia #2 - Stackoverflow](https://stackoverflow.com/questions/18528717/vagrant-shared-and-synced-folders)
[Referencia #3 - Drupalize](https://drupalize.me/videos/sharing-files-between-your-guest-and-host-machines?p=1526)

# Configuración en ArchLinux

## 1.1 Ingresar Usuario por VirtualBox
usuario: root
password: vagrant
[Referencia #1 ](https://bbs.archlinux.org/viewtopic.php?id=243685)

## 1.2 Redimensionar espacio en disco
1. Instalar via terminal un plugin
```
vagrant plugin install vagrant-disksize
```
2. Modificar la configuración  del .Vagrant
```bash
   config.vm.box = 'ubuntu/xenial64'
   config.disksize.size = '50GB'
```
3. Reiniciar la máquina virtual
```bash
vagrant halt 
vagrant up
```

## 1.3 Cambiar configuración SSH

1.  Cambiar en el archivo .Vagrant

```
# si quiero cambiar el usuario al que se conecta
config.ssh.username = 'root'
config.ssh.password = 'MONICA'
```

[Referencia #1](https://computingforgeeks.com/how-to-fix-vagrant-ssh-authentication-failure-after-packaging-vagrant-box/)

- - - 
# 2. Posibles errores

## 2.1 Guest aditions
>turur si tenes problemas con conectarte

```bash
vagrant plugins install vagrant-vbguest # instalar
vagrant vbguest --status #revisar
vagrant vbguest # correr
```

[Referencia #1](https://medium.com/@thucnc/how-to-increase-disk-size-on-a-vagrant-vm-using-virtualbox-c3d24acee3f4)
[Referencia #2](https://marcbrandner.com/blog/increasing-disk-space-of-a-linux-based-vagrant-box-on-provisioning/)

# 3. Plugins
vagrant-disksize
vagrant-vbguest
