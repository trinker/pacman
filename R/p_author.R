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
    if(!object_check(package)){
        package<- as.character(substitute(package))
    }
    packageDescription(package)[["Author"]]
}