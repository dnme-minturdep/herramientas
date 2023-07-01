#' Listar carpetas y archivos del server:
#' @description
#' Devuelve un vector con las ubicaciones en la ruta indicada dentro de /srv/DataDNMYE/.
#'
#' @param ruta Texto con la ruta específica (ej.: "evyth/microdatos/").
#' @param full_names Lógico Indica si devolver la ruta entera del archivo o directorio o solo el nombre del elemento.
#'
#'@export
#'

ls_srv <- function(ruta = NULL, full_names = F) {

  if (!is.null(ruta)) {

    ruta <- gsub(x = ruta, pattern = ".*/DataDNMYE/", replacement = "")

    ruta <- gsub(x = ruta, pattern = "//", replacement = "/")

  }

  resultados <- sort(
    strsplit(
      as.vector(
        RCurl::getURL(url = paste0("sftp://", Sys.getenv("SRV_USER"),"@",Sys.getenv("SRV_IP"),
                                   "/DataDNMYE/", ruta, "/"),
                      userpwd = paste0(Sys.getenv("SRV_USER"),":", Sys.getenv("SRV_CLAVE")), .encoding = "UTF-8",
                      dirlistonly = T, .opts = )),
      split = "\\n")[[1]])

  resultados <- resultados[!grepl("\\.|\\.\\.", resultados)]


  if (full_names) {
    paste0("/srv/DataDNMYE/", ruta, "/",resultados)

  } else {
    paste0(resultados)
  }


}



