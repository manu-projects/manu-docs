## 1. Descargar Virtualbox
[Ir a Descargas de VirtualBox](https://www.virtualbox.org/wiki/Linux_Downloads)

## 2. Programa para correr Virtualbox
Creamos el archivo con `touch crearMaquinaVirtual.sh` copiamos el código que aparece debajo,
y luego ejecutamos el programa en la terminal con `.\crearMaquinaVirtual.sh miMaquina1`

```
#!/bin/bash
# verificamos que estamos pasando como parametro el nombre de la maquina virtual
if [ ! $1 ]
then
    echo "Error: falta pasar por argumento el nombre de la maquina virtual"
else
    # configuraciones
    NOMBRE_MAQUINA_VIRTUAL=$1 # primer argumento, nombre de la maquina virtual
    CAPACIDAD_MEMORIA=1024 # en Mbytes
    CAPACIDAD_DISCO=10000 # en Mbytes
    DIRECTORIO_MAQUINAS_VIRTUALES="$HOME/VirtualBox VMs"
    #RUTA_IMAGEN_UBUNTU="$HOME/iso/ubuntu-18.04.3-desktop-amd64.iso"
    RUTA_IMAGEN_UBUNTU="$HOME/iso/ubuntu-18.04.3-live-server-amd64.iso"

    echo "Verificando si la maquina virtual existe.."
    if [ -d "${DIRECTORIO_MAQUINAS_VIRTUALES}/${NOMBRE_MAQUINA_VIRTUAL}" ] 
    then
	echo "Deteniendo maquina virtual.."
        vboxmanage startvm $NOMBRE_MAQUINA_VIRTUAL --type emergencystop
	
	echo "Iniciando maquina virtual.."
        VBoxHeadless --startvm $NOMBRE_MAQUINA_VIRTUAL
    else
	echo "Verificando si el package extension está instalado.."
	sh actualizarVirtualBoxExtension.sh # ejecutamos el archivo (debe existir)

        # creo la vm y la registro
        #VBoxManage createvm --name ${NOMBRE_MAQUINA_VIRTUAL} --register --ostype Ubuntu # para 32 bits
	echo "Creando y registrando Máquina Virtual.."
	VBoxManage createvm --name ${NOMBRE_MAQUINA_VIRTUAL} --register --ostype Ubuntu_64 # para 64 bits
	echo "Configurando Guest Machine.."
	VBoxManage modifyvm ${NOMBRE_MAQUINA_VIRTUAL} --memory ${CAPACIDAD_MEMORIA} --boot1 dvd --vrde on --vrdeport 5001 --acpi on
	
        # 4 NUEVAS CONFIGURACIONES
        # nuevas configuraciones (averiguar mas de vrde server, pae, nic1 nat, natpf1 guestssh, ..)
	echo "Configurando adaptador de red.."
        VBoxManage modifyvm ${NOMBRE_MAQUINA_VIRTUAL} --nic1 bridged --bridgeadapter1 enp1s0        
        VBoxManage modifyvm ${NOMBRE_MAQUINA_VIRTUAL} --nic1 nat
        VBoxManage modifyvm ${NOMBRE_MAQUINA_VIRTUAL} --natpf1 "ssh,tcp,,4422,,22"
        VBoxManage modifyvm ${NOMBRE_MAQUINA_VIRTUAL} --pae on

	echo "Agregando controladores SATA.."
        #asigno la capacidad en disco a utilizar
        VBoxManage createvdi --filename "${DIRECTORIO_MAQUINAS_VIRTUALES}/${NOMBRE_MAQUINA_VIRTUAL}/${NOMBRE_MAQUINA_VIRTUAL}-disk01.vdi" --size ${CAPACIDAD_DISCO}
        #le agrego el uso de dispositivos
        VBoxManage storagectl ${NOMBRE_MAQUINA_VIRTUAL} --name "IDE Controller" --add ide
        VBoxManage storageattach ${NOMBRE_MAQUINA_VIRTUAL} --storagectl "IDE Controller" --port 0 --device 0 --type hdd --medium "${DIRECTORIO_MAQUINAS_VIRTUALES}/${NOMBRE_MAQUINA_VIRTUAL}/${NOMBRE_MAQUINA_VIRTUAL}-disk01.vdi"
        VBoxManage storageattach ${NOMBRE_MAQUINA_VIRTUAL} --storagectl "IDE Controller" --port 1 --device 0 --type dvddrive --medium ${RUTA_IMAGEN_UBUNTU}
	# despues de instalar, correr lo sig. para sacar la imagen, sino no arranca el sistema instalado
	# vboxmanage storageattach test5 --storagectl "IDE Controller" --port 1 --device 0 --type dvddrive --medium none
    fi
fi

export PATH=$HOME/bin/myscripts
```

# Descargar compiladores viejos 
Cambiar en el enlace la version que necesitas
https://www.virtualbox.org/wiki/Download_Old_Builds_5_1

# 2. Comandos utiles
#### 2.1 Modificar configuración mientras esta apagada
  `vboxmanage modifyvm nombreMaquinaVirtual --natpf3 "guestssh,tcp,127.0.0.1,2222,,22"`

#### 2.2 Modificar configuración mientras se ejecuta
  `vboxmanage controlvm nombreMaquinaVirtual natpf3 "guestssh,tcp,127.0.0.1,2222,,22"`
  
#### 2.3 Encender maquina virtual desdela terminal
  `vboxheadless -s nombreMaquinaVirtual`

#### 2.4 Apagar maquina virtual
  `VBoxManage controlvm "testvm" poweroff`

#### 2.5 Buscar si existe maquina virtual 
  `VBoxManage showvminfo "testvm"`

#### 2.6 Listar maquinas virtuales creadas
  `VBoxManage list vms`

#### 2.7 Listar maquinas virtuales que se estan ejecutando
  `VBoxManage list runningvms`

#### 2.8 Conectarse a la maquina virtual desde la terminal
  `rdesktop -a 16 -N localhost:3389`

#### 2.9 Listar las extensiones instaladas
  `vboxmanage list extpacks`
  
#### 2.10 Agregar usuario
    `sudo usermod -a -G vboxusers unNombreDeUsuario`

#### 2.11 Desinstalar la extension
  `vboxmanage extpack uninstall "Oracle VM VirtualBox Extension Pack"`

#### 2.12 Otros
```
vboxmanage showvminfo programming | grep NIC
modifyvm programming --natpf1 "ssh,tcp,127.0.0.1,5422,,,22"
vboxmanage modifyvm programming --natpf1 "SSH,tcp,127.0.0.1,2522,10.0.2.15,22"
```

## 3.Resolver Posibles errores

### 3.1. No aparece la conexion vrde server escuchando puerto 3389

**Posible solución**
```
$vboxmanage modifyvm vmtest5 --vrde on
```

### 3.2 No permite arrancar via terminal
```
$ vboxmanage starvm nombreMaquinaVirtual

# esto ejecuta con entorno gráfico, y el mensaje es el siguiente
this kernel requires the following features not present on the cpu
```

**Posible solución**
```$ VboxManage modifyvm nombreVM --pae on```

## 3.  No me deja conectar al VRDE Server via remota con rdesktop
El servidor aparece:
```
$ vboxheadless -s nombreMaquinaVirtual

# y al intentar conectarse via remota en otra terminal, aparece lo sig.:
webSocketsHandshake: invalid client header
```
En el cliente muestra:
```
$ rdesktop localhost
# 
Autoselected keyboard map en-gb
ERROR: Connection closed
```

**Posible solución:**
1. Descargar e instalar la extension pack de Virtualbox (que sea la misma versin que Virtualbox)
2. Ingresar lo siguiente en la terminal
```$ VBoxManage setproperty vrdeextpack "Oracle VM VirtualBox Extension Pack```

## 4. Recursos
- https://code-maven.com/virtualbox-host-only-network-ssh-to-remote-machine
- http://xmodulo.com/how-to-create-and-start-virtualbox-vm-without-gui.html
- https://help.github.com/en/articles/basic-writing-and-formatting-syntax
- https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet
