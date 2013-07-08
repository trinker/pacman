#' Delete 00LOCK Directory
#' 
#' Deletes the 00LOCK directory left accidentally left behind by fail in 
#' \code{\link[utils]{install.packages}}
#' 
#' @param lib.loc Peth to library location.
#' @keywords lock
#' @details Sometimes \code{\link[utils]{install.packages}} can "fail so badly 
#' that the lock directory is not removed: this inhibits any further installs to 
#' the library directory (or for --pkglock, of the package) until the lock 
#' directory is removed manually."  \code{p_unlock} deletes the directory 
#' 00LOCK that is left behind.
#' @export
#' @seealso \code{\link[utils]{install.packages}}
#' @examples
#' \dontrun{
#' p_unlock()
#' }
p_unlock <- function(lib.loc = p_path()) {
    path <- file.path(lib.loc, "00LOCK")
    if (!file.exists(path)) {
        stop(paste("The following 00LOCK does not exist:\n", path))
    }
    unlink(path, recursive = TRUE, force = FALSE)
    message(paste("The following 00LOCK has been deleted:\n", path))
}