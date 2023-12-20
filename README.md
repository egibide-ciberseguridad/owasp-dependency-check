# OWASP Dependency-Check

[OWASP Dependency-Check](https://owasp.org/www-project-dependency-check/) en un contenedor Docker.

## Funcionamiento

1. Obtener una [API Key para descargar la base de datos NVD](https://nvd.nist.gov/developers/request-an-api-key).
2. Guardar la clave en un fichero con el nombre `.nvd-api-key`.
3. Lanzar el script correspondiente desde la carpeta raíz del proyecto a analizar.

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
