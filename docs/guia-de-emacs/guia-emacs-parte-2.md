video pendiente:
https://www.youtube.com/watch?v=S4f-GUxu3CY

## Tips - Importantes
> Para que se guarden los cambios de la agenda, y se puedan filtrar usar **M-x org-agenda-file-to-front**
> Para abrir la agenda **C-c a**

### Reiniciar Spacemacs
>Con **Spc q r**

### Cargar configuraciones sin cerrar el programa
>En spacemacs **M-m f e R**
>En emacs **M-x eval-buffer **

### Para iniciar Emacs con un archivo .org"
1. Modificar el archivo de configuracion C-x C-f ~/.emacs.d/init.el
2. Ir al final del archivo **C-Fin** y agregar la siguiente linea
> ;; cambiar por la ruta que desees
> (find-file "~/Dropbox/orgfiles/agenda1.org")

### Gestionar archivos, proyectos
>Con treemacs
- **C-c C-p a** Agregar proyecto
- **C-c C-p d** Remover proyecto

>Con projectfile
- **SPC f r** abrir alguno de los archivos recientes
- **SPC p p** (project project) Cambiar proyecto actual
- **SPC p f** (project file) abrir un archivo de proyecto actual
- **M-x  projectile-remove-known-project** eliminar alguno de los proyectos agregados

