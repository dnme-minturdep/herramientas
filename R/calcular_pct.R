
#' Calcular Porcentaje
#'
#' @param data un vector númerico
#' @param texto parámetro lógico que determina si el resultado lo devuelve como texto -para usar en tabulados o gráficos- o como valor númerico
#'
#' @return vector 'character' por defecto
#' @export
#'
#' @examples
#'
#' library(dplyr)
#' library(tibble)
#' tibble(
#' region = c("Norte", "Sur", "Este", "Oeste"),
#' turistas_pct = c(156987, 895321, 456987, 654789)
#' ) %>%
#' mutate(pct = calcular_pct(turistas_pct))

calcular_pct <- function(data, texto = TRUE){

  pct <- round(data/sum(data) * 100,1)

  if(texto == FALSE) {

    return(pct)

  } else {
    paste0(pct, "%")
  }
}
