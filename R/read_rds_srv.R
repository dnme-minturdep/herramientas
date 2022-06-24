#' Leer archivos rds del server:
#' @description
#' Hace una conexión a la ruta indicada dentro de /srv/DataDNMYE/ y lee el archivo RDS con readRDS().
#'
#' @param ruta Texto con la ruta específica del archivo a leer (ej.: "aerocomercial/anac/base_anac_agrupada.rds")
#'
#'
#'@export
#'

read_rds_srv <- function(ruta) {
  con <- RCurl::getBinaryURL(url = paste0("sftp://", Sys.getenv("SRV_USER"),
                                   "@172.26.7.12/DataDNMYE/", ruta),
                      userpwd = paste0(Sys.getenv("SRV_USER"),":", Sys.getenv("SRV_CLAVE")),
                      dirlistonly = FALSE)

  con <- gzcon(rawConnection(con))

  on.exit(close(con))

  readRDS(con)
}
