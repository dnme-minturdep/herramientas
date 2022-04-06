
#' Limpieza general de tildes:
#' @description
#' Elimina tildes las vocales y la letra "y". Ej.: "ÿúòâ" en "yuoa".
#'
#' @param texto variable de clase 'character' a la que se le quiere aplicar la función
#'
#'@export
remover_tildes <- function(texto) {
  mgsub::mgsub(texto, pattern = acentos_df$ansi,
               replacement = acentos_df$limpio, fixed = T)
}
