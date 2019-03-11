#' Install Minimal GitHub Package Version
#' 
#' Install minimal GitHub package version(s).
#' 
#' @param package \code{character} vector of the repository address(es) of the 
#' package(s) you want to install a particular minimal version of.  Repository 
#' address(es) in the format \code{username/repo[/subdir][@@ref|#pull]}.  
#' @param version Corresponding \code{character} vector of the minimal 
#' package version(s).
#' @param dependencies logical.  If \code{TRUE} necessary dependencies will be 
#' installed as well.
#' @keywords version
#' @export
#' @examples
#' \dontrun{
#' p_install_version_gh(
#'     c("trinker/pacman", "hadley/testthat"), 
#'     c("0.2.0", "0.9.1")
#' )
#' }
p_install_version_gh <- function (package, version, dependencies = TRUE){ 

    ## Check that package and version are equal in length
    if (length(package) != length(version)) {
        stop("`packages` must be equal in length to `version`")
    }

    # Version check on each of the packages
    status <- Map(p_install_version_single_gh, package, version, dependencies = dependencies)
    return(invisible(status))
    
}

