DIR_ROOT := .
#DIRS := proyecto1 proyecto2 proyecto3 proyecto4

SUBDIRS := $(wildcard */**)
DIRS := $(patsubt %/,%x,$(wildcard */))
#DIRS := $(wildcard */)

# esto no anda (?)
#DIRS := $(filter_out proyecto1, $(wildcard */**))

# esto no anduvo bien...
#DIRS := $(sort $(wilcard $(DIR_ROOT)/*))

#	@echo $(DIRS)
.PHONY: imprimir
imprimir:
	@echo "DIRS"
	@$(foreach dir, $(DIRS), echo -e "\t" $(dir);)
#	@$(foreach dir, $(DIRS), echo -e "\t" $(dir);)
	@echo "SUBDIRS"
	@$(foreach dir, $(SUBDIRS), echo -e "\t" $(dir);)

# all: $(DIRS) crearDirectorios
# 	@echo "carpeta:" $@

# $(DIRS): ; @echo "carpeta:" $@
# ----------------------------------------------------------

.PHONY: crearDirectorios
crearDirectorios: ; @mkdir -p proyecto{1..4}/{src,include}

.PHONY: clean
clean: ; @-rm -rf proyecto*
