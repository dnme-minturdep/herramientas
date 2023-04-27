#' \code{herramientas} package
#'
#' Paquete de R con utilidades para "domar los datos" de la DNMYE
#' See the README on
#' \href{https://github.com/dnme-minturdep/herramientas/blob/main/README.md}{Github}
#'
#' @docType package
#' @name herramientas
NULL

## quiets concerns of R CMD check re: the .'s that appear in pipelines

if(getRversion() >= "2.15.1")
  utils::globalVariables(c("fixed_function_var_prov",
                           "provincia_nombre"))
