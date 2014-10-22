#' Checks if Package is On CRAN/In Local Library
#' 
#' Checks CRAN to determine if a package exists.
#' 
#' @param package Name of package.
#' @param local logical.  If \code{TRUE} checks user's local library for 
#' existence; if \code{FALSE} \href{http://cran.r-project.org/}{CRAN} for the 
#' package.
#' @keywords exists package
#' @export
#' @examples
#' \dontrun{
#' p_exists(pacman)
#' p_exists(pacman, FALSE)
#' p_exists(I_dont_exist)
#' }
p_exists <-
function (package, local = FALSE) {

    ## check if package is an object
    if(!object_check(package) || !is.character(package)){
        package <- as.character(substitute(package))
    }
    p_egg(package)

    if (!local){
        available_packages <- rownames(available.packages())
        package %in% available_packages
    } else {
        local_packages <- list.files(.libPaths())
        package %in% local_packages
    }
}

	
	