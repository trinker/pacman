#' Returns the author of a package
#' 
#' Returns the author of a package
#' 
#' @aliases p_author
#' @param package name of package
#' @seealso \code{\link[utils]{packageDescription}}
#' @keywords author package
#' @export
#' @examples
#' p_author(pacman)
#' p_author()
p_author <-
function(package = "base"){
    x <- as.character(substitute(package))
    packageDescription(x)$Author
}
