#' Attempts to open a directory in a file browser
#' 
#' Attempts to open a directory in a file browser.
#' Opening a directory isn't a platform independent
#' but it is used in more than one function so moving
#' this functionality to its own non-exported function
#' makes sense.
#' 
#' @param dir A character string representing the path
#' (either relative or absolute) to the directory to be opened.
#' Defaults to the working directory.
#' @section Note: Most likely this function will move to a different
#' package at some point as it's not specifically package related.
#' @export
#' @examples
#' \dontrun{
#' p_opendir() # opens working directory
#' p_opendir(path.expand("~")) # opens home directory
#' p_opendir(pacman:::p_basepath())
#' }
p_opendir <- function(dir = getwd()){
    if (.Platform['OS.type'] == "windows"){
        shell.exec(dir)
    } else {
        system(paste(Sys.getenv("R_BROWSER"), dir))
    }
}
