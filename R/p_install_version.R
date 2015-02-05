#' Install Minimal Package Version
#' 
#' Install minimal package version(s).
#' 
#' @param package \code{character} vector of the name of the package(s) you want 
#' to install a particular minimal version of.  
#' @param version Corresponding \code{character} vector of the minimal 
#' package version(s).
#' @keywords version
#' @export
#' @examples
#' p_install_version(
#'     c("pacman", "testthat"), 
#'     c("0.2.0", "0.9.1")
#' )
p_install_version <- function (package, version){ 

    ## Check that package and version are equal in length
    if (length(package) != length(version)) {
        stop("`packages` must be equal in length to `version`")
    }

    # Version check on each of the packages
    status <- Map(p_install_version_single, package, version)
    return(invisible(status))
    
}

