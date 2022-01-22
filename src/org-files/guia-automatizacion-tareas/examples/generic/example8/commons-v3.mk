# make -f commons-v3.mk

#MAKE += -f commons-v3.mk
RM = rm -rfv

DIR_BIN = bin
DIR_SRC = src
DIR_OBJ = obj
SRC = $(wildcard $(DIR_SRC)/*.c)
OBJ = $(SRC:$(DIR_SRC)/%.c=$(DIR_OBJ)/%.o)
BIN = app.out

CC=gcc
CFLAGS=-g #-Wall #-Wextra
INCLUDE=./include
CPPFLAGS=-I$(INCLUDE) # le avisamos al pre-procesador de C donde encontrar los archivos de cabecera .h
LDFLAGS=-L/usr/include # gcc le indica al GNU linker la ruta donde buscar bibliotecas
LDLIBS=-lpthread -lcommons # gcc le indica al GNU linker que bibliotecas usar (agregar luego de los source files)

.PHONY: all
all: $(DIR_BIN)/$(BIN)

$(DIR_BIN)/$(BIN): $(OBJ)
	@echo "Enlazamos los objetos ("$(notdir $^)") para crear el ejecutable" $(notdir $@) en $(dir $@)
	@$(CC) $(LDFLAGS) $(CFLAGS) $^ -o $@ $(LDLIBS)

$(OBJ): $(DIR_OBJ)/%.o: $(DIR_SRC)/%.c $(INCLUDE)/%.h
	@echo "Compilamos el archivo fuente ("$(notdir $<)") en objeto en" $(dir $<)
	@$(CC) $(CPPFLAGS) $(CFLAGS) -c $(DIR_SRC)/$*.c -o $(DIR_OBJ)/$*.o

# --------------------------------------------------------------------

.PHONY: clean
clean:
	@echo "Removiendo archivos ejecutables y objetos existentes"
	@-$(RM) $(DIR_BIN)/*.out
	@-$(RM) $(DIR_OBJ)/*.o

.PHONY: run
run: ; @-$(DIR_BIN)/$(BIN)

.PHONY: watch
watch:
	@echo "Observando cambios en la aplicación..."
	@while true; do $(MAKE) -q || $(MAKE) --no-print-directory; sleep 1; done


