#' See information on a package.
#'
#' Provides the information from for a package from 
#' the NAMESPACE.  Information may include: title, 
#' version, author, maintainer, description, depends, 
#' imports, suggests
#' 
#' @aliases p_information p_info
#' @param package name of package (defaults to base)
#' @keywords packageDescription info information package
#' @seealso \code{\link[utils]{packageDescription}}
#' @export
#' @examples
#' p_information()
#' p_info()
#' p_info(pacman)
p_information <-
function(package=NULL) {
    x <- as.character(substitute(package))
    if(identical(x, character(0))) x <- "base"
    packageDescription(x)
}

#' @export
p_info <- p_information
