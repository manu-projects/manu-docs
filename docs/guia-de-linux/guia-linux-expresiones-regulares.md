# Expresiones Regulares

Cuando hacemos referencia a listar achivos, pueden ser tanto directorios como
archivos de configuración, ejecutables, etc..

Antes de comenzar comparto una tabla que sino la entienden, más tarde lo harán
con los ejemplos que le sigan. No explico todos los ejemplos por el momento,
quizás luego lo siga. Esto es solo una breve introducción al tema.

| Operador Metacaracter | Descripción                                                                               |
| :-------------------- | :---------------------------------------------------------------------------------------- |
| ^                     | Indica con que comienza de la linea                                                       |
| $                     | Indica con que debe terminar la linea                                                     |
| .                     | Representa cualquier caracter (comodín)                                                   |
| [ ]                   | Los caracteres que estén entre los corchetes, será solo alguno de ellos                   |
| *                     | Lo que esté antes del asterisco se repite cero o más veces (clausura de kleene)           |
| +                     | Lo que esté antes del operador suma, se repite 1 o más veces (clausura positiva)          |
| ?                     | Lo que esté antes del signo de interrogación, aparece ninguna o una vez                   |
| \                     | Escapa el caracter especial que le siga (punto,coma, guión, etc..)                        |
| [^]                   | Al estar entre corchetes, se interpreta como cualquier cosa menos lo que este entre ellos |
| {m,n}                 | Lo que esté antes tendrá una longitud de m a n (Ej. )                                     |

Si investigan más acerca del tema, verán que hablan de **ocurrencias** o **coincidencias** que en 
inglés significa **match**. La idea es que las expresiones regulares son un conjunto de caracteres
que representan con patrón esto sería que tienen algo en común. (Ej. los archivos de texto empiezan con 
un nombre seguido de un punto y finalizan con otro nombre que representa la extensión, el patrón 
que coinciden con estos es nombre.extension)

> **Observación:** Algunos operadores ó metacaracteres como el `?`, `+` ó `{m,n}` cumplen la función que aparece
> en la tabla sólo cuando escribimos **expresiones regulares extendidas**, para eso solo debemos agregar el 
> parámetro `-E`. Pero si no lo llegamos a necesitar no es necesario. 

> **Sugerencia:** Cuando escriban las **expresiones regulares** se recomienda el uso de las comillas, para
> evitar la **expansión de shell**, para averiguar más de esto último al final de la página aparecen varias referencias
> que lo explican en detalle.

## 1. Listar archivos que empiecen con un caracter

Utilizamos el operador `^` que significa "todo lo que empiece con",
seguido entre `[ ]` los caracteres de los archivos que buscamos,
finalizando con `.*` que quiere decir "seguido de cualquier caracter"

> **Observación:** Si ponemos `^[doc]` no va a buscar esa palabra, sinó
> las palabras que comienzan con alguno de esos caracteres **o**, con **d** ó con **c**

Ej. Filtramos los archivos que empiezan con letra **e**

```
ls | grep "^[e].*"
```

1. `^` todo lo que empiece con
2. `[ex]` el caracter **e** ó **x**
3. `.*` seguido cualquier caracter o palabras de cualquier longitud

El resultado sería

```
exercise1-10.c
exercise1-10.c~
exercise1-11.c
exercise1-11.c~
```
- - -

## 2. Listar archivos que no comiencen con un caracter

Seria lo mismo que el anterior, con la diferencia que al principio de
los caracteres que están entre los corchetes `[ ]` se debe agregar el `^` 
que en este caso significa "que no comience con eso" se podria decir
que es un **not**


Ej. Filtramos los archivos que **NO** inician con alguna de las letras **e** ó **x**

```
ls | grep "^[^e].*"
```

1. `^` todo lo que empiece con
2. `[^ex]` cualquier palabra que no sea el caracter **e** ó **x**
3. `.*` seguido cualquier caracter o palabras de cualquier longitud

El resultado sería el siguiente

```
a.out
#testing.c#
testing.c
testing.c~
```

## 3. Listar archivos que empiecen y finalicen con un caracter

Es similar al primer ejemplo, salvo que le agregamos el `$` al final, que indica
que los nombres de los archivos deben "si o si" terminar con ese ultima palabra.
En este caso pusimos `\.c` que hace referencia a los programas del lenguaje C 
que tienen eso como extensión.

