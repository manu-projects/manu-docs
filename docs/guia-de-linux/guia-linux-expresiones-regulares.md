Dropbox Zuñiga:
[Ver Link](https://www.dropbox.com/sh/il9i6kwuj1mn8xv/AAAAMG7POI1-rpasCaxGXPjra?dl=0)

Ej.

```
# para mostrar los archivos que empiezan con letra 'e'
> ls | grep -E "^[e].*"
exercise1-10.c
exercise1-10.c~
exercise1-11.c
exercise1-11.c~

# para mostrar los archivos que NO empiezan con letra 'e'
> ls | grep -E "^[e].*"
a.out
#testing.c#
testing.c
testing.c~

# mostrar archivos que empiezan con "e" y terminan con ".c"
ls | grep -E ^"e.*\.c"$
exercise1-10.c
exercise1-11.c
exercise1-12.c
exercise1-3.c

# listar archivos que
# 1. empiezan con "e" 
#     esto se debe al operador ^
# 2. seguido de de cero o mas caracteres
#     porque el signo . (el punto) sirve de comodin
#     con el * (el asterisco) el que lo preceda se repita 0 o mas veces
# 3. seguido del numero 1 
# 4. puede seguirle o no un guion "-"
#     con el simbolo ? (interrogacion) es similar al * (kleene)
#      pero se repite  cero o 1 vez
# 5. seguido de numeros del 0 al 9 
#     con los corchetes [] se puede agregar rangos de numeros
#     sirve con el abecedario [a-zA-Z]
# 6. y termina con la extension ".c"
#     por el signo $ (pesos)

ls | grep -E ^"e.*1\-?[0-9]\.c"$

```
## Referencias

- Concepto generales POSIX, BRE ERE
[Ver Pagina](https://blog.desdelinux.net/con-el-terminal-uso-de-expresiones-regulares/)
- Expresion REgular Extendida, Boost
[Ver Pagina](https://www.boost.org/doc/libs/1_38_0/libs/regex/doc/html/boost_regex/syntax/basic_extended.html)
- Expresion Regular Basica vs Extendida
[Ver Pagina](https://www.gnu.org/software/grep/manual/html_node/Basic-vs-Extended.html)
