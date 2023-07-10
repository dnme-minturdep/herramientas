# herramientas 0.0.0.9013

* Mejoro función `herramientas::read_file_srv()`: se puede usar desde server y acepta espacios.

# herramientas 0.0.0.9012

* Mejoro `herramientas::read_file_srv()`: acepta espacios en la ruta de lectura y es fleixible a comenzar o no la ruta con "/", es decir: "/economia/datos.csv" es igual a "economia/datos.csv".

# herramientas 0.0.0.9011

* Arreglo bug de `herramientas::etiquetar_provincia()`: ahora toma el nuevo nombre de la columna etiquetada aunque tenga `add_code =  F` y siempre hacer `return` de la base etiquetada

# herramientas 0.0.0.9010

* Agrega funciones para iniciar el flujo de trabajo de proyectos nuevos:

- `herramientas::crear_proyecto()` para generar un nuvo proyecto

- `herramientas::crear_carpetas()` para armar esqueleto típico de sub-directorios

- `herramientas::sync_proyecto()` para sincronizar remoto/origen con repositorio en Github (organizacion)

# herramientas 0.0.0.9009

* Corrige #26 reemplazando `readr::read_rds()` por `base::readRds`

# herramientas 0.0.0.9008

* Agrego lectura y escritura de datos espaciales en `read_file_srv` y `write_file_srv`.

# herramientas 0.0.0.9007

* Arreglo bug en `remover_tildes`.

# herramientas 0.0.0.9006

* Mejora función `etiquetar_provincia`: agrego parámetro para definir nombre de columna nueva.

# herramientas 0.0.0.9005

* Mejora función `ls_srv`: devuelve ruta completa de los archivos y carpetas.
* Mejora función `read_file_srv` y `write_file_srv`: incorporan `...` para pasar multiples parametros a las funciones subyacentes.

# herramientas 0.0.0.9004

* Agrego función `etiquetar_provincia` para generar los nombres y códigos oficiales de las provincias.

# herramientas 0.0.0.9003

* Mejora `remover_tildes()` limpia tildes de mayúsculas también.

# herramientas 0.0.0.9002

* Parametro "uncompressed" por default para `write_file_srv()` desde local.

# herramientas 0.0.0.9001

* Incorporo las funciones de lectura `read_file_srv()` y escritura `write_file_srv()` desde el server

# herramientas 0.0.0.9

* Primera versión de herramientas


