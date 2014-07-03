#' Checks if Package is On CRAN/In Local Library
#' 
#' Checks CRAN to determine if a package exists.
#' 
#' @param package Name of package.
#' @param cran logical.  If \code{TRUE} checks CRAN for the package; 
#' if \code{FALSE} checks the user's local library.
#' @keywords exists package
#' @export
#' @examples
#' \dontrun{
#' p_exists(pacman)
#' p_exists(pacman, FALSE)
#' p_exists(I_dont_exist)
#' }
p_exists <-
function (package, cran = TRUE) {

    ## check if package is an object
    if(!object_check(package) || !is.character(package)){
        package <- as.character(substitute(package))
    }
    p_egg(package)

    if (cran){
        available_packages <- rownames(available.packages())
        package %in% available_packages
    } else {
        local_packages <- list.files(.libPaths())
        package %in% local_packages
    }
}

	
	