#' Determine installed package version
#' 
#' Determine what version a package is in your library
#' 
#' @rdname p_version
#' @param package name of package (default returns R version)
#' @seealso  \code{\link[utils]{packageDescription}}
#' @keywords package version
#' @export
#' @examples
#' p_ver()
#' p_ver(pacman)
#' p_version(pacman)
p_version <-
function(package="R") {
    x <- as.character(substitute(package))
    if (x%in%c("r", "R")){
        R.Version()[["version.string"]]
    } else {
        packageDescription(x)["Version"]
    }
}

#' @rdname p_version
#' @export
p_ver <- p_version
