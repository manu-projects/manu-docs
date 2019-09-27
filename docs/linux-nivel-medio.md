#Variables de entorno
..
...

- - -
# 1. Enlaces
>Existen dos tipos de enlaces, blandos y duros, el que más nos interesa por ahora es el primero.

### 1.1. Enlaces blandos
>Es parecido al acceso directo en Windows, permite dirigirse al archivo o directorio desde otro archivo ubicado donde uno quiera.

```bash
ln -s original_file new_file
```

- - -
# 2. Directorios
### 2.1. Crear un arbol de directorios
>Con **mkdir -p** seguido de los directorios que se quieran crear, a diferencia de usar solo **mkdir** sin el parametro **p**, es que este crea multiples directorios padres.

```bash
mkdir -p git/proyectos/prueba1 # crea la carpeta git, dentro proyectos y dentro prueba1
```

### 2.2. Eliminar multiples directorios
>Se opera de igual forma que con crear, pero se utiliza **rm** en vez de **mkdir**
```bash
rm -p git/proyectos/sistemaDeControl # se borran todos los directorios
```
>**Observacion:** Se puede también utilizar el parametro **-r** en vez de **-p**

- - -

# 3. Compresión de Archivos
>La compresión de archivos permite reducir el espacio que ocupan en disco, por tanto permite adjuntar en un correo, subir a la nube con mayor velocidad.

## 3.1. Comprimir con gzip y bzip2
>Con **gzip** se puede comprimir un archivo que le agrega la extensión **.gz**, mientras que con **bzip2** comprime el archivo aún más y le agrega la extensión **.bz**. En ambos casos los comprime de manera individual es decir no los agrupa en un solo archivo, pero que si lo permite **tar**

#### 3.1.1. Comprimir un archivo con gzip
```bash
gzip finanzas.txt # finanzas.txt se comprime y convierte en finanzas.txt.gz
```

#### 3.1.2. Comprimir  un archivo con gzip con la mejor compresión posible
```bash
gzip -9 finanzas.txt # finanzas.txt se comprime y convierte en finanzas.txt.gz
```

### 3.1.3. Comprimir con gzip varios archivos en una linea
```bash
gzip *.txt # comprime todos los archivos de extension .txt
```

#### 3.1.3. Extraer con gzip el contenido de un archivo
```bash
gzip -d finanzas.txt.gz # descomprime el archivo y vuelve al formato original finanzas.txt
gunzip - finanzas.txt.gz # otra manera de descomprimir sin pasar parametros
```
>**Observación:** Solo se necesita agregar el parametro **-d** antes del nombre del archivo

### 3.2. Comprimir con tar
>Esta herramienta incluye **gzip** y **bzip2** para comprimir multiples archivos, con el formato **.tar.gz** o **.tar.bz**

La lista de los parametros que se le pueden pasar son:

| Parametro | Descripción                      | | | | |
|:----------|:---------------------------------|-|-|-|-|
| c         | Crea el archivo                  |<td colspan=4>
| x         | Extrae el contenido              |<td colspan=4>
| v         | Muestra el paso a paso           |<td colspan=4>
| z         | Comprime con gzip                |<td colspan=4>
| j         | Comprime con bzip2               |<td colspan=4>
| f         | Para indicar nombre del archivo  |<td colspan=4>

#### 3.2.1. Comprimir una carpeta
>El parametro **v** permite visualizar por pantalla el paso a paso de que comprime, extrae, etc..
```bash
tar -cvzf archivos.tar.gz finanzas # comprime y agrupa en archivos.tar.gz, lo que tenga la carpeta en un solo archivo
```
>**Observación:** Es importante respetar el orden de los parámetros, sino no funciona el comando.

#### 3.2.2. Comprimir multiples archivos 
```bash
tar -cvzf archivos.tar.gz *.txt # comprime y agrupa en archivos.tar.gz, los archivos de extension **.txt**
```

#### 3.2.3. Descomprimir un archivo .tar.gz
>La diferencia con comprimir es que se cambia el parametro **c** por **x**

```bash
tar -xczf achivos.tar.gz # extrae el contenido del archivo .tar.gz 
```
- - -

# 4. Permisos

## 4.1. chown
>Para cambiar la propiedad de un archivo a un usuario

## 4.2. chgrp
>Para cambiar la propiedad de un archivo a un grupo

## 4.3. chmod
>Para asignar permisos a directorios y/o archivos. Se pueden asignar de dos maneras:

1. Númerica
2. Simbólica

> En lo personal considero que la **simbólica** es la de mi preferencia, pero es necesario conocer ambas

### 4.3.1 Númerica

| Permiso | Descripción | | | | |
|:--------|:------------|-|-|-|-|
| 1       | Ejecución   |<td colspan=4>
| 2       | Escritura   |<td colspan=4>
| 4       | Lectura     |<td colspan=4>

El orden de los permisos es:

