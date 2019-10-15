# Guia de Linux - Lineas de comando (Parte-1)

<img src="/images/linux-terminal.png">

# averiguar por: doas, cmus, qutebrowser, emerge

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
>Para asignar permisos a directorios y/o archivos, se puede realizar de dos maneras **Númerica** ó **Simbólica**.
>En lo personal prefiero la **simbólica**.

### 4.3.1. Númerica

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

# 4. Listar directorios

### 4.1. Listar las carpetas y archivos de un directorio
>Para esto utilizamos el comando **ls** que nos da información del directorio en el que nos encontremos, como también podemos pasarle una ruta del directorio que queremos saber.

Algunos parametros que le podemos pasar al comando **ls**:

- **a**: muestra todos los archivos, hasta los ocultos
- **l**: muestra los archivos y sus permisos

```bash
ls	# lista los archivos del directorio actual
ls -a 	# lista todos los archivos hasta los ocultos
ls -l 	# lista los archivos y sus permisos
ls -la 	# 
```

- - -

# 5.Tuberia (Pipe) && Redirección de datos
>Una tuberia se representa con el simbolo **|** y permite utilizar la salida de un programa como entrada de otro es decir pasarlo por parametro.

### 5.1 Filtrar el listado de directorio
> Con **ls** listamos el directorio c
```bash
ls -l | grep "control" # listamos todo el directorio o señalamos los que digan "control"
```

### 5.2 Redirigir la salida de un programa como entrada de otro
> Esto se podria usar para guardar información en caso de tener fallas al instalar o configurar un programa y se necesite consultar en algún foro que soliciten información de lo que devuelve ejecutar un comando
```bash
# guardamos en datos.txt lo que devuelve el comando ls (listado del directorio)
ls > /tmp/datos.txt
```
>**Observación**: Si volvemos a ejecutar el comando, sobreescribirá el archivo, borrando el contenido que ya tenía:

### 5.3 Redirigir como entrada la salida de otro programa
> 
```bash
grep 'pedro' < /archivos/clientes.txt # El contenido del .txt se lo pasa al grep
```

### 5.4 Insertar texto a un archivo 
>Si usamos lo aprendido, podemos insertar texto a un archivo
>Esta manera lleva más pasos, pero es una manera de entender algunos comandos
```bash
# 1. Creamos archivos temporales con texto
echo "Su nombre es Carlos" > /tmp/empleado-nombre.txt
echo "su país es Argentina" > /tmp/empleado-pais.txt

# 2. Creamos un segundo archivo y le agregamos el contenido del anterior
cat /tmp/empleado-nombre.txt >> empleado.txt
cat /tmp/empleado-pais.txt >> empleado.txt

# 3. Borramos los archivos temporales que ya no necesitamos
rm /tmp/empleado-*.txt # se borran los archivos .txt que empiecen con empleado seguido de un guión 
```

### 5.5 Insertar texto al principio de un archivo en una linea con "cat"
>Esta manera lleva menos pasos, pero es mejor entender primero el mecanismo del anterior

```bash
echo "Su nombre es Carlos" | cat - empleado.txt > tmp && mv tmp empleado.txt
```

Explicación paso a paso de la anterior linea de comando:

1. Con `echo` imprimimos por pantalla un texto, lo que esté entre comillas seguido de él

2. Con ` | ` ó conocido como **pipe** utiliza como entrada la salida de otro programa,
en este caso reutilizamos lo que imprimimos por pantalla, lo que queremos como texto
pasar a un archivo.

3. Con `cat` concatenamos texto de archivos, en este caso la salida del **echo**,
el primer parámetro es un guión **-** que quiere decir que le pasaremos un texto no un archivo,
el segundo parámetro **empleado.txt** es el nombre de archivo con el que concatena el texto

4. Con `>` utilizado para **redireccionar de la salida de un comando** pasará el texto
que concatenamos con **cat**, y lo guardará en el archivo temporal **tmp** que podría
haber tenido cualquier otro nombre que quisieramos

