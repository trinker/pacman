#' Generate citation for a package
#' 
#' Generate citation for a package
#' 
#' @rdname p_citation
#' @param package Name of the package you want a citation for
#' @param copy2clip logical.  If TRUE attempts to copy the output to the 
#' clipboard
#' @param \ldots Additional inputs to \code{\link[utils]{citation}}
#' @seealso \code{\link[utils]{citation}}
#' @keywords citation cite
#' @export
#' @examples
#' p_citation()
#' p_cite(pacman)
#' p_citation(pacman)
p_citation <- function(package = "r", copy2clip = TRUE, ...) {
    x <- as.character(substitute(package))
    
    if(x %in% c("R", "r")){
        # To cite R we need to use package = "base"
        x <- "base"
    }
    if(copy2clip){
        out <- capture.output(citation(package = x, ...))
        writeToClipboard(out)            
    }   
    citation(package = x, ...)
}

#' @rdname p_citation
#' @export
p_cite <- p_citation