> **Observación:** El signo `\` sirve para escapar de caracteres especiales, 
> que pueden ser simbolos como los siguientes , . ? ¡ + ¿ 

Ej. Listar los archivos que empiezan con "e" y terminan con ".c"

```
ls | grep "^e.*\.c$"
```

El resultado seria el siguiente

```
exercise1-10.c
exercise1-11.c
exercise1-12.c
exercise1-3.c
```

- - -

## 4. Agrupando los conceptos anteriores

Supongamos el caso que tengamos en un directorio multiples archivos con distintas extensiones,
como pueden ser .jpg .xls .txt .hs .c pero solo queremos listar aquellos que empiezan con
la letra **e** por "exercise" ó "ejercicio" ó "examen" seguido de o no de un guión, un rango de numeros
del 1 al 9 y terminen en **.c**  (.c es la extensión de los programas del lenguaje C)

Detallo como sería el paso a paso, colocando a la izquierda como iria avanzando la expresión regular,
a la derecha una breve explicación, y al final toda la expresión regular completa.

1. `^e` Como empiezan con **e** sabemos que utilizaremos
2. `.*` Seguimos completando con letras hasta que llegue al rango de numeros del 1 al 19
por tanto usaremos `.*` para que complete con palabras de cualquier longitud. El `.` (el punto) 
sirve de comodín y representa cualquier caracter, y el `*` asterisco quiere decir que el caracter 
que lo preceda se repite cero o más veces (clausura de kleene).
3. `\-?`  con `\-` que le seguirá un guión, porque recordemos que la barra invertida `\` es para **escapar** de símbolos,
y al tener el signo de interrogación `?` afirmamos que el guión puede estar **cero o una vez**
(no confundir con el `*` que es cero más veces).
4. `[0-9]` representa a un rango de números de **un dígito** del 0 al 9
5. `\.c$`  el `\` ya explicamos que es para escapar los símbolos especiales, 
en este caso el `.`, y con `c$` decimos que debe **si o si** terminar con una letra **c**

La expresión regular deberia ser la siguiente

```
ls | grep -E "^e.*\-?[0-9]\.c$"
```

el resultado de escribir esto en la terminal sería

```
exercise1.c
exercise2.c
exercise-1.c
exercise-3.c
```


> **Observación:** Notarás que a diferencia de los anteriores ejemplos, este tiene un parámetro **-E**
> esto quiere decir que es una **expresión regular extendida** donde agregaron el uso del operador `?`
> que en las **expresiones regulares simples** que estabamos usando antes no tenían.
> Podes tratar de hacer el intento sin este parámetro y verás que el resultado es distinto.

## 5. Referencias

> Las referencias estan ordenadas por cuales son más relevantes

- [Dropbox de Zuñiga](https://www.dropbox.com/sh/il9i6kwuj1mn8xv/AAAAMG7POI1-rpasCaxGXPjra?dl=0)
- [Expansiones de la Shell - Curso Sysadmin](http://persoal.citius.usc.es/tf.pena/ASR/Tema_2html/node15.html)
- [Tilde Expansion, Brace Expansion, Arithmetic Expansion - Linuxcommand](http://linuxcommand.sourceforge.net/lc3_lts0080.php)
- [Expansion de comodines - IT Swarm.dev](http://linuxcommand.sourceforge.net/lc3_lts0080.php)
- [Cuando envolver las comillas alrededor de una variable de Shell - IT Swarm.dev](https://www.it-swarm.dev/es/linux/cuando-envolver-las-comillas-alrededor-de-una-variable-de-shell/1065766250/)
- [Busqueda de archivos de texto por Regexp - IBM](https://developer.ibm.com/es/tutorials/l-lpic1-v3-103-7/#)
- [Unix: Expresiones Regulares - Rm-rf.es](https://rm-rf.es/unix-expresiones-regulares/)
- [Expresiones Regulares - Curso Unix](https://bioinf.comav.upv.es/courses/unix/expresiones_regulares.html)
- [Expresiones Regulares - Curso Sysadmin](http://persoal.citius.usc.es/tf.pena/ASR/Tema_2html/node22.html)
- [Concepto generales POSIX, BRE ERE](https://blog.desdelinux.net/con-el-terminal-uso-de-expresiones-regulares/)
- [Expresion REgular Extendida, Boost](https://www.boost.org/doc/libs/1_38_0/libs/regex/doc/html/boost_regex/syntax/basic_extended.html)
- [Expresion Regular Basica vs Extendida](https://www.gnu.org/software/grep/manual/html_node/Basic-vs-Extended.html)
