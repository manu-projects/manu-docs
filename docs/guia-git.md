# Guia de GIT

<img src=/images/programming-software.jpg>

# 1. Básico

Investigar mas de
revert, fetch, reset

## 1.1 Agregar todos los cambios nuevos
> Si hicimos cambios en varios archivos y directorios, y no queremos agregar cambio por cambio
> podemos pasarle por parámetro un punto, que indica el directorio que estas posicionado.
> La idea seria ubicarse en la raíz o directorio principal para lanzar el comando.
```
git add . 
```
## 1.1 Deshacer cambios
>Se puede revertir los cambios de un archivo, o de todos los archivos que se cambiaron
>de forma temporal o permanente.

## 1.2 Deshacer cambios locales
>Si modificaste un archivo, y por alguna razón no podemos usar el shortcut Ctrl+z
>para volver atras porque se nos cerró el editor, ó reinició el ordenador.
>Podemos volver los cambios del archivo antes de esa modificación
>haciendo uso del comando **checkout** seguido de dos guiones y del nombre de archivo.
```bash
git checkout -- archivo.html
```
>Observación: Un cambio es local, cuando modificas archivos con tu editor de texto, y guardas los cambios.

## 1.3 Deshacer cambios de un archivo del stage
>Si modificaste un archivo, lo guardaste y lo agregaste al repositorio local con **git add**
>aún se pueden deshacer los cambios. Necesitarás usar primero el **reset head** para decirle
>a git que no quieres el último cambio, y luego proceder como antes con **checkout** para deshacer
>el cambio guardado.
```
git reset HEAD archivo.html
```
>Observación: Un cambio está en stage, si utilizaste el comando **git add*

## 1.5 Deshacer cambios con "reset" sin borrar historial (stage)
>Una solución a "no borrar los commits del historial" que es posible que a veces
>lo hagamos de forma intencional por pequeños cambios es pasar el parámetro **soft**.

>Con este parámetro **soft** los cambios de los commits apareceran en el **stage**,
>caso contrario a que si usamos **hard**. Con este segundo se debe tener cuidado,
>porque apuntará al commit indicado y los anteriores a él se borrarán del stage,
no pudiendo ver diferencias o hacer checkout de ellos.
```
git reset --soft 6148578
```
>Observación: El hash de un commit se puede obtener utilizando **git log --oneline** aparece
>a la iquierda de mensaje

## 1.2 Revertir todos los cambios de forma temporal
>Con el comando **stash** en realidad movemos los cambios a otro lugar como si lo escondieramos.
>Si mientras realizabamos cambios(A), y de repente nos piden cambios(B), ocultamos los cambios(A)
>con **stash**. Hacemos los cambios(B)
```bash
git stash
```

```
git revert
```

## 1.2 Ver un resumen de los commits
```
git log --oneline
```
- - - 

# 1. Branches

## 1.1 Crear un branch
> Los branches nos permiten crear nuevas funcionalidades o modificaciones del proyecto
> sin modificar de forma directa en él. Por tanto podemos crear un branch para trabajar
> sobre esta nueva mejora lanzar commits y push al repositorio por más que aún esté en
> desarrollo lo que realizamos.
```bash
git branch nombre-del-Branch
```

## 1.2 Crear un branch y cambiar al nuevo branch
> Cuando creamos un branch, suele quedarse posicionado en el *master*, de esta manera
> podemos crear el branch y ya trabajar sobre el.
```bash
git checkout -b nombre-del-branch
```

## 1.3 Modificar el nombre de un branch
```bash
git branch -m nombre-del-branch nuevo-nombre-del-branch
```


## 1.4 Borrar
```bash
git branch -d nombre-del-branch
```

## 1.5 Listar branches creados
> 
```bash
git branch
```

## 1.6 Cambiarse a un branch
>
```bash
git checkout nombre-del-branch
```

# 2. Tags ó Etiquetas
> Sirven para tener un control de versiones del proyecto,
> Existen dos tipos "ligeros" y "anotados", los segundos son los más recomendados
> en caso de querer tener más información.

## 2.1 Crear tag
```
git tag -a v1.0.0 -m "Proyecto v1.0.0"
```

## 2.2 Listar tags
```
git tag
```

## 2.3 Eliminar tag
```
git tag -d v1.0.0
```

# 3. Stash
> Para esconder cambios utilizamos el comando **stash**

## 3.1 listar cambios ocultos
```
git stash list
```

## 3.2 aplicar el ultimo cambio
```
git stash apply
```

## 3.3 guardar un stash mas descriptivo
```
git stash save "Se ha realizado cambios en la letra fuente"
```

## 3.4 mostrar informacion de un stash
```
git stash show
```

## 3.5 remover de la pila del stash
```
git stash drop
```

# Recursos
- Como deshacer cambios [Ver Página](https://dev.to/neshaz/when-to-use-git-reset-git-revert--git-checkout-18je)
- Agregar color a la terminal de GIT
    - Opción 1 - [Ver página](https://nathanhoad.net/how-to-colours-in-git/)
    - Opción 2 - [Ver Página](https://www.leaseweb.com/labs/2013/08/git-tip-beautiful-colored-and-readable-output/)

# Videos útiles
- Comandos **fetch** **pull** y **rebase**
 [Ver Video](https://www.youtube.com/watch?v=r-PTFYVmGNo)

- Interpretacion grafica del comando **commit**
 [Ver Pagina](https://pvigier.github.io/2019/05/06/commit-graph-drawing-algorithms.html)

- Diferencias entre los comandos **rebase** y **merge**
 [Ver Pagina](https://medium.com/datadriveninvestor/git-rebase-vs-merge-cc5199edd77c)

- Interpretacion grafica del historial
[Ver Pagina](https://www.bitsnbites.eu/a-tidy-linear-git-history/)

- Tutorial de Git
 [Ver Pagina](https://www.slideshare.net/th507/git-an-intro-of-plumbing-and-porcelain-commands)

- Interpretacion grafica del historial y comandos
[Ver Pagina](https://jeffsaracco.com/Happy-git-Trees/)

