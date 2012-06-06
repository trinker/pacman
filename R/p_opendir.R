#' Attempts to open a directory in a file browser
#' 
#' Attempts to open a directory in a file browser.
#' Opening a directory isn't a platform independent
#' but it is used in more than one function so moving
#' this functionality to its own non-exported function
#' makes sense.
#' 
#' @param dir The directory to be opened
p_opendir <- function(dir){
    if (.Platform['OS.type'] == "windows"){
        shell.exec(lib)
    } else {
        system(paste(Sys.getenv("R_BROWSER"), lib))
    }
}