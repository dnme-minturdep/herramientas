#' Negación de %in% :
#' @description elementos no contenidos dentro de un conjunto
#' @param a vector con conjunto de datos
#' @param b vetor con conjunto de datos 2
#'@export
`%out%` <- function(a,b) ! a %in% b
