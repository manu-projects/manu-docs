INCLUDE = ./include
OBJ = calculadora.o operaciones.o

calculadora: $(OBJ)
  # esta orden la agrega de forma implícita GNU Make, por tanto es opcional agregarla
	gcc -o $@ $^
	@echo "target=$@ , dependencias=$^"

# reescribimos la regla de patrón estática pero para el objetivo "calculadora.o",
# le agregamos una nueva dependencia lib.h para que se reconstruya calculadora.o
# en caso de que se actualice el archivo de cabecera lib.h
calculadora.o: ./include/lib.h

# no sería necesario escribir esta regla, ya la genera nueva regla de patrón estática
#operaciones.o: operaciones.c ./include/operaciones.h

# REGLA DE PATRON ESTATICA
#
# - Esta regla de patron estática sólo aplica para las dependencias calculadora.c, calculadora.h,
# operaciones.c y operaciones.h. Todas esas archivos deben existir, caso contrario GNU Make dirá
# que no pudo encontrar alguna de ellas.
$(OBJ): %.o: %.c $(INCLUDE)/%.h
  # esta orden la agrega de forma implícita GNU Make, por tanto es opcional agregarla
	gcc -I$(INCLUDE) -c $< -o $@
	@echo "target=$@ , primer dependencia=$<"

# GNU Make interpretará la anterior regla de patrón estática de la sig. manera:
#
# calculadora.o: calculadora.c ./include/calculadora.h ./include/lib.h <-- aparece lib.h xq reescribimos la regla para calculadora.o
# 	gcc -I./include -c calculadora.c -o calculadora.o
#		@echo "target=calculadora.o , primer dependencia=calculadora.c"
#
# operaciones.o: operaciones.c ./include/operaciones.h
# 	gcc -I./include -c operaciones.c -o operaciones.o
#		@echo "target=operaciones.o , primer dependencia=operaciones.c"

#---------------------------------------------------------------------------------------------

# Si a la anterior regla de patrón estática le sacaramos el target $(OBJ) quedando solo %.o : %.c %.h
# entonces quedaría una regla de patrón simple, y aplicaría para cualquier .c que coincida con el patrón del objetivo .o
#
# Ej.
# Supongamos que también estaba el archivo fuente funciones.c y sus respectivo archivo de cabecera funciones.h
# entonces esta regla de patrón sin el $(OBJ) haria que GNU Make lo interprete como hacía con calculadora.o y operaciones.o
#
# funciones.o: funciones.c ./include/funciones.h
# 	gcc -o funciones.o funciones.c
#		@echo "target=funciones.o , primer dependencia=funciones.c"
#


# --------------------------------------------------

.PHONY: clean
clean:
	@-rm *.o
	@-rm calculadora

.PHONY: run
run: ; @./calculadora
