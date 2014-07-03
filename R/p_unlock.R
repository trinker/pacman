#' Delete 00LOCK Directory
#' 
#' Deletes the 00LOCK directory accidentally left behind by a fail in 
#' \code{\link[utils]{install.packages}}.
#' 
#' @param lib.loc Path to library location.
#' @keywords lock
#' @details Sometimes \code{\link[utils]{install.packages}} can "fail so badly 
#' that the lock directory is not removed: this inhibits any further installs to 
#' the library directory (or for --pkglock, of the package) until the lock 
#' directory is removed manually."  \code{p_unlock} deletes the directory 
#' 00LOCK that is left behind.
#' @return Attempts to delete a 00LOCK(s) if it exists.  Returns logical 
#' \code{TRUE} if a 00LOCK existed and \code{FALSE} if not.
#' @export
#' @seealso \code{\link[utils]{install.packages}}
#' @examples
#' \dontrun{
#' p_unlock()
#' }
p_unlock <- function(lib.loc = p_path()) {
    lib.content <- dir(lib.loc)
    violator <- lib.content[grepl("00LOCK", lib.content)]
    if (identical(violator, character(0))) {
        message(paste("\nNo 00LOCK detected in:\n", eval(lib.loc)))
    } else {
        path <- file.path(lib.loc, violator)
        unlink(path, recursive = TRUE, force = FALSE)
        message(paste("The following 00LOCK has been deleted:\n", path))
    }

    ## return TRUE if a lock(s) exists; FALSE if not
    if (length(violator) == 0 && identical(violator, character(0))) {
        return(invisible(FALSE))
    } else {
        return(invisible(TRUE))
    }
}
