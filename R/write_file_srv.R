#' Leer archivos rds del server:
#' @description
#' Hace una conexión a la ruta indicada dentro de /srv/DataDNMYE/ y escribe un archivo CSV, RDS, XLSX, TXT, PARQUET o SAV.
#'
#' @param x Objeto a escribir (ej: data.frame)
#'
#' @param ruta Texto con la ruta del archivo, incluyendo nombre y extensión del mismo (acepta ".csv", ".rds", ".xlsx", ".txt", ".parquet", ".sav", "gpkg", "geojson" y "kml"). Ej: "aerocomercial/anac/base_final.csv")
#'
#' @param ... Parametros para pasarle a la funcion de escritura subyacente:
#' - csv: readr::write_csv
#' - txt: utils::write.table
#' - rds: readr::write_rds
#' - sav: haven::write_sav
#' - xlsx: openxlsx::write.xlsx
#' - parquet: arrow::write_parquet
#' - gpkg/geojson/kml: sf::write_sf
#'@export

write_file_srv <- function(x, ruta, ...) {

  ruta <- gsub(x = ruta, pattern = "/srv/DataDNMYE/", replacement = "")

  ext <- tools::file_ext(ruta)

  if (ext %in% c("csv", "rds", "xlsx", "txt", "sav", "parquet", "gpkg", "geojson","kml")) {

    if(Sys.info()["nodename"] != "dev-rstudio-vra-ubuntu") {

      # check <- paste0("/srv/DataDNMYE/", ruta) %in% herramientas::ls_srv(sub("/[^/]+$", "", ruta))
      #
      # if (check == TRUE) {
      #
      #   user_response <- readline(prompt="El archivo ya existe. Desea sobreescribirlo? (si/no): ")
      #
      # } else {
      #
      #   user_response <- "si"
      #
      # }

      #if (user_response == "si") {

        temp_file <- tempfile()

        if (ext == "csv") {

          readr::write_csv(x = x, file =temp_file, ...)

        } else if (ext == "rds") {

          readr::write_rds(x = x, file = temp_file, ...)

        } else if (ext == "sav") {

          haven::write_sav(data = x, path = temp_file, ...)

        } else if (ext == "txt") {

          utils::write.table(x = x, file = temp_file, ...)

        } else if (ext == "xlsx") {

          openxlsx::write.xlsx(x = x, file = temp_file, overwrite = T, ...)

        } else if (ext == "parquet") {

          arrow::write_parquet(x = x, sink = temp_file, ...)

        } else if (ext %in% c("gpkg", "geojson", "kml")) {

          suppressWarnings(sf::write_sf(x, temp_file, driver = ext, ...))

        }

        suppressMessages(RCurl::ftpUpload(what = temp_file, glue::glue("sftp://{Sys.getenv('SRV_USER')}:{Sys.getenv('SRV_CLAVE')}@{Sys.getenv('SRV_IP')}/DataDNMYE/{ruta}")))

        message("Escritura realizada")

      # }
      # else {
      #
      #   message("Escritura cancelada")
      #
      # }

    } else {

      ruta <- paste0("/srv/DataDNMYE/",ruta)

      # check <- file.exists(ruta)
      #
      # if (check == TRUE) {
      #
      #   user_response <- readline(prompt="El archivo ya existe. Desea sobreescribirlo? (si/no): ")
      #
      # } else {
      #
      #   user_response <- "si"
      #
      # }

      #if (user_response == "si") {


        if (ext == "csv") {

          readr::write_csv(x = x, file = ruta, ...)

        } else if (ext == "rds") {

          readr::write_rds(x = x, file = ruta, ...)

        } else if (ext == "sav") {

          haven::write_sav(data = x, path = ruta, ...)

        } else if (ext == "txt") {

          utils::write.table(x = x, file = ruta,  ...)

        } else if (ext == "xlsx") {

          openxlsx::write.xlsx(x = x, file = ruta, overwrite = T, ...)

        } else if (ext == "parquet") {

          arrow::write_parquet(x = x, sink = ruta, ...)

        } else if (ext %in% c("gpkg","geojson","kml")) {

          sf::write_sf(x, ruta, ...)

        }
        message("Escritura realizada")

      #}

      # else {
      #
      #   message("Escritura cancelada")
      #
      # }

    }

  } else {

    message("Formato de archivo invalido")

  }

}
