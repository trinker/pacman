#' Checks CRAN to determine if a package exists
#' 
#' Checks CRAN to determine if a package exists
#' 
#' @param package name of package
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
    x <- as.character(substitute(package))
    if (cran){
        a <- available.packages()
        b <- rownames(a)
        x %in% b
    } else {
        x %in% list.files(.libPaths())
    }
}
