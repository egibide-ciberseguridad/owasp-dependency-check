#!make

ifneq (,$(wildcard ./.env))
    include .env
    export
endif

help:
	@echo Opciones:
	@echo -------------------
	@echo build
	@echo -------------------

build:
	@docker build --build-arg VERSION=${OWASP_DEPENDENCY_CHECK_VERSION} -t owasp-dependency-check-cli .
