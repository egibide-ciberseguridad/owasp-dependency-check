#!make

ifneq (,$(wildcard ./.env))
    include .env
    export
else
$(error No se encuentra el fichero .env)
endif

help: _header
	${info }
	@echo Opciones:
	@echo --------------------------
	@echo build
	@echo --------------------------

_header:
	@echo --------------------------
	@echo OWASP Dependency-Check CLI
	@echo --------------------------

build:
	@docker build --build-arg VERSION=${OWASP_DEPENDENCY_CHECK_VERSION} -t owasp-dependency-check-cli .
