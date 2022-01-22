FILES := README.md main.c player.c player.h

.DEFAULT_GOAL: crearArchivos

# arranca ejecutando como objetivo, el nombre de cada dependencia
.PHONY: crearArchivos
crearArchivos: $(FILES)
	@echo "archivos creados.."

# - si creamos sólo este objetivo, sin el objetivo 'crearArchivos'
# entonces se creará un único archivo..
$(FILES):
	@echo "creando archivo $@"
	@touch $@

.PHONY: clean
clean: ; @-rm -rvf $(FILES)
