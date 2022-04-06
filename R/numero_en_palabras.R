#' Limpieza de digitos en texto:
#' @description
#' Transforma digitos del 0 al 100 en palabras. Ej.: "1" en "uno", "25" en "veinticinco".
#'
#' @param texto variable de clase 'character' a la que se le quiere aplicar la función
#' @param intervalo rango entre 0 y 100 con los numeros que se desean reemplazar. Ej. intervalo = 37:50
#'
#'@export
numeros_en_palabras <- function(texto, intervalo = 0:100) {

  mgsub::mgsub(texto, pattern = intervalo,
               replacement = numeros_df$nombre[numeros_df$digito %in% intervalo],
               fixed = T)
}