Videos relacionados:
 [Ver Video 1](https://www.youtube.com/watch?v=Bu7nF9hPSts)
 [Ver Video 2](https://www.youtube.com/watch?v=Rx3wRl5d-J0)
https://www.youtube.com/watch?v=OrTJ17ivOL0

### Integrar Github con Magit

**Traer cambios de un branch al master**
>Si hicimos cambios y los guardamos en branches (aparte del master) y queremos traerlos al branch master (el que se suele trabajar)
1. Abrimos el menu Magit con **SPC g s**
2. Vamos al branch master con **b b** y elegimos master
**Nota:** no se que diferencia hay entre master y origin/master
3. Hacemos merge con el el branch con **m m** y elegimos el branch que queremos traer los cambios al master.
4. Hacemos push con **p p**


** Guardar cambios de forma temporal **
>Si hicimos un cambio local en un archivo (se guarda en unstage) y queremos guardar los cambios en otra parte de forma temporal (el lugar es en Stash) antes de hacer un **pull** 
1. Seleccionamos el codigo del archivo en **unstage** y presionamos **zz** elegimos el nombre
2. Y Cuando queramos que vuelva a aparecer esos cambios (que se guardaron en Stash)
Vamos a la parte de archivo **stashes** y presionamos **a* , se agregaran al archivo y este aparecera en **unstaged changes**

** Ver de un archivo los commits anteriores**
>Para esto utilizamos Blame presionando **SPC g b** y muestra un log con los commits
> Si presionamos **b** va a los commits anteriores y con **q** los mas recientes
Referencias:
[Ver Pagina] (https://magit.vc/manual/magit/Blaming.html)

**Atajos**
- **SPC-g s** muestra el estado de git
Estando dentro del buffer del estado de git, tenemos los siguientes comandos
 - **Tab** Expande/Oculta contenido
 -  **s** lo guarda los cambios del entorno local (stage), los que se van a pasar al commit (repositorio)
  Nota: se puede seleccionar con **Shift** que parte de los cambios se desean  mover al stage
 - **u** descarta los cambios del entorno local (unstage)
  Nota: se puede seleccionar con **Shift** que parte de los cambios se desean  mover al unstage
 - **x** descarta los cambios del entorno local
  Nota: se puede seleccionar con **Shift** que parte de los cambios se desean  descartar
 - **c c** para comitear (guarda los cambios en el repositorio) ???
 -  **, ,** o para finalizar commit (es una coma seguido de otra coma)
 - **b c** crear un nuevo branch y hacer checkout de ese branch para el commit (hay otro que es spin-off pero.. ni idea??)
- **b b** cambiar el branch (Ej. ir master a develop o testing)
- **t t** crear y agregar un tag
- **p p** pushear (hay otro que es p u de upstream, pero ni idea???)
- **p e** pushear en otro repositorio
- **F p** pushear (hay otro que es F u de upstream, pero ni idea???)

**Ejemplo 1**
>1. Guardo los cambios de forma local (modifico un archivo y lo guardo con **SPC f s** o **M-x s**)
2. Guardo los cambios en stage (Suponiendo que no estoy en el menu de magit hago **SPC g s** selecciono los cambios que quiero guardar en el Stage con **v** o **Shift-arrowUp / Shift-arrowDown** y presiono *s*
3. Hago commit (es decir aplico los cambios, suponiendo que ya estoy en el menu de magit presiono *c c*
4. Creo un branch del commit (suponiendo que estoy en el menu de Magit presiono *b c* elijo el branch master y presiono RET, luego escribo el nombre del nuevo branch
5. Hago push (suponiendo que estoy en el menu de Magit persiono **p p**
6. Hago un Pull del nuevo branch en Master (suponiendo que estoy en el modo Magit presiono **b b** y elijo el branch Master, luego presiono **F p**

**Ejemplo 2: Conflicto entre archivos, hacer Merge**
>Si en el paso 5 del ejemplo 1 hubiesemos tenido un conflicto, porque alguien toco el mismo archivo en las mismas lineas
1. Hacemos un Pull 
Para tener el archivo con el que tengo conflicto, ver las diferencias con el archivo local y resolverlo.
2. Mostramos las diferencias
Presionamos **SPC g s** y luego **e** , apareceran tres buffers identificados debajo a la izquierda con las letras A, B, C.
A y B son los archivos en conflicto, y C el archivo que tendra los conflictos corregidos
3. Vemos lo conflictos con **n** y **p**
Si presionamos **p** o **n** se resaltara los cambios, p de **previous diff** n de **next diff** 
4. Elegimos el archivo que usaremos
Presionamos la letra que identifica el buffer de las diferencias (en minusucula), elegimos copiar en el C
5. Guardamos los cambios y salimos
Presionando **q** seguido de **y** para confirmar los cambios
6. Verificamos que se hizo el Merge
Presionamos **SPC g s** y debe decir "Mergin origin/nombre del branch"
7. Hacemos commit del merge y push
Comiteamos con **c c** y **, ,** y por ultimo pusheamos con **P p**


**Referencias**
 [Ver Pagina](https://www.saltycrane.com/blog/2018/11/magit-spacemacs-evil-magit-notes/)

Videos relacionados:
 [Ver Video 1](https://www.youtube.com/watch?v=7ywEgcbaiys)
 [Ver VIdeo 2](https://www.youtube.com/watch?v=qXgGtyjXPiw)
 [Ver video 3](https://www.youtube.com/watch?v=fFuf3hExF5w)
 [Ver Video 4](https://www.youtube.com/watch?v=NDP91RNgT4A)

- - -

## Referencias
-pendientes o para volver a ver
https://www.youtube.com/watch?v=8k7BTIqufqQ
https://orgmode.org/guide/Hyperlinks.html
https://www.youtube.com/watch?v=I2C6QTtxfe8
https://www.youtube.com/watch?v=39u8K12rXHE
https://orgmode.org/manual/Initial-visibility.html

- Capas (Layers)
 [Ver Pagina](https://www.spacemacs.org/layers/LAYERS.html)

- Themes
 [Ver Pagina](https://themegallery.robdor.com/)

- Fuentes para programar
> Mas elegantes
[Ver Pagina 1](https://sourcefoundry.org/hack/playground.html)
[Ver Pagina 2](https://opensource.com/article/17/11/how-select-open-source-programming-font)

- Conceptos basicos de Spacemacs
 [Ver Pagina 1](https://charlascylon.com/2017-09-20-spacemacs-mi-configuracion-personal)
[Ver Pagina 2](https://medium.com/@kokegudiel2/configuari%C3%B3n-de-spacemacs-para-principiantes-ed43ddf3030f)

- Guia Basica
 [Ver Pagina - Español](https://orgmode.org/worg/org-tutorials/orgtutorial_dto-es.html)
 [Ver Pagina - Ingles](http://emacslife.com/baby-steps-org.html)
- Guia completa - Norang
 [Ver Pagina](http://doc.norang.ca/org-mode.html)
- Configuraciones de Spacemacs
 [Ver Pagina](https://out-of-cheese-error.netlify.com/spacemacs-config)
 - Comandos agenda-file
 [Ver Pagina](https://orgmode.org/manual/Agenda-Files.html)

- Guia de Configuraciones
 [Ver Pagina](https://practicalli.github.io/spacemacs/install-spacemacs/additional-configuration.html)

- Guia Avanzada
 [Ver Pagina 1](https://wiki.archlinux.org/index.php/Spacemacs)
 [Ver Pagina 2](https://github.com/syl20bnr/spacemacs/blob/master/doc/DOCUMENTATION.org#hybrid)

- Modificar Agenda estados
>La config de la pagina 1 funciona bien, la segunda parece que no
[ver pagina 1](https://practicalli.github.io/spacemacs/org-mode/todo-states-customise.html)
[ver pagina 2](https://sainathadapa.github.io/emacs-spacemacs-config/org-config)
https://orgmode.org/manual/TODO-Basics.html
https://orgmode.org/manual/Setting-Tags.html

- Usar Neotree
[Ver Video 1](https://www.youtube.com/watch?v=Z88ZmeMo1X0)
[Ver Video 2](https://www.youtube.com/watch?v=kPVVuJWS2vo)
https://develop.spacemacs.org/layers/+filetree/neotree/README.html
https://develop.spacemacs.org/layers/+filetree/treemacs/README.html
https://github.com/Alexander-Miller/treemacs


- Manejar los Hipervinculos 
[Ver Pagina](https://orgmode.org/manual/Handling-Links.html)
- Integrar archivos ORG con dropbox 
> Hice lo de la pagina 1, y funciona.
[Ver Pagina 1](https://webdav.io/webdav/webdav-integrations/webdav-dropbox/)
[Ver Pagina 2](https://opensource.com/article/19/4/calendar-git)

## Atajos en hybrid-mode

**con evil-mode (vim):**
- **SPC f t** abrir neotree (file tree)
- **SPC f f** buscar archivo (find file)
- **SPC f s** guardar archivo
- **v** seleccionar texto (se cancela volviedno a presionar)

**con holy-mode (emacs):**
- **C-1** cierra todos los buffer excepto el actual
- **C-0** cierra el buffer actual
- **C-2** abre un buffer horizontal al actual
- **C-3** abre un buffer vertical al actual
- **C-x k** matar un buffer
- **C-Shift-Del** borra una linea entera
- **M-%** reemplazar palabras
- **M-m f-t** o **SPC f t** gestor de directorios con NeoTree (similar al dired, pero ocupa menos espacio)

- **C-k** Borrar una linea
- **C-e** ir al final de la linea
- **C-Inicio** ir al principio del archivo
- **C-Fin** ir al final del archivo
- **C-x C-+** aumentar el tamaño del texto
- **C-x C--** disminuir el tamaño del texto
- **C-x C-l** creare hipervinculo

### Modo Org
**Crear una listas/sublistas/viñetas to-do**

**Crear una lista**
>Escribis el simbolo * asterisco una vez

**Crear una sublista**
>escribis el simbolo * asterisco dos veces, agrega la linea como sublista de la lista anterior

**Crear viñetas**
>escribir un guion seguido de un espacio seguido del texto que quieras (o puede ser un numero seguido de un punto), seguido de **M-RET** y se agregaran viñetas
>Para cambiar el tipo de viñeta presionar **Shift-arrowLeft** o **Shift-arrowRight**

- - -

### Crear una lista de seguimiento con to-do

>Para saber cuantas tareas se resolvieron y cuantas no

1. Crear una lista con **C-RET** que empiece o finalize con [/]  seguido del titulo
> Ej. [/] Lista de tareas pendientes
> Otra manera seria
> Ej. Lista de tareas pendientes [/]
**Obs.: Se puede cambiar [/] por [%] si se quiere en porcentaje**

2. Crear una sub lista con **C-RET**  seguido del titulo
> Ej. [/] Sub Lista de tareas

3. Marcar las tareas finalizadas con **Shift-arrowLeft**

- - -

### Crear una lista de seguimiento con checkboxes
>Para saber cuantas tareas se resolvieron y cuantas no

1. Crear una lista con **C-RET** que empiece o finalize con [/]  seguido del titulo
> Ej. [/] Lista de tareas pendientes
> Otra manera seria
> Ej. Lista de tareas pendientes [/]
**Obs.: Se puede cambiar [/] por [%] si se quiere en porcentaje**

2. Crear una lista de viñetas solo presionando enter, y que empieze con [ ]  seguido del titulo, para agregar mas presionar **M-RET**
>Ej.
> 1. [ ] limpiar
> 2. [ ] estudiar

3. Para marcar las tareas como finalizadas presionar **C-c C-c**

- - -

**Agenda**
 -**C-c C-s** para agendar una fecha en una tarea/grupo de tareas
-**C-c C-d** para agendar fecha..??? deadline
 -**Shift-arrowLeft** / **Shift-arrowRight** /  elegir el dia del calendario (tambien se puede con el mouse)

**Atajos**
 - **g** actualiza los cambios del buffer de la agenda (igual que con dired)
 - **M-x org-agenda-file-to-front** guardar el archivo .org en la agenda
 - **C-c C-q** agrega tags
- **M-x org-agenda m**  seguido del tag (no me funciono)
 - **C-RET** agrega nuevo item a la lista
 - **M-upArrow** mueve una linea hacia arriba
 - **M-downArrow** mueve una linea hacia bajo
 - **M-leftArrow** Mueve una linea un nivel superior
 - **M-rightArrow** Mueve la liea un nivel inferior 
 - **Tab** Expande/Oculta una lista
 - **Shift-Tab** Expande/Oculta todas las listas
 - **Shift-upArrow** cambiar la prioridad de la tarea a High/Mid/.. (lo mismo sucede si usamos **Shift-downArrow**)
 - **Shift-leftArrow** cambiar estado a Done/Todo/Nothing (lo mismo sucede si usamos **Shift-rightArrow**)
 - **C-c C-t** cambiar estado a Done/Todo/Nothing
- **C-k** borra una linea

## Videos

### Canales Favoritos
- Conceptos, Atajos, Herramientas, etc
  [Ir a canal](https://www.youtube.com/watch?v=MRYzPWnk2mE&list=PLxj9UAX4Em-IiOfvF2Qs742LxEK4owSkr)
[Ir a Canal 2](https://www.youtube.com/watch?v=d6iY_1aMzeg&list=PLX2044Ew-UVVv31a0-Qn3dA6Sd_-NyA1n)
[Ir a Canal 3](https://www.youtube.com/watch?v=BRqjaN4-gGQ&list=PLhXZp00uXBk4np17N39WvB80zgxlZfVwj&index=10)

### Configuraciones
- Nivel principiante
 [Ver Video 1 - Español](https://www.youtube.com/watch?v=8k7BTIqufqQ)
 [Ver Video 2 - Español](https://www.youtube.com/watch?v=Ie4z9-z948c)
 [Ver video 3 - Ingles](https://www.youtube.com/watch?v=PKaJoqQQoIA)

-Entendiendo buffers, ibuffer y Emmet
 [Ver Video](https://www.youtube.com/watch?v=yUfA-7wWNKA)

- MOdificando la terminal
[Ver Video](https://www.youtube.com/watch?v=L9vA7FHoQnk)

- Usando magit
 [Ver video](https://www.youtube.com/watch?v=1IYsiHXR620)

### Usando el modo Org 
- Como usar snippets
 [Ver Video](https://www.youtube.com/watch?v=UT1bcq_HIkE)

- Agendar Fechas
 [Ver Video](https://www.youtube.com/watch?v=QQSaDDVP__s)

-Cambiar las prioridades de las tareas
[Ver Video](https://www.youtube.com/watch?v=WSF4EgQqa3Q)
[Ver Pagina](https://github.com/harrybournis/org-fancy-priorities)

**- Agregar etiquetas a las tareas**
> No pude filtrarlos
[Ver Video](https://www.youtube.com/watch?v=FJq__bBi0nI)
[Ver Pagina](https://orgmode.org/manual/Setting-Tags.html)

- COmo organizarse con el modo Org
 [Ver video](https://www.youtube.com/watch?v=C6nbjqn5Uxw)
 [Ver video 1 -Parte 1](https://www.youtube.com/watch?v=QQSaDDVP__s)
 [Ver video 1 -Parte 2](https://www.youtube.com/watch?v=sXTtDiLXr48)
 [Ver video 1](https://www.youtube.com/watch?v=PVsSOmUB7ic)
 [Ver video 2](https://www.youtube.com/watch?v=gDHE23vl9E0)
 [Ver Video 3](https://www.youtube.com/watch?v=LFO2UbzbZhA)
 [Ver video 4](https://www.youtube.com/watch?v=dljNabciEGg)
 [Ver video 5](https://www.youtube.com/watch?v=fgizHHd7nOo)

- Crear presentaciones 
 [Ver video 1](https://www.youtube.com/watch?v=bRoSpJ23Kzk)

- Hacer gantt
 [Ver Video](https://www.youtube.com/watch?v=5ViUBaarsbw)
