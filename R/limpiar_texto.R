
#' Limpieza general de texto:
#' @description
#' Aplica tolower(), str_replace_all() para quitar caracteres especiales y remover_tildes().
#' También aplica opcionalmente str_replace_all() convertir "ñ" en "n" (por default se aplica). Ej.:
#' @param texto variable de clase 'character' a la que se le quiere aplicar la función
#' @param enie valor lógico (TRUE o FALSE) indicando si reemplazar "ñ" por "n"
#'
#' @examples
#' limpiar_texto("TéxTÔ con una Ñ?!") #"texto con una n"
#' limpiar_texto("TéxTÔ con una Ñ?!", enie = FALSE) #"texto con una ñ"
#'
#'@export
limpiar_texto <- function(texto, enie = TRUE){
  if (enie) {
    remover_tildes(
      stringr::str_replace_all(
        stringr::str_replace_all(
          string = tolower(texto),
          pattern = "[^[:alnum:] ]",
          replacement = ""),
        pattern = stringr::fixed("\uF1"), replacement =  "n"))
  } else {
    remover_tildes(
      stringr::str_replace_all(
        string = tolower(texto),
        pattern = "[^[:alnum:] ]",
        replacement = ""))
  }

}
