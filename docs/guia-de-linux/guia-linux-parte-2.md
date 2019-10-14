# Guia de Linux - Lineas de comando (Parte-2)

<img src="/images/linux-terminal.png">

# 1. Tareas && Procesos

> Los **procesos** son programas que se pueden estar ejecutando o no. Estos procesos se los llama **tarea** en caso de que se esten corriendo en el sistema.

> Las **tareas** se pueden iniciar tanto en **primer plano** (foreground) como en **segundo plano** (background). En el primer caso, se puede dar si se ejecuta la tarea desde la terminal, esta tomará el control de la consola y solo se podra hacer uso de la terminal cuando la tarea finalize o que nosotros la finalizemos. En el segundo caso, permiten utilizar la terminal mientras la tarea se está ejecutando.

## 1.1 Iniciar tareas

### 1.1.1 Iniciar una tarea en primer plano
>Esta tarea se va a seguir ejecutando hasta que se finalice desde la interfáz gráfica de ese programa, o si se finaliza desde la terminal, hasta tanto no se puede usar esa terminal para otros comandos.
```bash
firefox # inicia el navegador firefox en primer plano
```

### 1.1.2 Iniciar una tarea en segundo plano
>En segundo plano se pueden agregar aquellas que no necesitan interactuar con la consola, es como un "esconder" mientras se ejecutan.
```bash
firefox & # inicia el navegador firefox en segundo plano
tar -cvzf fotos.tar.gz fotos & # comprimir los archivos de la carpeta fotos
```
>Observación: Sólo se necesita de agregar el **&** seguido de nombre del programa

### 1.1.3 Evitar imprimir  mensajes de una tarea que está segundo plano
>Con el comando **nohup** podemos seguir utilizando la terminal, sin que aparezcan los mensajes que generan los programas que tenemos en segundo plano.
```bash
nohup mkdocs serve & # corre el programa "mkdocs" en segundo plano, y no mostrará los mensajes
```

## 1.1.4 Pasar una tarea a primer o segundo plano
>A veces puede ocurrir que se desee alternar
```bash
fg numeroTarea # pasa una tarea a primer plano
fg numeroTarea # pasa la tarea a segundo plano
```

## 1.2 Ver procesos y tareas
> Con el comando **jobs** podemos conocer las tareas que se ejecutan en segundo plano desde la terminal que tenemos abierta. Este nos detallará el **número de proceso**(important para luego detenerlo), su **estado de ejecución**.

> Con el comando **ps** nos mostrará todas las tareas (dispone de varios parametros que personalizan la información)

Algunas referencias a las columnas del listado de procesos:

|Columna|Descripción					|
|:------|:----------------------------------------------|
| pid	| Identificador del proceso			|
| tty	| Identifica la terminal donde esta corriendo 	|
| comm	| Es el comando que se ejecutó en la terminal	|
| etime | Cantidad de tiempo en ejecución    		|
| %mem	| Cuanto ocupa en memoria 			|
| %cpu 	| Cuanto utiliza del procesador 		|

Otras referencias de los parámetros para el comando **ps** que lista los procesos:

| Parámetro | Descripción                                                    |
|:---------:|:---------------------------------------------------------------|
| a         | Muestra los procesos que tienen una terminal controladora	     |
| x         | Muestra los procesos que "no" tienen una terminal controladora |
| f         | Muestra las relaciones padre/hijo entre los procesos 	     |


```bash
jobs # devuelve una lista con las tareas en ejecución en la terminal actual
ps   # devuelve todas las tareas 
```

### 1.2.1 Obtener solo el número de proceso
> Suelo optar por **pgrep** seguido del nombre del proceso, que es mas sencillo.
> Aunque también de una más extensa sería con **ps** para listar los procesos, con filtrar el proceso con **grep** y retornar la columna del PID con **awk**

```bash
pgrep | nombreTarea		# devuelve el numero de id del un proceso
ps | grep nombreTarea | awk '{print $1}' # también devuelve el numero de id del proceso
```

### 1.2.2 Obtener solo algunos datos de los procesos
>En caso de querer saber solo algunas de las columnas de **ps** podemos usar el parametro **eo** seguido de las columnas. 
Algunos campos podrian ser

```bash
ps -eo pid,comm,etime # mostrará la columna del identificador, el comando, y tiempo en ejecución
```
>**Observación:** Es importante que las columnas este separadas por coma sin espacios.

