#' Leer archivos del server:
#' @description
#' Hace una conexión a la ruta indicada dentro de /srv/DataDNMYE/ y lee el archivo con una función acorde a la extensión del mismo.
#'
#' @param ruta Texto con la ruta específica del archivo a leer con su extensión (acepta los siguientes formatos: "rds", "csv", "sav", "txt", ".parquet", "xlsx" y "xls") . Ej.: "aerocomercial/anac/base_anac_agrupada.rds".
#'
#' @param sheet En el caso de leer archivos excel, el número o nombre de la pestaña. Por default levanta la primera
#'
#'@export

read_file_srv <- function(ruta, sheet = NULL) {

  ext <- tools::file_ext(ruta)

  if (ext %in% c("csv", "rds", "xlsx", "xls", "txt", "sav", "parquet")) {

    if(Sys.info()["nodename"] != "dev-rstudio-vra-ubuntu") {

      con <- RCurl::getBinaryURL(url = paste0("sftp://", Sys.getenv("SRV_USER"),
                                              "@172.26.7.12/DataDNMYE/", ruta),
                                 userpwd = paste0(Sys.getenv("SRV_USER"),":", Sys.getenv("SRV_CLAVE")),
                                 dirlistonly = FALSE)

      if (ext %in% c("csv","txt")) {

        readr::read_delim(con)

      } else if (ext == "rds") {

        con <- gzcon(rawConnection(con))

        on.exit(close(con))

        readRDS(con)

      } else if (ext == "sav") {

        con <- gzcon(rawConnection(con))

        on.exit(close(con))

        haven::read_sav(con)

      } else if (ext %in% c("xlsx","xls"))  {

        tf <-  tempfile()

        writeBin(con, con = tf)

        readxl::read_excel(tf, sheet = sheet)

      } else if (ext == "parquet") {

        arrow::read_parquet(con)

      }

    } else {

      con <- paste0("/srv/DataDNMYE/", ruta)

      if (ext %in% c("csv","txt")) {

        readr::read_delim(con)

      } else if (ext == "rds") {

        readRDS(con)

      } else if (ext == "sav") {

        haven::read_sav(con)

      } else if (ext %in% c("xlsx","xls"))  {

        readxl::read_excel(con, sheet = sheet)

      } else if (ext == "parquet") {

        arrow::read_parquet(con)

      }
    }
  } else {

    message("Formato de archivo invalido")

  }

}
