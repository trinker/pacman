#' Detects Operating System
#' 
#' Attempts to detect the operating system.
#' Returns: "Windows", "Darwin" on Mac, "Linux", or "SunOS" on Solaris
#' 
#' @export
p_detectOS <- function(){
    Sys.info()[["sysname"]]
}