5. Con `&&` indicamos que cuando se cumpla el comando anterior (de concatenar el texto con
el archivo y guardarlo en otro temporal) entonces prosiga con el siguiente comando, pero
sólo si solo el comando anterior tuvo éxito en realizarse. En caso que lanze un error,
no ejecutará lo que le siga

6. Con `mv` sobreescribimos el archivo **empleado.txt** con lo que se guardó en **tmp**

### 5.6 Insertar texto al principio de un archivo con el comando sed
>Con el comando `sed` se puede mostrar, y modificar un archivo mediante **expresiones regulares**
>Aunque esta manera parezca incluso más fácil que las anteriores, pero siempre es bueno conocer
>otras alternativas y entender como funcionan los comandos básicos de linux.

```
sed -i "1iSu nombre es Carlos\n" empleado.txt # agregamos un texto al principio seguido de un salto de linea
```

Su explicación sería:
1. Con `-i` como parámetro nos referimos que vamos a insertar texto
2. Con `"1i"` al principio de la cadena de texto, hacemos referencia a la primera linea


- - -

# 6. Documentación de los programas
> Al usar el comando **man**, nos despliega información necesaria de como utilizar otros comandos y programas

### 6.1 Obtener documentación resumida de un programa
>Se le pasa el parametro **-f**
```bash
man -f grep # devuelve información acerca del comando grep
```

### 6.2 Obtener documentación más ordenada de un programa
> es otra herramienta parecida a man pero más fácil de entender (aunque no tan completa como man), esta dispone de hipervinculos de referencia
```bash
info grep # devuelve información acerca del comando grep
```

- - -

# 7. Otros comandos interesantes

### 7.1. Ejecutar multiples comandos en una linea
>Para esto debemos utilizar el símbolo ** ; ** para separar los comandos a ejecutar
```bash
ls -l ; cat /etc/passwd
```

### 7.2. Ejecutar un programa luego de otro
>A diferencia de utilizar **;**, con el operador lógico **&&** podemos pedirle que ejecute un programa luego que uno anterior se haya ejecutado. Podria verse como un si sucede esto,entonces hace este otro también.
```bash
mkdir programa1 && programa2
```

### 7.3. Saber la ruta de un programa
```bash
whereis ls
```

### 7.4. Pasar por parametro la salida de un comando
>Una alternativa a esto sería el uso de los **acentos inversos** que nos permiten pasar la salida de un comando como parametro a otro comando
```bash
kill `cat carpeta/proceso.pid`
```

### 7.5 Cambiar de usuario
>En caso que estemos usando varios usuarios, o accedamos a una terminal externa
```
su neverkas # cambia el usuario a Neverkas
```

### 7.6 Saber en que terminal nos encontramos
>En caso de que tengamos varias terminales abiertas ejecutando varios procesos en segundo plano, y queramos buscar los procesos de una terminal específica, pero no sabemos de cual. Nos posicionamos en esa terminal y ejecutamos el comando **tty**.

```bash
tty # nos devuelve información de la terminal actual
```

### 7.7 Saber la ruta en la que se encuentra la terminal
>Con **pwd** podemos saber en que ruta nos encontramos en caso de conectarnos en algun servidor
```bash
pwd # muestra la ruta en donde nos encontramos parados
```

### 7.8 Listar paquetes instalados ordenados por fecha
>Si necesitamos saber por esas casualidades los paquetes instalados via terminal,
y guardarlo en un archivo paquetes-instalados.txt buscamos en **dpkg.log**
```
grep -i "install" /var/log/dpkg.log > /tmp/paquetes-instalados.txt
```

### 7.9 Conocer el tipo de terminal en ejecución
>Existen diversos tipos de terminales, quizás necesitas realizar una configuración
>y desconoces cual es el tipo de terminal que estas utilizando.
>Algunos tipos de terminal son:
- GNOME
- KDE
- XFCE
- JWM

```bash
# Para saber la distribución de linux y el tipo de terminal
env | grep XDG_CURRENT_DESKTOP

# Si es GNOME, algunas opciones para conocer la versión
gnome-shell --version # opcion 1

apt-cache show gnome-shell | grep Version # opcion 2 con apt-cache
```

