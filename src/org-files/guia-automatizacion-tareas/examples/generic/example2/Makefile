
# le dice a make en que "rutas relativas" encontrar las dependencias .c y .h
NAME=game

# al ser un estandar que .c está en src/ y .h en include/
# no debería ser necesario usar la directiva "vpath patrón ruta relativa"
vpath %.c src
vpath %.h include
# VPATH = src include

RM = rm -vrf
CC = gcc
CFLAGS = -g -I. -I./include # headers..? no son necesarios?
#CPPFLAGS = -I include # cpp es "c pre-processor".. <------------ (???)

$(NAME): item.o player.o game.o
	$(CC) $^ -o $@

game.o: game.c
	$(CC) -c $<

player.o: player.c player.h
	$(CC) -c $<

item.o: item.c item.h
	$(CC) -c $<

.PHONY: clean
clean:
	@$(RM) *.[o]
	@$(RM) $(NAME)
