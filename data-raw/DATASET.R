## code to prepare `DATASET` dataset goes here


numeros_df <- tibble::tibble(digito = c(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11,
                                        12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27,
                                        28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43,
                                        44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59,
                                        60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75,
                                        76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91,
                                        92, 93, 94, 95, 96, 97, 98, 99, 100),
                             nombre = c("cero", "uno",
                                        "dos", "tres", "cuatro", "cinco", "seis", "siete", "ocho", "nueve",
                                        "diez", "once", "doce", "trece", "catorce", "quince", "dieciseis",
                                        "diecisiete", "dieciocho", "diecinueve", "veinte", "veintiuno",
                                        "veintidos", "veintitres", "veinticuatro", "veinticinco", "veintiseis",
                                        "veintisiete", "veintiocho", "veintinueve", "treinta", "treinta y uno",
                                        "treinta y dos", "treinta y tres", "treinta y cuatro", "treinta y cinco",
                                        "treinta y seis", "treinta y siete", "treinta y ocho", "treinta y nueve",
                                        "cuarenta", "cuarenta y uno", "cuarenta y dos", "cuarenta y tres",
                                        "cuarenta y cuatro", "cuarenta y cinco", "cuarenta y seis", "cuarenta y siete",
                                        "cuarenta y ocho", "cuarenta y nueve", "cincuenta", "cincuenta y uno",
                                        "cincuenta y dos", "cincuenta y tres", "cincuenta y cuatro",
                                        "cincuenta y cinco", "cincuenta y seis", "cincuenta y siete",
                                        "cincuenta y ocho", "cincuenta y nueve", "sesenta", "sesenta y uno",
                                        "sesenta y dos", "sesenta y tres", "sesenta y cuatro", "sesenta y cinco",
                                        "sesenta y seis", "sesenta y siete", "sesenta y ocho", "sesenta y nueve",
                                        "setenta", "setenta y uno", "setenta y dos", "setenta y tres",
                                        "setenta y cuatro", "setenta y cinco", "setenta y seis", "setenta y siete",
                                        "setenta y ocho", "setenta y nueve", "ochenta", "ochenta y uno",
                                        "ochenta y dos", "ochenta y tres", "ochenta y cuatro", "ochenta y cinco",
                                        "ochenta y seis", "ochenta y siete", "ochenta y ocho", "ochenta y nueve",
                                        "noventa", "noventa y uno", "noventa y dos", "noventa y tres",
                                        "noventa y cuatro", "noventa y cinco", "noventa y seis", "noventa y siete",
                                        "noventa y ocho", "noventa y nueve", "cien"))

provincias_df <- tibble::tibble(provincia_nombre = c("Ciudad Autónoma de Buenos Aires","Buenos Aires","Catamarca","Córdoba",
                                                  "Corrientes","Chaco","Chubut","Entre Ríos","Formosa","Jujuy","La Pampa",
                                                  "La Rioja","Mendoza","Misiones","Neuquén","Río Negro","Salta","San Juan",
                                                  "San Luis","Santa Cruz","Santa Fe","Santiago del Estero","Tucumán",
                                                  "Tierra del Fuego, Antártida e Islas del Atlántico Sur"),
                             provincia_codigo = c("02","06","10","14","18","22","26","30","34","38","42","46","50",
                                                  "54","58","62","66","70","74","78","82","86","90","94"))

usethis::use_data(acentos_df, numeros_df, provincias_df, overwrite = TRUE, internal = T)
