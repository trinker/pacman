#' Checks if Package is Installed
#' 
#' Check if package is installed locally.
#' 
#' @param ... Name of package you want to check.  This can be quoted or unquoted.
#' @keywords installed package
#' @export
#' @examples
#' \dontrun{
#' p_installed(pacman)
#' p_installed(fakePackage)
#' }
p_isinstalled <- function(...) {
	p_exists(..., cran = FALSE) 
}