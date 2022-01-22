# make -f commons-v1.mk

DIR_BIN=./bin
DIR_SRC=./src
DIR_OBJ=./obj

SRC = $(wildcard *.c)
OBJ = $(SRC:.c=.o)
BIN = $(SRC:.c=.bin)

CC=gcc
CFLAGS=-g #-Wall #-Wextra
LDFLAGS=-L/usr/include # le indica el linker la ruta donde buscar bibliotecas
LDLIBS=-lpthread -lcommons # le indica al linker que bibliotecas usar

bin/list.bin: src/list.c
	gcc src/list.c -o bin/list.bin -L/usr/include -lcommons

%.bin: %.c
	@echo target=$@ dependencias=$^ nombre=$*

# .PHONY: all
# all: $(DIR_BIN)/$(BIN)

# $(DIR_BIN)/$(BIN): $(DIR_OBJ)/$(OBJ)
# 	$(CC) $^ $(CFLAGS) $(LDFLAGS) -o $@ $(LDLIBS)

# $(DIR_BIN)/$(BIN): $(DIR_SRC)/$(SRC)
# 	$(CC) $^ $(CFLAGS) $(LDFLAGS) -o $(@F) $(LDLIBS)

# $(DIR_OBJ)/%.o: $(DIR_SRC)/%.c
# 	$(CC) -c $(CFLAGS) -o $@


# ---------------------

# según la última vesión de gcc, las bibliotecas deben ir luego de los archivos fuente/objetos
# .PHONE: compile
# compile: ; @$(CC) $(NAME).c $(CFLAGS) $(LDFLAGS) -o $(DIR_BIN)$(NAME) $(LDLIBS)

# .PHONY: run
# run: ; @-$(DIR_BIN)/$(NAME)

# .PHONY: clean
# clean:
# 	@-rm -f $(DIR_BIN)/$(NAME)
