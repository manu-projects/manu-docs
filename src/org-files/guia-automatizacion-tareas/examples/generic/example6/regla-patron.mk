OBJ = calculadora.o operaciones.o
CFLAGS = -I$(INCLUDE)
INCLUDE = ./include

# - Esta regla de patron estática sólo aplica para las dependencias calculadora.c, calculadora.h,
# operaciones.c y operaciones.h. Todas esas archivos deben existir, caso contrario GNU Make dirá
# que no pudo encontrar alguna de ellas.
$(OBJ): %.o : %.c ./include/%.h
	gcc -I$(INCLUDE) -c -o $@ $<
	@echo ".o a .h"

# GNU Make interpretará la anterior regla de patrón estática de la sig. manera:
#
# calculadora.o: calculadora.c calculadora.h
# 	gcc -o calculadora.o calculadora.c
#
# operaciones.o: operaciones.c operaciones.h
# 	gcc -o operaciones.o operaciones.c

#------------------------------------------------------

# Si a la regla anterior le sacaramos $(OBJ) quedando solo %.o : %.c %.h
# entonces esa regla de patrón aplicaría para cualquier .c que coincida con el patrón del objetivo .o
#
# Ej.
# Supongamos que existen los ficheros funciones.c, lib.c y sus respectivos archivos de cabecera .h
# entonces esta regla de patrón sin el $(OBJ) haria que GNU Make lo interprete como
#
# lib.o: lib.c lib.h
# 	gcc -o lib.o lib.c

# funciones.o: funciones.c funciones.h
# 	gcc -o funciones.o funciones.c
#

calculadora: $(OBJ)

calculadora.o: calculadora.c ./include/operaciones.h
operaciones.o: operaciones.c ./include/operaciones.h

# --------------------------------------------------

.PHONY: clean
clean:
	@-rm *.o
	@-rm calculadora

.PHONY: run
run: ; @./calculadora
