#' Detects Operating System
#' 
#' Attempts to detect the operating system.
#' Returns: "Windows", "Darwin" on Mac, or "Linux"
#' 
#' @export
p_detectOS <- function(){
    Sys.info()[["sysname"]]
}