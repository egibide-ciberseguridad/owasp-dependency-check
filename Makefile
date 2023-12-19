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
	@docker build \
			--build-arg VERSION=${OWASP_DEPENDENCY_CHECK_VERSION} \
			--build-arg GO_VERSION=${GO_VERSION} \
			--build-arg JAVA_VERSION=${JAVA_VERSION} \
			--build-arg DOTNET_VERSION=${DOTNET_VERSION} \
			--build-arg ALPINE_VERSION=${ALPINE_VERSION} \
			--build-arg POSTGRES_DRIVER_VERSION=${POSTGRES_DRIVER_VERSION} \
			--build-arg MYSQL_DRIVER_VERSION=${MYSQL_DRIVER_VERSION} \
			-t owasp-dependency-check-cli .
