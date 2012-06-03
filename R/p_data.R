#' List all data sets available in a package
#' 
#' Generate a script of all data sets contained in package.
#' 
#' @aliases p_data
#' @param package name of package (default is the base install datasets package)
#' @seealso \code{\link[utils]{data}}
#' @keywords data package
#' @export
#' @examples
#' p_data()
#' p_data(lattice)
p_data <-
function(package = "datasets") {
    data(package = as.character(substitute(package)))
}
