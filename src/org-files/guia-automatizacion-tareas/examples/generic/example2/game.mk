NAME=game
SRC = player.c item.c game.c
OBJECTS = player.o item.o game.o
INCL = player.h item.h
RM = rm -vrf

CC = gcc
CFLAGS = -g

vpath %.c src
vpath %.h include

# se ejecuta luego, genera el binario con los .o
$(NAME): $(OBJECTS)
	@echo "objects to binary"
	$(CC) $^ -o $@

# se ejecuta primero, convierte los .c en .o
%.o: %.c
	@echo "c to objects"
	$(CC) -c $<

# mmmh.. lo agrega, pero arriba no lo usa, o si (???)
$(OBJECTS): $(INCL)

clean:
	@$(RM) $(OBJECTS)
	@$(RM) $(NAME)

run:
	./$(NAME)

#$(OBJECTS): %.o: %.c
# 	$(CC) -c $<
