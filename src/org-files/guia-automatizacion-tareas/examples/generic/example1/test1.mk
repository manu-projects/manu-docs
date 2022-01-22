# make -f test1.mk

.PHONY: size
size: count_words.o
	size $^
	touch size

cfiles: *.[c]
	@echo "Archivos actualizados: " $?
	touch $@

# - Macro automática: $@ (obtiene el nombre del target)
# - Macro automática: $^ (obtiene los nombres de todas las dependencias separadas por espacio)
# - Comando de la regla: gcc $^ -o $@ (ejecutará usando todas las dependencias, y compilará los .o en un ejecutable)
count_words: count_words.o
	gcc $^ -o $@

# - Macro automática: $< (para obtener primer dependencia)
# - Dependencia: count_words.c (es una dependencia que se necesita para crear el target)
# - Target: count_words.o (es el objetivo, el archivo que queremos crear)
# - Comando de la regla: gcc -c $< (se ejecutará usando la primera dependencia, compilará el .c en .o)
#
# Nota 1: Recordá que makefile lee las dependencias de izquierda a derecha, como lee cualquier persona..
#
# Nota 2: Sólo se ejecutará el comando de la regla, si alguna de las dependencias fue modificada más recientemente que el target.
# Recordá que ambos son archivos, si el target ya fue creado y las dependencias no se modificaron, then no ejecutará el comando de la regla.
count_words.o: counter.c count_words.c
	gcc -c $<

