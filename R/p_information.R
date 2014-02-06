#' Package Information
#'
#' Provides the information from for a package from 
#' the \emph{NAMESPACE}.  Information may include: title, 
#' version, author, maintainer, description, depends, 
#' imports, suggests
#' 
#' @rdname p_information
#' @param package Name of the package to grab information for.  Default is 
#' \code{"base"}.
#' @keywords packageDescription info information package
#' @seealso \code{\link[utils]{packageDescription}}
#' @export
#' @examples
#' p_information()
#' p_info()
#' p_info(pacman)
p_information <-
function(package = "base") {
    x <- as.character(substitute(package))
    if(identical(x, character(0))){
        x <- "base"
    }
    packageDescription(x)
}

#' @rdname p_information
#' @export
p_info <- p_information
