#' Listar carpetas y archivos del server:
#' @description
#' Devuelve un vector con las ubicaciones en la ruta indicada dentro de /srv/DataDNMYE/.
#'
#' @param ruta Texto con la ruta específica (ej.: "evyth/microdatos/")
#'
#'
#'@export
#'

ls_srv <- function(ruta = NULL) {


  resultados <- sort(
    strsplit(
      as.vector(
        RCurl::getURL(url = paste0("sftp://", Sys.getenv("SRV_USER"),
                                   "@172.26.7.12/DataDNMYE/", ruta, "/"),
                      userpwd = paste0(Sys.getenv("SRV_USER"),":", Sys.getenv("SRV_CLAVE")), .encoding = "UTF-8",
                      dirlistonly = T)),
      split = "\\n")[[1]])

  if (is.null(ruta)) {
    paste0("/srv/DataDNMYE/",resultados)
  } else {
    paste0("/srv/DataDNMYE/", ruta, "/",resultados)
  }


}

