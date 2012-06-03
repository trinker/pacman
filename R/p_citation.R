#' Generate citation for a package
#' 
#' Generate citation for a package
#' 
#' @aliases p_citation p_cite
#' @param package Name of the package you want a citation for
#' @seealso \code{\link[utils]{citation}}
#' @keywords citation cite
#' @export
#' @examples
#' p_cite(pacman)
#' p_citation(pacman)
p_citation <-
function(package="r") {
    x <- as.character(substitute(package))
    if(x%in%c("R", "r")){
        citation() 
    } else {
        citation(package = x, 
            lib.loc = NULL, auto = NULL)
    }
}

p_cite <- p_citation