include Makefile.conf

all: down up

b build:
	$(info Construyendo imagenes...)
	@docker-compose build $(ARGS)

u up:
	$(info Ejecutando contenedor/es...)
	@docker-compose up $(ARGS)

p pause:
	$(info Pausando contenedor/es...)
	@docker-compose pause $(ARGS)

s stop:
	$(info Deteniendo contenedor/es...)
	@docker-compose stop $(ARGS)

d down:
	@docker-compose down $(ARGS)

l logs:
	@docker-compose logs --tail 50 --follow $(ARGS)

sh:
	$(info Accediendo al contentendor en modo interactivo...)
	@docker-compose exec $(ARGS) /bin/sh

npm:
	@docker-compose exec $(CONTAINER_WEBAPP) npm $(ARGS)

export:
	@$(MAKE) --no-print-directory -f export.mk watch

.PHONY: all sh npm export b build u up s stop l logs d down clean p pause
