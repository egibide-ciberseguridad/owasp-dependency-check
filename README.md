# OWASP Dependency-Check

[OWASP Dependency-Check](https://owasp.org/www-project-dependency-check/) en un contenedor Docker.

## Funcionamiento

Lanzarlo desde la carpeta raíz del proyecto a analizar.

### Windows

```shell
<ruta_a_este_repositorio>\owasp-dependency.bat
```

### Linux y macOS Intel

```shell
<ruta_a_este_repositorio>/owasp-dependency.sh
```

### macOS M1

La primera vez, construir el contenedor:

```shell
make build
```

Lanzar el script:

```shell
<ruta_a_este_repositorio>/owasp-dependency-m1.sh
```

## Informe

El informe se genera en `~/mi_proyecto/odc-reports/dependency-check-report.html`.
