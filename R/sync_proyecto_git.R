#' Sincronizar proyecto con Github
#' @description  Vincula proyecto de R local con repositorio de organización en Github.
#'
#' @param repo Por defecto estos se crean en repositorio DEP ('d4t4tur'). Se puede pasar 'repo = "dnme-minturdep"'
#' como argumento alternativo para vincular con repositorio PROD
#' @param privado Por defecto el repositorio será privado. Se puede pasar como argumento
#' 'privado = FALSE' para que sea público'
#' @return Vínculo origin/remote para un repositorio .git sincronizado con Organización en Github
#' @export

sync_proyecto_git <- function(repo = "d4t4tur",
                              privado = TRUE){

  usethis::use_git()
  usethis::use_github(organisation = repo,
                      private = privado)


}
