
<!-- README.md is generated from README.Rmd. Please edit that file -->

# {herramientas} <a href="https://dnme-minturdep.github.io/herramientas/"><img src="man/figures/logo.png" align="right" height="360" /></a>

<!-- badges: start -->
<!-- badges: end -->

El objetivo del paquete es proveer a la [**Dirección Nacional de
Mercados y Estadísticas**](https://www.yvera.tur.ar/sinta/) de un set de
funciones para el procesamiento de datos.

## Instrucciones de instalación

Se puede instalar la versión en desarrollo de `{herramientas}` desde
[GitHub](https://github.com/) con la siguiente sentencia:

``` r
# install.packages("devtools")
devtools::install_github('dnme-minturdep/herramientas', upgrade = FALSE)
```

## Funciones

### Limpieza

**Funciones auxiliares para la limpieza de datos**

-   **`remover_tildes()`**: Función que elimina tildes de las vocales y
    la letra “y”. Ej.: “áéíóú” en “aeiou”

-   **`numeros_en_palabras()`**: Función que transforma dígitos del 0 al
    100 en palabras. Ej.: “1” en “uno”; “25” en “veinticinco”.

-   **`limpiar_texto()`**: Función que aplica limpieza general del
    texto. Ej.: “TéxTÔ con una Ñ?!” en “texto con una n”.

-   **`%out%`**: Valores no contenidos dentro de un conjunto.

### Manejo de Archivos

**Funciones auxiliares para trabajar con archivos del servidor DNMyE**

-   **`set_user_srv()`:** Guía para la configuración de las credenciales
    en .Renviron

-   **`archivo_plano_srv()`** Devuelve las lineas de una archivo plano
    en el server, es para usar junto a `read.csv()` y otras funciones de
    lectura de archivos plano

-   **`read_rds_srv()` y `read_sav_srv()`:** Leen especificamente esos
    tipo de archivos mediante `gzcon()` y `getBinaryURL()`

-   **`write_file_srv()`:** Hace una conexión a la ruta indicada dentro
    del servidor de la DNMyE y escribe un archivo .csv, .rds, .txt o
    .sav

### Cálculos

**Cálculo de indicadores**

-   **`tasa_variacion()`**: Calcula la tasa de variación con respecto al
    período previo según se defina.

## Modo de uso

### Algunos ejemplos básicos sobre cómo utilizar las funciones de la librería:

**Remover los tildes de un vector con texto**

``` r
texto <- "Esta oración tiene tildes en su segunda palabra"


herramientas::remover_tildes(texto)
#> [1] "Esta oracion tiene tildes en su segunda palabra"
```

**Limpieza de texto**

``` r
texto_a_limpiar <- "El correo electrónico de la DNMyE es estadistica@turismo.gob.ar. No tiene un Ñ la oración anterior!!!"

herramientas::limpiar_texto(texto = texto_a_limpiar)
#> [1] "el correo electronico de la dnmye es estadisticaturismogobar no tiene un n la oracion anterior"
```

**Números en palabras**

``` r
numeros <- c(17, 10, 45)

herramientas::numeros_en_palabras(numeros)
#> [1] "diecisiete"       "diez"             "cuarenta y cinco"
```
