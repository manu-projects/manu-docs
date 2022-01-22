EXECUTABLE=game
# SRC = $(wildcard *.c) # <- dudas de como funciona (???)
SRC = player.c item.c game.c
OBJECTS = $(patsubst %.c,%.o, $(SRC)) # reemplazamos los .c por .o
RM = rm -vrf

CC = gcc
# headers..? no son necesarios? xq la app corre igual sin esto e.e
# CFLAGS = -g -I. -I./include

vpath %.c src
vpath %.h include

all: $(EXECUTABLE)

# se ejecuta luego, genera el binario con los .o
$(EXECUTABLE): $(OBJECTS)
	$(CC) $^ -o $@
#	@echo "objects to binary"

# se ejecuta primero, convierte los .c en .o
%.o: %.c
	$(CC) -c $<
#	@echo "c to objects"

clean:
	@$(RM) $(OBJECTS)
	@$(RM) $(EXECUTABLE)

run:
	./$(EXECUTABLE)
