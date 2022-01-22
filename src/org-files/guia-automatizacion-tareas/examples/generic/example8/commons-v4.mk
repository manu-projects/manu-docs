MAKE += -f commons-v3.mk
RM = rm -rfv

DIR_DEP := .dep
DIR_BIN := bin
DIR_SRC := src
DIR_OBJ := .obj
DIRS := $(DIR_DEP) $(DIR_BIN) $(DIR_SRC) $(DIR_OBJ)
SRC := $(wildcard $(DIR_SRC)/*.c)
DEP := $(SRC:$(DIR_SRC)/%.c=$(DIR_DEP)/%.d)
OBJ := $(SRC:$(DIR_SRC)/%.c=$(DIR_OBJ)/%.o)
BIN := app.out

CC := gcc
CFLAGS := -g #-Wall #-Wextra
INCLUDE :=./include
CPPFLAGS :=-I$(INCLUDE) # le avisamos al pre-procesador de C donde encontrar los archivos de cabecera .h
LDFLAGS := -L/usr/include # gcc le indica al GNU linker la ruta donde buscar bibliotecas
LDLIBS := -lpthread -lcommons # gcc le indica al GNU linker que bibliotecas usar (agregar luego de los source files)
# Ojo..! Estamos usando el operador "=" en vez de ":="
# porque queremos que expansión de la macro sea recursiva (la asignación se dará más adelante, cuando se use en una regla)
DEPFLAGS = -MT $@ -MMD -MP -MF $(DIR_DEP)/$*.tmp.d

.PHONY: all
all: $(DIRS) $(DIR_BIN)/$(BIN)

$(DIRS): ; @mkdir -p $@

$(DIR_BIN)/$(BIN): $(OBJ)
	@echo "Enlazamos los objetos ("$(notdir $^)") para crear el ejecutable ($(notdir $@)) en $(dir $@)"
	@$(CC) $(LDFLAGS) $(CFLAGS) $^ -o $@ $(LDLIBS)

# esta otra solución hace lo mismo que la de abajo toda comentada al parecer, pero esta anda ok
# $(OBJ): $(DIR_OBJ)/%.o: $(DIR_SRC)/%.c $(DIR_DEP)/%.d | $(DIR_DEP)
# 	@echo "Se modificó el archivo ($?)"
# 	@echo -e "Compilamos el archivo fuente ($(notdir $<)) en objeto en $(dir $@)\n"
# 	@$(CC) $(DEPFLAGS) $(CPPFLAGS) $(CFLAGS) -c $(DIR_SRC)/$*.c -o $(DIR_OBJ)/$*.o
# 	@mv -f $(DIR_DEP)/$*.tmp.d $(DIR_DEP)/$*.d && touch $@

# se sugiere que la directiva "include" esté luego de la definición de la macro que se usa como target,
# ó mejor aún al final del Makefile
$(DEP):
include $(wildcard $(DEP))

# Alternativa #2
# 1. sed: agregar la ruta de los objects
# 2. sed: remueve el target, y cualquier \ slash invertido
# 3. fmt: lista las palabras con saltos de linea, convierte los espacios en saltos de linea, porque le damos un ancho de 1
# 4. sed: remueve los espacios al principio de linea, y agrega : al final de cada linea
$(OBJ): $(DIR_OBJ)/%.o: $(DIR_SRC)/%.c
	@echo "Compilamos el archivo fuente ("$(notdir $<)") en objeto en" $(dir $<)
	@$(CC) $(CPPFLAGS) $(CFLAGS) -c $(DIR_SRC)/$*.c -o $(DIR_OBJ)/$*.o
	@$(CC) -MM $(CPPFLAGS) $(CFLAGS) $(DIR_SRC)/$*.c > $(DIR_DEP)/$*.d # obtenemos los archivos cabecera y los agregamos al dependency file (.d)
	@rsync -z $(DIR_DEP)/$*.d $(DIR_DEP)/$*.d.tmp # copia temporal para trabajar
	@sed -e 's|.*:|$(DIR_OBJ)/$*.o:|' < $(DIR_DEP)/$*.d.tmp > $(DIR_DEP)/$*.d
	@sed -e 's/.*://' -e 's/\\$$//' < $(DIR_DEP)/$*.d.tmp | fmt -1 | \
	sed -e 's/^ *//' -e 's/$$/:/' >> $(DIR_DEP)/$*.d
	@rm -f $(DIR_DEP)/$*.d.tmp # borramos la copia temporal

# - tiene la DESVENTAJA que sólo estamos viendo 1 archivo de cabecera por .h
# Ej. player.c tendrá player.h, pero y si también tiene item.h y otro.h
# entonces player.o debería de crearse nuevamente...
#
# $(OBJ): $(DIR_OBJ)/%.o: $(DIR_SRC)/%.c $(INCLUDE)/%.h
# 	@echo "Compilamos el archivo fuente ("$(notdir $<)") en objeto en" $(dir $<)
# 	@$(CC) $(CPPFLAGS) $(CFLAGS) -c $(DIR_SRC)/$*.c -o $(DIR_OBJ)/$*.o

# --------------------------------------------------------------------

.PHONY: clean
clean:
	@echo "Removiendo ejecutable, objetos y dependencias"
	@-$(RM) $(DIR_BIN)/*.out
	@-$(RM) $(DIR_OBJ)/*.o
	@-$(RM) $(DIR_DEP)/*{.d,.tmp.d}

.PHONY: run
run: ; @-$(DIR_BIN)/$(BIN)

.PHONY: watch
watch:
	@echo "Observando cambios en la aplicación..."
	@while true; do $(MAKE) -q || $(MAKE) --no-print-directory; sleep 1; done


