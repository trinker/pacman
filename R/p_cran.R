#' List all available CRAN packages
#' 
#' Generate a vector of all available packages.
#' 
#' @aliases p_cran
#' @param menu logical.  If TRUE allows user to select the package and return that package name
#' @seealso \code{\link[utils]{available.packages}}
#' @keywords CRAN package
#' @export
#' @examples
#' # p_cran()
#' # p_cran(TRUE)
p_cran <-
function(menu=FALSE){
    a <- available.packages()
    b <- rownames(a)  
    if(menu){
    b <- select.list(b, title = "CRAN packages")
    }
    return(b)          
}
