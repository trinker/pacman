#' CRAN Packages
#' 
#' \code{p_cran} - Generate a vector of all available packages.
#' 
#' @param menu logical.  If \code{TRUE} allows user to select the package and 
#' return that package name.
#' @seealso \code{\link[utils]{available.packages}}
#' @keywords CRAN package
#' @export
#' @rdname p_cran
#' @examples
#' \dontrun{
#' p_cran()
#' p_cran(TRUE)
#' p_iscran(pacman)
#' }
p_cran <-
function(menu = FALSE){
    a <- utils::available.packages()
    b <- rownames(a)  
    if(menu){
        b <- select.list(b, title = "CRAN packages")
    }
    
    return(b)          
}

#' CRAN Packages
#' 
#' \code{p_iscran} - Logical check if a package is available on CRAN.
#' 
#' @param package Name of package.
#' @export
#' @rdname p_cran
p_iscran <- function(package) {

    if (!object_check(package) || !is.character(package)) {
        package <- as.character(substitute(package))
    }
    available_packages <- rownames(available.packages())
    package %in% available_packages
}
