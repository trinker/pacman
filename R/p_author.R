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
    utils::packageDescription(package)[["Author"]]
}
