PROGRAMA = calculadora
CC = gcc
INCLUDE = ./include

OBJ = calculadora.o operaciones.o lib.o

# Versión más básica, menos genérica
#
# $(PROGRAMA): calculadora.c operaciones.c lib.c $(INCLUDE)/operaciones.h $(INCLUDE)/lib.h
# 	gcc -I$(INCLUDE)  -o $(PROGRAMA) calculadora.c operaciones.c lib.c

$(PROGRAMA): $(OBJ)
	$(CC) -o $(PROGRAMA) $(OBJ)

calculadora.o : calculadora.c $(INCLUDE)/operaciones.h
	$(CC) -I$(INCLUDE) -c -o calculadora.o  calculadora.c

operaciones.o : operaciones.c $(INCLUDE)/operaciones.h $(INCLUDE)/lib.h
	$(CC) -I$(INCLUDE) -c -o operaciones.o operaciones.c

lib.o : lib.c $(INCLUDE)/lib.h
	$(CC) -I$(INCLUDE) -c -o lib.o lib.c

# --------------------------------------------------

.PHONY: clean
clean:
	@-rm *.o
	@-rm $(PROGRAMA)

.PHONY: run
run: ; @./$(PROGRAMA)
