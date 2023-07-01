#' Leer archivos sav del server:
#' @description
#' Hace una conexión a la ruta indicada dentro de /srv/DataDNMYE/ y lee el archivo .sav con haven::read_sav().
#'
#' @param ruta Texto con la ruta específica del archivo a leer (ej.: "evyth/microdatos/evyth_microdatos.sav")
#'
#'
#'@export
#'


read_sav_srv <- function(ruta) {
  con <- RCurl::getBinaryURL(url = paste0("sftp://", Sys.getenv("SRV_USER"),"@",Sys.getenv("SRV_IP"),
                                          "/DataDNMYE/", ruta),
                      userpwd = paste0(Sys.getenv("SRV_USER"),":", Sys.getenv("SRV_CLAVE")),
                      dirlistonly = FALSE)

  con <- gzcon(rawConnection(con))

  on.exit(close(con))

  haven::read_sav(con)
}
