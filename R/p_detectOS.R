#' Detects operating system
#' 
#' Attempts to detect the operating system.
#' Returns: "Windows", "Darwin" on mac, or "Linux"
#' 
#' @export
p_detectOS <- function(){
    Sys.info()[["sysname"]]
}