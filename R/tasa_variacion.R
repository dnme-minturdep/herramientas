#' Limpieza general de texto:
#' @description
#' Calcula la tasa de variación con respecto al período previo según se defina, aplicando dplyr::lag()
#' @param variable variable numérica para calcular la variación
#' @param período indicar cuántos períodos para atrás se calcula. Por defecto es anual (1 período),
#' puede elegirse "mensual" o "trimestral" o directamente el número (12 para mensual por ej.)
#' @param porcentaje variación en términos porcentuales (multiplica por 100)
#' @param presentacion resultado en formato character con separador de decimales y miles usuales
#' tasa_varaicion(c(10,10,10,10))
#' tasa_variacion(c(10,10,10,10),periodo = trimestral)
#'@export
tasa_variacion <- function(variable,periodo = "anual",
                           porcentaje = FALSE,
                           presentacion = FALSE){
    if (periodo == "anual") {
    variacion <- variable/dplyr::lag(variable,1)-1
  } 
  else if (periodo == "trimestral"){
    variacion <-  variable/dplyr::lag(variable,4)-1
  }
  else if (periodo == "mensual"){
    variacion <-  variable/dplyr::lag(variable,12)-1
    
  }
  else {
    variacion <- variable/dplyr::lag(variable,periodo)-1}
  
  if (porcentaje == T){
    variacion <- 100*variacion
  }
  
  if (presentacion == T & porcentaje == F){
    return(paste0(format(round(variacion*100,1),decimal.mark = ",", big.mark="."),"%"))
  }
  else if (presentacion == T & porcentaje == T){
    return(paste0(format(round(variacion,1),decimal.mark = ",", big.mark="."),"%"))
  }
    return(variacion)
  
}
