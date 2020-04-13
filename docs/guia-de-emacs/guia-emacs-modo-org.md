## Para iniciar Emacs con un archivo .org"

1. Modificar el archivo de configuracion C-x C-f ~/.emacs.d/init.el
2. Ir al final del archivo **C-Fin** y agregar la siguiente linea
> ;; cambiar por la ruta que desees
> (find-file "~/Dropbox/orgfiles/agenda1.org")

- - -

## Crear una lista de tareas
> Escribimos el simbolo * asterisco seguido del texto

Ej.
```
* Lunes
* Martes
```

## Crear una sublista de tareas
> Escribimos el simbolo * asterisco dos veces, y se agrega como sublista de la lista que tenga antes.

Ej.
```
* Lunes
** Estudiar para mañana
** Terminar resumen de Fisica
* Martes
```

## Crear tareas con viñetas
> Escribimos un **guion** seguido del texto que queramos seguido de **M-RET**

- Para agregar nuevos elementos en el mismo nivel (tabulacion) presionar **M-RET**
- Para cambiar el tipo de viñeta presionar **Shift** y las flechas Up/Down

 Ej.
```
* Lunes
** Estudiar para mañana
   - Algebra
   - Fisica
** Terminar resumen
   - Quimica
   - Matematica
```

- - -

# Crear una lista de seguimiento con to-do
> Para saber cuales y cuantas tareas se resolvieron y cuantas no

Al comienzo de las listas agregar **[/]** o [%]

- Con [/] aparecera cuantas tareas se hicieron sobre el total
- Con [%] aparecera un % del total
- Para cambiar el estado como **Pendiente/Finalizada** presionar **Shift** y las flechas **Left/Right**

Ej.
```
* Lunes
** [/] Estudiar para mañana
   - Algebra
   - Fisica
** [%] Terminar resumen
   - Quimica
   - Matematica
```

- - -

### Crear una lista de seguimiento con checkboxes
> Para saber cuales y cuantas tareas se resolvieron y cuantas no

- Con [/] aparecera cuantas tareas se hicieron sobre el total
- Con [%] aparecera un % del total
- Las tareas tengan **checkbox** deben comenzar con [ ] 
- Para marcar las tareas como **Finalizadas** presionar **C-c C-c**

Ej.
```
* Lunes
** [/] Parciales rendidos
   1. [ ] Algebra
   2. [ ] Fisica
** [%] Tareas Pendientes
   - [ ] Limpiar cuarto
   - [ ] Llamar a mi jefe
```

- - -

# Atajos

| Comando                      | Descripción                                                             |
| :----------                  | :-----------                                                            |
| C-c C-s                      | Agendar una fecha para una tarea (schedule)                             |
| C-c C-d                      | Programar una fecha limite para finalizar una tarea (deadline)          |
| Shift flechas Left/Right     | Elegir el dia del mes en el calendario                                  |
| g                            | Actualiza los cambios del buffer de la agenda (igual que con **dired**) |
| M-x org-agenda-file-to-front | Guardar el archivo .org actual en la agenda                             |
| C-c C-q                      | Agregar tags                                                            |
| C-RET                        | Agregar nuevo item a la agenda                                          |
| M Flechas Up/Down            | Cambia el orden/prioridad de las tareas, moviendo hacia arriba/abajo    |
| M flechas Left/Right         | Mueve el nivel(tabulacion) de la tarea                                  |
| Tab                          | Expande/Oculta una lista que tiene elementos                            |
| Shift-Tab                    | Expande/Oculta todas las listas que tengan elementos                    |
| Shift flechas Up/Down        | Cambiar la prioridad de la tarea (Alta/Media/Baja)                      |
| Shift flechas Left/Right     | Cambiar el estado de la tarea (Pendiente/Finalizada/Revisar)            |
| C-c C-t                      | Cambiar el estado de la tarea                                           |
| M-x org-agenda m             |                                                                         |
| C-x C-l                      | Crear hipervinculos                                                     |
|                              |                                                                         |

- - -

# Referencias 

## Paginas de referencia

### Guias
- Guia basica - Emacslife - [Ver Pagina](http://emacslife.com/baby-steps-org.html)
- Guia basica - Orgmode - [Ver Pagina](https://orgmode.org/worg/org-tutorials/orgtutorial_dto-es.html)
- Guia completa - Norang - [Ver Pagina](http://doc.norang.ca/org-mode.html)

### Agregar etiquetas a las tareas
- Referencia #1 - [Ver Video](https://www.youtube.com/watch?v=FJq__bBi0nI)
- Referencia #2 - Orgmode.org - [Ver Pagina](https://orgmode.org/manual/Setting-Tags.html)

### Como organizarse con el modo Org

- Referencia #1 - [Ver Video](https://www.youtube.com/watch?v=C6nbjqn5Uxw)
- Referencia #2 - [Ver Video - Parte 1](https://www.youtube.com/watch?v=QQSaDDVP__s)
- Referencia #2 - [Ver Video - Parte 2](https://www.youtube.com/watch?v=sXTtDiLXr48)
- Referencia #4 - [Ver Video](https://www.youtube.com/watch?v=PVsSOmUB7ic)
- Referencia #5 - [Ver Video](https://www.youtube.com/watch?v=gDHE23vl9E0)
- Referencia #6 - [Ver Video](https://www.youtube.com/watch?v=LFO2UbzbZhA)
- Referencia #7 - [Ver Video](https://www.youtube.com/watch?v=dljNabciEGg)
- Referencia #8 - [Ver Video](https://www.youtube.com/watch?v=fgizHHd7nOo)

### Cambiar las prioridades de las tareas

- Referencia #1 - [Ver Video](https://www.youtube.com/watch?v=WSF4EgQqa3Q)
- Referencia #2 - [Ver Pagina](https://github.com/harrybournis/org-fancy-priorities)

### Modificar Agenda estados

- Referencia #1 - Practicalli - [Ver Pagina](https://practicalli.github.io/spacemacs/org-mode/todo-states-customise.html)
- Referencia #2 - Sainathadapa - [Ver Pagina](https://sainathadapa.github.io/emacs-spacemacs-config/org-config)
- Referencia #3 - Orgmode.org  - [Ver Pagina](https://orgmode.org/manual/TODO-Basics.html)
- Referencia #4 - Orgmode.org -  [Ver Pagina](https://orgmode.org/manual/Setting-Tags.html)

### Otros
- Comandos agenda-file - Orgmode.org [Ver Pagina](https://orgmode.org/manual/Agenda-Files.html)
- Manejar los Hipervinculos - Orgmode.org - [Ver Pagina](https://orgmode.org/manual/Handling-Links.html)

- Como usar snippets -[Ver Video](https://www.youtube.com/watch?v=UT1bcq_HIkE)
- Agendar Fechas -[Ver Video](https://www.youtube.com/watch?v=QQSaDDVP__s)
- Crear presentaciones - [Ver video](https://www.youtube.com/watch?v=bRoSpJ23Kzk)
- Hacer gantt - [Ver Video](https://www.youtube.com/watch?v=5ViUBaarsbw)

### Integrar archivos ORG con dropbox 
> La referencia #1 me funciono

- Referencia #1 - Webdav - [Ver Pagina](https://webdav.io/webdav/webdav-integrations/webdav-dropbox/)
- Referencia #2 - Opensource.com - [Ver Pagina](https://opensource.com/article/19/4/calendar-git)
