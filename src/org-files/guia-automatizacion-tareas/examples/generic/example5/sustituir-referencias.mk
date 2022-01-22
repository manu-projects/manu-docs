#ORG_FILES = guia-linux.org guia-makefile.org guia-emacs.org
ORG_FILES = 1.org 2.org 3.org
#ORG_FILES = $(wildcard *.org)

HTML_FILES = $(ORG_FILES:.org=.html)
PDF_FILES = $(patsubst %.org, %.pdf, $(ORG_FILES))

.PHONY: all
all: $(HTML_FILES) $(PDF_FILES)

# Alternativa #1
# - Usamos el ; si queremos cumplir el objetivo/target sin dependencias
# - Si los archivos .org no existen, esto no arrojará error
# en cambio la alternativa #2 fallará
$(PDF_FILES): ; @echo $@

# Alternativa #2
# - Agregamos como patrón de objetivo/target lo sig.: %.html:%.org
# - El patrón de objetivo debe coincidir con el valor que tiene el target cuando éste se expande
# - Es necesario que los archivos %.org existan, caso contrario GNU Make lanzará una excepción
#
# Ej. Si ponemos como patrón %.xhtml:%.org entonces arrojará error, porque debe coincidir con $(HTML_FILES)
#
# Ej. Supongamos que en ORG_FILES agregamos un archivo 10.org que no existe en el directorio, make dirá:
# "make: *** No hay ninguna regla para construir el objetivo '10.org', necesario para '10.html'"
$(HTML_FILES): %.xhtml: %.org
	@echo "Convirtiendo con pandoc el $< a $@"


# --------------------------------------------------------------------------
# estos targets/objetivos sólo son para crear/borrar el escenario a trabajar
.PHONY: crearArchivos
crearArchivos: ; @touch {1..5}.org

.PHONY: clean
clean: ; -@rm *.{html,org}
