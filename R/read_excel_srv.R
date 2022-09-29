#' Leer archivos excel del server:
#' @description
#' Hace una conexión a la ruta indicada dentro de /srv/DataDNMYE/ y lee el archivo XLSX con read_xlsx().
#'
#' @param ruta Texto con la ruta específica del archivo a leer (ej.: "aerocomercial/anac/base_anac_agrupada.xlsx")
#' @param sheet Número o nombre de la pestaña a leer. Por default levanta la primera
#'
#'@export
#'

read_excel_srv <- function(ruta, sheet = 1) {

  tf <-  tempfile()

  con <- RCurl::getBinaryURL(url = paste0("sftp://", Sys.getenv("SRV_USER"),
                                          "@172.26.7.12/DataDNMYE/", ruta),
                             userpwd = paste0(Sys.getenv("SRV_USER"),":", Sys.getenv("SRV_CLAVE")),
                             dirlistonly = FALSE)

  writeBin(con, con = tf)

  readxl::read_excel(tf, sheet = sheet)

}
