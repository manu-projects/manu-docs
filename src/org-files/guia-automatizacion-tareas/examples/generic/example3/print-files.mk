# make -f print-files.mk

# Con "wildcard" obtenemos todos los ficheros con la extensión .c
# osea todas las entradas de un directorio cuyos nombres terminen en .c
#
MAKEFILES = $(wildcard *.c)

.PHONY: print
print:
	@echo $(MAKEFILES)

# Podemos usar el ";" para no declarar dependencias
# para ejecutar la rutina tras el target (objetivo)
#
# count: ;@echo $(MAKEFILES)

