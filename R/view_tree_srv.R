#' Diagrama de carpetas y archivos del server:
#' @description
#' Devuelve un gráfico interactivo con los directorios y archivos en /srv/DataDNMYE/. El último nodo contiene la ruta completa de la carpeta o archivo para poder copiar y pegar.
#'
#'@export
#'

view_tree_srv <- function() {

  ruta <- RCurl::getURL(url = paste0("sftp://",Sys.getenv("SRV_USER"),
                             "@172.26.7.12/DataDNMYE/tree.csv"),
                userpwd = paste0(Sys.getenv("SRV_USER"),":", Sys.getenv("SRV_CLAVE")),
                dirlistonly = FALSE, .encoding = "UTF-8")

  tree <- readr::read_delim(ruta, delim = "/")[,2]

  names(tree) <- "A"

  tree <- tree[order(tree$A), ]

  n <- max(stringr::str_count(tree$A, "/")) + 1

  tree <- tidyr::separate(data = tree, col = "A", sep = "/", into = as.character(c(1:n)), fill = "right")

  tree$path <- apply(tree[,], 1, paste, collapse = "/")

  tree$path <- stringr::str_replace_all(tree$path, pattern = "/NA","")

  collapsibleTree::collapsibleTree(tree, colnames(tree),
                                   root = "DataDNMYE",
                                   zoomable = F,
                                   width = 3500, height = 1200,
                                   fontSize = 12)
}
