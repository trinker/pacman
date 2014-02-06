#' Package Version
#' 
#' Determine what version a package is in your library.
#' 
#' @rdname p_version
#' @param package Name of package (default returns R version).
#' @seealso  \code{\link[utils]{packageDescription}}
#' @keywords package version
#' @export
#' @examples
#' \dontrun{
#' p_ver()
#' p_version()
#' p_ver(pacman)
#' p_version(pacman)
#' }
p_version <-
function(package="R") {
    x <- as.character(substitute(package))
    if (x %in% c("r", "R")){
        R.Version()[["version.string"]]
    } else {
        packageDescription(x)["Version"]
    }
}

#' @rdname p_version
#' @export
p_ver <- p_version
