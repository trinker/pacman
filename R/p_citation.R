#' Generate citation for a package
#' 
#' Generate citation for a package
#' 
#' @rdname p_citation
#' @param package Name of the package you want a citation for
#' @param copy2clip logical.  If \code{TRUE} attempts to copy the output to the 
#' clipboard
#' @param tex logical.  If \code{TRUE} A only the BibTex version of the citation
#' is copied to the clipboard.  If \code{FALSE} The standard citation is copied 
#' to the clipboard.  If \code{NULL} both are copied to the clipboard.
#' @param \ldots Additional inputs to \code{\link[utils]{citation}}
#' @seealso \code{\link[utils]{citation}}
#' @keywords citation cite
#' @export
#' @examples
#' p_citation()
#' p_cite(pacman)
#' p_citation(pacman)
p_citation <- function(package = "r", copy2clip = TRUE, tex = TRUE, ...) {
    x <- as.character(substitute(package))
    
    if(x %in% c("R", "r")){
        # To cite R we need to use package = "base"
        x <- "base"
    }

    if(copy2clip){
        ## Grab citation to optionally manipulate 
        ## and copy to clipboard
        out <- capture.output(citation(package = x, ...))

        if (!is.null(tex)) {
            
            loc <- grep("BibTeX entry for LaTeX", out)

            if (isTRUE(tex)) {  
                ## Grab only the bibtex portion
                locs <- (1 + loc):length(out)
            } else {

                ## Remove the `To cite in publications, please use:` 
                grab <- seq_along(out) != grep("in publications, please use", out)
                out <- out[grab]

                ## Grab only the standard portion
                locs <- 1:(loc - 1)
            }

            out <- out[locs]
            out <- out[out != ""]
            out <- paste(substring(out, 3), collapse="\n")
        }
        writeToClipboard(out)            
    }   
    citation(package = x, ...)
}

#' @rdname p_citation
#' @export
p_cite <- p_citation
