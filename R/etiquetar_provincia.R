#' Etiquetado de variable provincias:
#' @description
#' Genera una columna con el nombre oficial de la provincia y otra columna, denominada "provincia_codigo", con su código numérico INDEC (dos posiciones)
#'
#' @param base Dataframe con una variable que refiere a las provincias
#'
#' @param id_col Columna con el nombre de la provincia o su código INDEC
#'
#' @param new_name Define el nuevo nombre de la columna con las etiquetas de provincia. Por default es "provincia_nombre"
#'
#' @param add_codes Indica si se desea agregar la columna con el código de la provincia. Por default es TRUE
#'
#'@export

etiquetar_provincia <- function(base, id_col, new_name = "provincia_nombre", add_codes = T) {


  type <- stringr::str_detect(paste(utils::head(dplyr::pull(base, {{id_col}}), 5), collapse = ""), "[[:digit:]]")

    if (type == F) {

      base <- dplyr::mutate(base, "function_var_chequeo_prov" = limpiar_texto({{id_col}}))

      base <- dplyr::mutate(base, fixed_function_var_prov =
                              dplyr::case_when(
                                stringr::str_detect(function_var_chequeo_prov, "caba|ciudad|autonoma|federal|capital") ~ "Ciudad Autónoma de Buenos Aires",
                                stringr::str_detect(function_var_chequeo_prov, "buenos aires|bs") ~ "Buenos Aires",
                                stringr::str_detect(function_var_chequeo_prov, "catamarca") ~ "Catamarca",
                                stringr::str_detect(function_var_chequeo_prov, "cordoba") ~ "Córdoba",
                                stringr::str_detect(function_var_chequeo_prov, "corrientes") ~ "Corrientes",
                                stringr::str_detect(function_var_chequeo_prov, "chaco") ~ "Chaco",
                                stringr::str_detect(function_var_chequeo_prov, "chubut") ~ "Chubut",
                                stringr::str_detect(function_var_chequeo_prov, "entre rios") ~ "Entre Ríos",
                                stringr::str_detect(function_var_chequeo_prov, "formosa") ~ "Formosa",
                                stringr::str_detect(function_var_chequeo_prov, "jujuy") ~ "Jujuy",
                                stringr::str_detect(function_var_chequeo_prov, "la pampa") ~ "La Pampa",
                                stringr::str_detect(function_var_chequeo_prov, "la rioja") ~ "La Rioja",
                                stringr::str_detect(function_var_chequeo_prov, "mendoza") ~ "Mendoza",
                                stringr::str_detect(function_var_chequeo_prov, "misiones") ~ "Misiones",
                                stringr::str_detect(function_var_chequeo_prov, "neuquen") ~ "Neuquén",
                                stringr::str_detect(function_var_chequeo_prov, "rio negro") ~ "Río Negro",
                                stringr::str_detect(function_var_chequeo_prov, "salta") ~ "Salta",
                                stringr::str_detect(function_var_chequeo_prov, "san juan") ~ "San Juan",
                                stringr::str_detect(function_var_chequeo_prov, "san luis") ~ "San Luis",
                                stringr::str_detect(function_var_chequeo_prov, "santa cruz") ~ "Santa Cruz",
                                stringr::str_detect(function_var_chequeo_prov, "santa fe") ~ "Santa Fe",
                                stringr::str_detect(function_var_chequeo_prov, "santiago del estero") ~ "Santiago del Estero",
                                stringr::str_detect(function_var_chequeo_prov, "tucuman") ~ "Tucumán",
                                stringr::str_detect(function_var_chequeo_prov, "fuego") ~ "Tierra del Fuego, Antártida e Islas del Atlántico Sur",
                                TRUE ~ NA_character_))

      base <- dplyr::select(base, -c("function_var_chequeo_prov"))


      if (add_codes == T) {

      vector <- stats::setNames("provincia_nombre", as.character(substitute(fixed_function_var_prov)))

      base <- dplyr::left_join(base, provincias_df, by = vector)

      base <- dplyr::rename_with(base, .cols = fixed_function_var_prov, .fn = ~ as.character(sym(new_name)))

      } else {
        base
      }

    } else {

      vector <- stats::setNames("provincia_codigo", as.character(substitute(id_col)))

      base <- dplyr::left_join(base, provincias_df, by = vector)

      base <- dplyr::rename_with(base, .cols = provincia_nombre, .fn = ~ as.character(sym(new_name)))
    }
}
