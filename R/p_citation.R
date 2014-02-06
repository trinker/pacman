#' Package Citation
#' 
#' Generate citation for a package.
#' 
#' @rdname p_citation
#' @param package Name of the package you want a citation for.
#' @param copy2clip logical.  If \code{TRUE} attempts to copy the output to the 
#' clipboard.
#' @param tex logical.  If \code{TRUE} A only the BibTex version of the citation
#' is copied to the clipboard.  If \code{FALSE} The standard citation is copied 
#' to the clipboard.  If \code{NA} both are copied to the clipboard.  Default 
#' allows the user to set a \code{"pac_tex"} in his/her .Rprofile.
#' @param \ldots Additional inputs to \code{\link[utils]{citation}}
#' @seealso \code{\link[utils]{citation}}
#' @keywords citation cite
#' @export
#' @examples
#' \dontrun{
#' p_citation()
#' p_cite(pacman)
#' p_citation(pacman, tex = FALSE)
#' p_citation(tex = FALSE)
#' p_cite(knitr)
#' }
p_citation <- function(package = "r", copy2clip = TRUE, 
    tex = getOption("pac_tex"), ...) {

    ## Try to get tex options otherwise default to TRUE
    tex <- ifelse(is.null(tex), TRUE, tex)
    x <- as.character(substitute(package))
    
    if(x %in% c("R", "r")){
        # To cite R we need to use package = "base"
        x <- "base"
    }

    ## Default variable set to FALSE.  
    ## IF not bibtex entry goes to FALSE
    nobib <- FALSE

    if(copy2clip){

        ## Grab citation to optionally manipulate 
        ## and copy to clipboard
        out <- capture.output(citation(package = x, ...))

        ## check for BiBTex Entry
        loc <- grep("BibTeX entry for LaTeX", out)
        if (identical(loc, integer(0))) {
            if (isTRUE(tex)) warning("No BibTex entry found")
            tex <- FALSE
            loc <- length(out)
            nobib <- TRUE
        } else {
            ## Remove stuff after last closed curly brace
            out <- out[1:tail(which(grepl("}", out)), 1)]
        }

        if (!is.na(tex)) {

            if (isTRUE(tex)) {  
                ## Grab only the bibtex portion
                locs <- (1 + loc):length(out)
            } else {

                ## Remove the `To cite in publications, please use:` 
                grab <- seq_along(out) != grep("To cite|in publications", out)
                out <- out[grab]
                
                if (!nobib) {
                    ## Grab only the standard portion
                    loc <- grep("BibTeX entry for LaTeX", out) 
                }
                locs <- 1:(loc - 1)
            }

            out <- out[locs]

            ## Remove blanks ("") at the begining and end of the vector
            nonblanks <- which(out != "")
            out <- out[head(nonblanks, 1): tail(nonblanks, 1)]
            out <- paste(substring(out, 3), collapse="\n")
        }
        writeToClipboard(out)            
    }   
    citation(package = x, ...)
}

#' @rdname p_citation
#' @export
p_cite <- p_citation
