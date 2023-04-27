#' skeleton de proyecto
#' @description  arma estructura de carpetas para proyecto
#' @export

crear_carpetas <- function(){
  dir.create("entradas")
  dir.create("salidas")
  dir.create("codigo")
  dir.create("graficos")
  dir.create("docs_metodologicos")
}
