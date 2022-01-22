# make -f commons-v1.mk

bin/list.bin: src/list.c
	gcc src/list.c -o bin/list.bin -L/usr/include -lcommons

bin/%.bin: src/%.c
	@echo target=$@ dependencias=$^ nombre=$*

# ---------------------

# según la última vesión de gcc, las bibliotecas deben ir luego de los archivos fuente/objetos
# .PHONE: compile
# compile: ; @$(CC) $(NAME).c $(CFLAGS) $(LDFLAGS) -o $(DIR_BIN)$(NAME) $(LDLIBS)

# .PHONY: run
# run: ; @-$(DIR_BIN)/$(NAME)

.PHONY: clean
clean:
	@-rm -rf bin/*.bin
