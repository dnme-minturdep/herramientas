#' Leer archivos rds del server:
#' @description
#' Hace una conexión a la ruta indicada dentro de /srv/DataDNMYE/ y escribe un archivo CSV o RDS.
#'
#' @param x Objeto a escribir (ej: data.frame)
#'
#' @param ruta Texto con la ruta del archivo, incluyendo nombre y extensión del mismo (acepta ".csv" y ".rds"). Ej: "aerocomercial/anac/base_final.csv")
#'
#'@export

write_file_srv <- function(x, ruta) {

  temp_file <- tempfile()

  if (tools::file_ext(ruta) == "csv") {

    readr::write_csv(x = x, file =temp_file)

  } else if (tools::file_ext(ruta) == "rds") {

    saveRDS(object = x, file = temp_file)

  }

  RCurl::ftpUpload(what = temp_file, glue::glue("sftp://{Sys.getenv('SRV_USER')}:{Sys.getenv('SRV_CLAVE')}@172.26.7.12/DataDNMYE/{ruta}"))

}
