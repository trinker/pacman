#' Script Header: Ensure \pkg{pacman} is Installed
#' 
#' Generate a string for the standard \pkg{pacman} script header that, when
#' added to scripts, will ensure \pkg{pacman} is installed before attempting to 
#' use it.  \pkg{pacman} will attempt to copy this string (standard script 
#' header) to the clipboard for easy cut and paste.  
#' 
#' @details The script header takes the form of: 
#'
#'  \code{if (!require("pacman")) install.packages("pacman"); library(pacman)}
#' 
#' This can be copied to the top of scripts to make it easy to run scripts if 
#' the user shares them with others or to aid in long term script management.  
#' This may also be useful for blog posts and \pkg{R} help sites like 
#' \href{http://www.talkstats.com/}{TalkStats} or 
#' \href{http://stackoverflow.com/questions/tagged/r}{StackOverflow}.  In this 
#' way functions like \code{p_load} can be used without fear that others don't 
#' have \pkg{pacman} installed.
#' @param load logical.  If \code{TRUE} \code{; library(pacman)} is added to the 
#' end of the script header.
#' @param copy2clip logical.  If \code{TRUE} attempts to copy the output to the 
#' clipboard.
#' @return Returns a script header string (optionally copies to the clipboard).
#' @keywords header
#' @export
#' @examples
#' p_boot()
p_boot <- function(load = TRUE, copy2clip = interactive()) {
    
    out <- sprintf("if (!require(\"pacman\")) install.packages(\"pacman\")%s", 
        ifelse(isTRUE(load), "; library(pacman)", ""))

    if(copy2clip){
        writeToClipboard(paste(out, collapse="\n"))            
    } 
    message(out)
    return(invisible(out))
}