1. Propietario
2. Grupo
3. Invitado (cualquier usuario)

#### Permiso de sólo ejecución(1) para el Propietario
```bash
chmod 100 archivo.txt
```

#### Permiso de ejecución(1) y lectura(4) para el Propietario 
```bash
chmod 500 archivo.txt
```

#### Permiso de ejecución(1), lectura(4) y escritura(2) para el Propietario 
```bash
chmod 700 archivo.txt
```

#### Permiso de ejecución(1), lectura(4) para el Propietario, y el grupo 
```bash
chmod 550 archivo.txt
```

#### Permiso de ejecución(1), lectura(4) para el Propietario, el grupo, invitados
`chmod 555 archivo.txt` 

#### Permiso de ejecución(1), lectura(4), Escritura(2) para el Propietario y ejecución(1), lectura(4) el grupo, invitados
```bash
chmod 755 archivo.txt
```

### 4.3.2 Simbólica
> Para agregar, eliminar permisos se agrega primero a quien (usuario, grupo, cualquier usuario) seguido del operador **+**, **-**, **=** que agrega, elimina, reemplaza los permisos respectivamente.

| Permiso | Descripción | | | | |
|:-------:|:------------|-|-|-|-|
| x       | Ejecución   |<td colspan=4>
| w       | Escritura   |<td colspan=4>
| r       | Lectura     |<td colspan=4>


- **u**: se refiere al usuario
- **g**: al grupo al que pertenece
- **o**: es cualquier usuario

#### 4.3.2 Agregar permisos al usuario
Se utiliza el operador suma **+permiso**
```bash
chmod u+x archivo.txt # Permiso de Ejecucion
chmod u+xr archivo.txt # Permiso de Ejecución y lectura
chmod u+xwr archivo.txt # Permiso de Ejecución, lectura y escritura
```

#### 4.3.2 Agregar permisos al usuario, grupo e invitados
```bash
chmod ug+xr archivo.txt # Permiso de ejecución, lectura para el Usario/Grupo
chmod ugo+xwr archivo.txt # Permiso de ejecución, lectura para el Usuario/Grupo/Invitados
```

#### 4.3.2 Agregar diferentes permisos
>Los permisos se deben separar por comas
```bash
chmod u+xwr, go+xr archivo.txt # Permiso de ejecución, lectura, escritura al Usuario, y Permisos de ejecución, lectura al Grupo/Invitados
```

#### 4.3.2 Eliminar Permisos
>Se utiliza el operador menos **-permiso**, funciona igual que agregar pero con el signo **-**
```bash
chmod u-x archivo.txt # Eliminar Permiso de ejecucion para el Propietario
chmod u-xr archivo.txt # Eliminar Permiso de ejecución(x) y lectura(r) para el Propietario(u) 
```

#### 4.3.2 Sobreescribir Permisos
>Tambien se procede de igual forma que los dos anteriores pero se cambia el operador por el **=**
```bash
chmod u=xr archivo.txt # Asignar Permiso de ejecución(x) y lectura(r) para el Propietario(u) 
chmod ugo=xr archivo.txt # Asignar solo Permiso de ejecución(x) y lectura(r) para el Propietario(u), Grupo, e Invitado 
```
>**Observación:** Si ya disponia de permisos, serán eliminados y reemplazaran por estos nuevos

- - -

# 5.Tuberia (Pipe)

## 5.1 tipos
- 3 tipos
- entrada
`cat pepe.txt << ls -l $HOME`

#### 2.2 tuberias nombradas
> crea archivo de tuberias para que otros procesos reutilicen
> se pueden crear con el comando `mknod` 

- - -

# 6. Otros comandos interesantes

### 6.1. Ejecutar multiples comandos en una linea
>Para esto debemos utilizar el símbolo ** ; ** para separar los comandos a ejecutar
```bash
ls -l ; cat /etc/passwd
```

### 6.2. Ejecutar un programa luego de otro
>Para esto debemos utilizar el operador lógico ** && ** 
```bash
mkdir pepe && touch {archivo1.txt, archivo2.txt}
```

### 6.3. Saber la ruta de un programa
```bash
whereis ls
```

### 6.4. Pasar por parametro la salida de un comando
Una alternativa a esto sería el uso de los **acentos inversos** que nos permiten pasar la salida de un comando como parametro a otro comando
```bash
kill `cat carpeta/proceso.pid`
```

- - -

# man
#### 4.1 secciones del manual
> para saber la documentación de un comando
`man numeroSeccion comando`

1. herramientas del usuario
2.
3.
4
5.
6.
7.
8. herramientas del sistema

#### 4.2 parametro -f
> para obtener un resumen de las paginas
`man -f nombreComando`

#### 4.3 info
> es otra herramienta parecida a man pero más fácil de entender (aunque no tan completa como man), esta dispone de hipervinculos de referencia

para saber sobre el comando grep `info grep`

- - -