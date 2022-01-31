# ---------------------------------------------------------------------------
# - MACROS

.DEFAULT_GOAL := export

MAKE += -f export.mk

DOC_PATH := docs
HTML_PATH := html
DOC_SUBDIRS := $(sort $(dir $(wildcard $(DOC_PATH)/*/)))
HTML_SUBDIRS := $(subst $(DOC_PATH),$(HTML_PATH),$(DOC_SUBDIRS))
SUBDIRS := $(DOC_SUBDIRS) $(HTML_SUBDIRS)

DOC_FILES := $(foreach dir, $(DOC_SUBDIRS), $(wildcard $(dir)*.org))
HTML_FILES := $(subst $(DOC_PATH),$(HTML_PATH), $(DOC_FILES))
HTML_FILES := $(patsubst %.org,%.html, $(HTML_FILES))

RM := rm -rfv

# ---------------------------------------------------------------------------
# - REGLAS

export: $(SUBDIRS) $(HTML_FILES)

watch:
	$(info Observando cambios en la documentación para exportar...)
	@while true; do $(MAKE) -q || $(MAKE) --no-print-directory; sleep 1; done

$(SUBDIRS):
	$(info Creando estructura de directorios)
	@mkdir -vp $@

$(HTML_FILES):$(HTML_PATH)/%.html:$(DOC_PATH)/%.org
	$(info Exportando a html el fichero $(subst $(DOC_PATH)/,,$<))
	@pandoc $< -o $@

clean:
	$(info Borrando archivos html...)
	@-$(RM) $(HTML_FILES)

.PHONY: watch export clean
