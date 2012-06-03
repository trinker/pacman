#' Generate citation for a package
#' 
#' Generate citation for a package
#' 
#' @rdname p_citation
#' @param package Name of the package you want a citation for
#' @seealso \code{\link[utils]{citation}}
#' @keywords citation cite
#' @export
#' @examples
#' p_citation()
#' p_cite(pacman)
#' p_citation(pacman)
p_citation <-
function(package = "r") {
    x <- as.character(substitute(package))
    
    if(x %in% c("R", "r")){
        # To cite R we need to use package = "base"
        x <- "base"
    }
    
    citation(package = x, lib.loc = NULL, auto = NULL)
}

#' @rdname p_citation
#' @export
p_cite <- p_citation
