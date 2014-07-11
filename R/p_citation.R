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
p_citation <- function(package = "r", copy2clip = interactive(), 
    tex = getOption("pac_tex"), ...) {

    ## Try to get tex options otherwise default to TRUE
    tex <- ifelse(is.null(tex), TRUE, tex)

    ## check if package is an object
    if(!object_check(package) || !is.character(package)){
        package <- as.character(substitute(package))
    }

    if(package %in% c("R", "r")){
        # To cite R we need to use package = "base"
        package <- "base"
    }

    if(copy2clip){
        ## grab the LaTeX, text, or both versions
        if (is.na(tex)) {
            out <- unlist(sapply(c("Bibtex", "text"), function(x) {
                capture.output(print(citation(package), style = x))
            }))
            
        } else {
            bibtype <- ifelse(tex, "Bibtex", "text")
            out <- capture.output(print(citation(package), style = bibtype))
        }

        ## paste elements together and write to clipboard
        writeToClipboard(paste(out, collapse="\n"))            
    }   
    citation(package = package, ...)
}

#' @rdname p_citation
#' @export
p_cite <- p_citation
