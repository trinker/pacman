#' Checks if Package is Installed
#' 
#' Check if package is installed locally.
#' 
#' @param package Name of package.
#' @keywords installed package
#' @export
#' @examples
#' \dontrun{
#' p_installed(pacman)
#' p_installed(fakePackage)
#' }
p_isinstalled <- function(package) {
	p_exists(package, cran = FALSE) 
}