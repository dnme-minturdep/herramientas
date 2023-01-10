
#' Limpieza general de tildes:
#' @description
#' Elimina tildes y dieresis de las vocales y la letra "y". Ej.: "ÿÚòâ" en "yUoa".
#'
#' @param texto variable de clase 'character' a la que se le quiere aplicar la función
#' @examples
#' remover_tildes("ÿÚòâ") #"yuoa"
#'
#'@export
remover_tildes <- function(texto) {
  mgsub::mgsub(texto, pattern = c(acentos_df$ansi, toupper(acentos_df$ansi)),
               replacement = c(acentos_df$limpio, toupper(acentos_df$limpio)), fixed = T)
}
