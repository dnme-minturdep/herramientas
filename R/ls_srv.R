#' Listar carpetas y archivos del server:
#' @description
#' Devuelve un vector con las ubicaciones en la ruta indicada dentro de /srv/DataDNMYE/.
#'
#' @param ruta Texto con la ruta específica del archivo a leer (ej.: "aerocomercial/anac/base_anac_agrupada.rds")
#' @examples
#' ls_srv()
#' ls_srv("peajes")
#'
#'@export
#'

ls_srv <- function(ruta = NULL) {

  sort(
    strsplit(
      as.vector(
        RCurl::getURL(url = paste0("sftp://", Sys.getenv("SRV_USER"),
                                   "@172.26.7.12/DataDNMYE/", ruta, "/"),
                      userpwd = paste0(Sys.getenv("SRV_USER"),":", Sys.getenv("SRV_CLAVE")), .encoding = "UTF-8",
                      dirlistonly = T)),
      split = "\\n")[[1]])

}

