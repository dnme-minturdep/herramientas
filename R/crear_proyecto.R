#' Crear esqueleto de un nuevo proyecto de R
#'
#' @param ruta nombre de la carpeta y proyecto que se quiere crear
#'
#' @return directorio base para un nuevo proyecto
#' @export

crear_proyecto <- function(ruta = NULL){

  assertthat::assert_that(!is.null(ruta),
                          msg = "Se debe especificar una ruta valida. Ejemplo: nuevo_proyecto")

  usethis::create_project(path = glue::glue("{getwd()}/{ruta}"))

}
