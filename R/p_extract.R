#' Convert String With Commas Into Elements
#' 
#' \code{p_extract} is designed to be used in conjunction with 
#' \code{\link[pacman]{p_information}} to convert a single comma separated 
#' string into a vector of package names.
#' 
#' @param x A character string of packages separated by commas; for example
#' the strings returned from \code{\link[pacman]{p_information}}.
#' @param use.names logical.  If \code{TRUE} package names, including version 
#' number, are used.
#' @return Returns a character vector of packages.
#' @export
#' @seealso \code{\link[pacman]{p_information}}
#' @examples
#' p_extract(p_info(ggplot2, "Depends"))
#' p_extract(p_info(ggplot2, "Imports"))
#' lapply(p_info(ggplot2, "Imports", "Depends", "Suggests"), p_extract)
p_extract <- function(x, use.names = TRUE){

    out <- comma_string2vector(x)
    if (use.names) {
        names(out) <- Trim(unlist(strsplit(unlist(x), ",")))
    }
    out

}
