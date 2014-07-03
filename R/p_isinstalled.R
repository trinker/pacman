#' Checks if Package is Installed
#' 
#' Check if package is installed locally.
#' 
#' @param package Name of package you want to check.  This can be quoted or unquoted.
#' @keywords installed package
#' @export
#' @examples
#' \dontrun{
#' p_installed(pacman)
#' p_installed(fakePackage)
#' }
p_isinstalled <- function(package) {
    ## check if package is an object
    if(!object_check(package)){
        package <- as.character(substitute(package))
    }
    if (is.function(package)) {
        package <- as.character(substitute(package))
    }
    local_packages <- list.files(.libPaths())
    package %in% local_packages
}