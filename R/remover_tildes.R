
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

  acentos_df <- tibble::tibble(
    ansi = c("á", "á", "à", "â", "ã", "ä", "å",
             "à", "â", "ã", "ä", "å", "é", "é", "è", "ê", "ë", "è",
             "ê", "ë", "í", "í", "ì", "î", "ï", "ì", "î", "ï", "ó",
             "ó", "ò", "ô", "õ", "ö", "ð", "ò", "ô", "õ", "ö", "ú",
             "ú", "ù", "û", "ü", "ù", "û", "ü", "ý", "ý", "ÿ"),
    limpio = c("a", "a", "a", "a", "a", "a", "a", "a", "a",
               "a", "a", "a", "e", "e", "e", "e", "e", "e", "e", "e", "i",
               "i", "i", "i", "i", "i", "i", "i", "o", "o", "o", "o", "o",
               "o", "o", "o", "o", "o", "o", "u", "u", "u", "u", "u", "u",
               "u", "u", "y", "y", "y"))

  mgsub::mgsub(texto, pattern = c(acentos_df$ansi, toupper(acentos_df$ansi)),
               replacement = c(acentos_df$limpio, toupper(acentos_df$limpio)), fixed = T)
}
