# - Obtenemos todos los archivos con extensión .org, en la ruta actual
# - cuando el wildcard se expande, a la variable se le asigna los nombres de los archivos separados por espacios
# https://www.gnu.org/software/make/manual/html_node/Wildcard-Function.html
ORG_FILES = $(wildcard *.org)

# Alternativa #1: Sustituir referencias
# - Usamos el operador :
# - variable:.extension = .extensionNueva
# https://www.gnu.org/software/make/manual/make.html#Substitution-Refs
HTML_FILES = $(ORG_FILES:.org=.html)

# Alternativa #2:
# - Usamos las funciones para manipular strings (Ej. patsubst)
XHTML_FILES = $(patsubst %.org, %.html, $(ORG_FILES))

.PHONY: all
all: $(XHTML_FILES)

.PHONY: printhtml
printhtml: ; @echo $(HTML_FILES)

.PHONY: printxhtml
printxhtml: ; @echo $(XHTML_FILES)

# FALTA INVESTIGAR MÁS...
# - Usamos el operador : para indicar que vamos a transformar los .org en html
# - el $< obtiene la primer dependencia que será un .org
# - el $@ obtiene el objetivo/target que será el archivo transformado .html
$(HTML_FILES): %.html: %.org
	@echo "Convirtiendo con pandoc el $< a $@"

# --------------------------------------------------------------------------
# estos targets/objetivos sólo son para crear/borrar el escenario a trabajar
.PHONY: crearArchivos
crearArchivos: ; @touch {1..5}.org

.PHONY: clean
clean: ; -@rm *.{html,org}