### 7.10 Personalizar el prompt de la terminal
>Con **prompt** nos referimos al texto que aparece antes de las lineas de comando
>que ejecutamos en la terminal. Este suele indicar el nombre de usuario, el grupo
>al que pertenece y la ruta de directorios a la que vamos accediendo en el sistema.

#### 7.10.1 Modificamos la configuracion de la terminal
>Para modificar necesitamos modificar el archivo `.bashrc` (con cuidado) y buscamos
>en donde diga lo siguiente

```bash
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
```

>Y lo modificamos para que se parezca a lo siguiente
```bash
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
```

>Lo que hicimos fue modificar la segunda linea, acortando la informacion que aparece en la terminal,
>ahora solo veremos el nombre del usuario seguido de la ruta.

#### 7.10.2 Otras variantes
>En caso que queramos entender un poco mas como funciona, y personalizarlo aun mas, esta te compartimos
una lista de los parametros y que informacion imprime cada uno.

| Caracter | Descripción																			| | | | |
|:--------:|:-------------------------------------------------|-|-|-|-|
| \u       | Nombre del usuario de la sesion									|<td colspan=4>
| \h       | Nombre del host																	|<td colspan=4>
| \d       | Fecha en formato mm/dd/YYYY											|<td colspan=4>
| \A       | Hora del sistema																	|<td colspan=4>
| \j       | Cantidad de tareas en ejecucion por esa terminal	|<td colspan=4>


```
# Algunas variantes podrian ser:

PS1="[codeando] \u@\h:\w\$ "
# [codeando] user@group ~/Documents: $

PS1=”\A \u: \w\$ “
# 10:22 user: ~/Documents $
```

- - -

# 8. Referencias
>Para armar esta guia me base en algunos libros y sitios web que consideré útiles

- Libro - Manual de Administracion de Linux, Steve Shah
- Curso GNU/Linux - Tareas y Procesos [Ver Página](http://www2.lugro.org.ar/biblioteca/cursos/curso_intro/x1845.html)
- Resumen de programas en la terminal [Ver Página](https://www.tldp.org/LDP/GNU-Linux-Tools-Summary/html/index.html)
- Resumen de la Jerarquía del Sistema de Archivos [Ver Página](https://www.tldp.org/LDP/Linux-Filesystem-Hierarchy/html/index.html)
- Como utilizar la redirección [Ver Página](https://www.tldp.org/LDP/abs/html/abs-guide.html#IO-REDIRECTION)
- Proyecto de Informacion sobre Linux [Ver Página](http://www.linfo.org/index.html)

- Ejemplos del comando ps [Ver Página](https://www.tecmint.com/ps-command-examples-for-linux-process-monitoring/)
- Entendiendo como usar el comando sed
    - Ejemplos del comando sed, LikeGeeks [Ver Página](https://likegeeks.com/sed-linux/)
    - Ejemplos del comando sed, LinuxAdictos [Ver Página](https://www.linuxadictos.com/sed-ejemplos-del-comando-magico-para-gnu-linux.html)
		- Ejemplos del comando sed, TecMint [Ver Página](https://www.tecmint.com/linux-sed-command-tips-tricks/)
		
- Entendiendo como usar el comando cat
    - Explicación #1 del comando cat por RedHat [Ver Página](https://access.redhat.com/documentation/en-US/RedHat_Enterprise_Linux/4/html/Step_by_Step_Guide/s1-navigating-sio.html)		
    - Explicación #2 del comando cat [Ver Página](https://www.computerhope.com/unix/ucat.htm)
    - Explicación #3 del comando cat [Ver Página](https://hipertextual.com/archivo/2014/07/redirecciones-y-tuberias-bash/)

- Guia de comandos bash [Ver Página](https://likegeeks.com/linux-bash-scripting-awesome-guide-part5/#Linux-Signals)
- Personalizar prompt de la terminal
    - Referencia #1, Vitux [Ver Pagina](https://vitux.com/how-to-customize-ubuntu-bash-prompt/)
		- Referencia #2, Ubunlog [Ver Pagina](https://ubunlog.com/prompt-ejemplos-personalizar-terminal/)