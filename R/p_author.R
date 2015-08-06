#' Package Author
#' 
#' Returns the author of a package.
#' 
#' @param package Name of the package you want the author of.
#' @seealso \code{\link[utils]{packageDescription}}
#' @keywords author package
#' @export
#' @examples
#' p_author(pacman)
#' p_author()
p_author <- 
function (package = "base") {
    ## check if package is an object
    if(!object_check(package) || !is.character(package)){
        package <- as.character(substitute(package))
    }
    if(!p_isinstalled(package)){
        warning(package, " is not installed or does not exist.\nCan not return author info.")
        return(invisible(NULL))
    }
    utils::packageDescription(package)[["Author"]]
}
