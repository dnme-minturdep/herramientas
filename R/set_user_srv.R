#' Configurar usuario del server de dnmye:
#' @description
#' Guia para que el usuario configure sus credenciales en .Renviron".
#' @export
#'
set_user_srv <- function() {
  cat(
    "###
  Agregar al archivo .Renviron abierto el nombre de usuario y clave:
  SRV_USER = \"nombredeusuario\"
  SRV_CLAVE = \"clavedeusuario\"
###
  Guardar archivo y reiniciar sesion.\n")
  usethis::edit_r_environ()

}