### 1.2.3 Ordenar los procesos por algun campo
> Para esto necesitamos del parametro **--sort** seguido de los campos que utilizamos como criterio para ordenar
```bash
ps -eo pid,comm,etime,%cpu --sort=-%mem | head 
```
> **Observación:** Si queres visualizar la cabecera de los campos, agregar **head**

### 1.2.4 Mostrar procesos padres e hijos
> A veces es importante conocer si un proceso depende de varios es decir al detener este sus procesos hijos también.
```bash
ps --forest # muestra los procesos padres e hijos
```

## 1.3 Detener una tarea en ejecución
> Si la tara está en **primer plano** podriamos usar el atajo **CTRL+Z**

> Si la tarea está en **segundo plano**, utilizaremos el comando **kill** seguido del numero de proceso o el PID que lo identifica.

```bash
kill %1 	# detiene el proceso numero 1
```

>**Observación:** Al utilizar el % va seguido del número de proceso, caso contrario agregar el PID del proceso

## 1.4 Guardar un proceso dependiente de una terminal
>Con el comando **disown** se puede guardar un proceso que está corriendo en **segundo plano** sobre una terminal, y si la misma se cierra el proceso no se interrumpirá.
>Como argumento se le puede pasar el **PID** ó el número de proceso precedido por el **%**

Opción 1, con el comando **pgrep**:
```bash
nohup mkdocs serve& # ejecuto el programa en segundo plano, y oculto sus mensajes
pgrep mkdocs 	    # busco el PID del proceso
disown 3003  	    # le paso PID para guardarlo
```
Opción 2, con el comando **ps**:
```bash
nohup mkdocs serve& # ejecuto el programa en segundo plano, y oculto sus mensajes
ps -ax | grep mkdocs # busco el PID
disown 3003   	     # le paso el PID (si es que fuese 3003)
```

## 1.5 Practicando procesos, tareas
```
firefox & ; chrome & # corro en segundo plano ambos navegadores web

jobs 	    	     # verifico el numero de proceso de ambos, y si estan corriendo
kill %1		     # detengo el que tenga el número de proceso 1

ps -a | grep chrome  # verifico el PID del programa, suponiendo que firefox se detuvo
kill 3021    	     # detengo el proceso con PID 3021 (suponiendo que es chrome)

```

- - -

## 2 Sincronizar directorios
> El comando **rsync** cumple un rol fundamental para copiar, mover archivos y carpetas, se dice que es aún más rápido que utilizar **cp** ó **scp** ya que comprime los archivos antes de transferirlos.

Algunos de los parámetros son:

| Parámetro | Descripción																											|
|:----------|:----------------------------------------------------------------|
|	a					|	Modo archivo																										|
| v					| Modo Verboso - Muestra el información durante la transferencia	|
| q					| Modo Silencioso - No muestra la información que se transfiere		|
| z					|	Comprimir datos al transferir																		|
| h					|	Humaniza los valores de transferencia														|


## 2.1 Copiar un directorio local a otro
```bash
$ rysnc -vazh directorio1/ directorio2/ # Copia todo lo del directorio1 al directorio2
```

### 2.2 Transferir todos los archivos de un directorio local a un servidor
```bash
$ rysnc -vazh carpeta/* host1:pruebas/ # transferir a un servidor
```

### 2.3 Transferir un directorio local a un servidor pasandole usuario
```bash
$ rysnc -vazh directorio2/ usuario:host2:fotos/ # transferir a un servidor pasando usuario
```

### 2.4 Transferir desde un servidor a la maquina local
```bash
$ rysnc -vazh admin:192.168.92.1:/srv/fotos /home/juan/carpeta # transferir desde el servidor a la maquina local
```

### 2.4 Transfencia segura con ssh desde el servidor a máquina local
>A diferencia del resto se agrega el parámetro **e** y **ssh**
```bash
$ rysnc -vazh -e ssh admin@192.168.92.1:/srv/fotos /home/juan/fotos
```

### 2.4 Simular transferencia de archivos
>Si queremos probar en caso de errores podemos utilizar **--dry-run**
```bash
$ rysnc -vazh --dry-run directorio1/ directorio2/ # Copia todo lo del directorio1 al directorio2
```

# Referencia
- Documentación sobre rsyncm, Linux.die [Ver Página](https://linux.die.net/man/1/rsync)
- Conociendo el comando rsync, LinuxTechi [Ver Página](https://www.linuxtechi.com/rsync-command-examples-linux/)
