#' Leer archivos planos del server:
#' @description
#' Hace una llamada getUrl a la ruta indicada dentro de /srv/DataDNMYE/. Usarlo con read_csv o read_csv2 u otros.
#'
#' @param ruta Texto con la ruta específica del archivo a leer (ej.: "aerocomercial/anac/tabla_final.txt")
#'
#'@export

archivo_plano_srv <- function(ruta) {

  RCurl::getBinaryURL(url = paste0("sftp://",Sys.getenv("SRV_USER"),
                      "@172.26.7.12/DataDNMYE/",
                      ruta),
         userpwd = paste0(Sys.getenv("SRV_USER"),":", Sys.getenv("SRV_CLAVE")),
         dirlistonly = FALSE)

}


