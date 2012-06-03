#' List all the packages in a base install
#' 
#' List all the packages in a base install
#' 
#' @aliases p_base
#' @param open logical. If TRUE opens the directory of the base install packages
#' @note Packages that are installed when R starts are marked with an asterisk(*)
#' @seealso \code{\link[base]{getOption}}
#' @keywords base package
#' @export
#' @examples
#' p_base()
#' p_base(TRUE)
p_base <- 
function(open = FALSE){
    ast <- function(x) paste(x, "***")
    w <- .libPaths()[2]
    x <- dir(w) 
    y <- c(getOption("defaultPackages"), "base")
    z <- ifelse(x %in% y, ast(x), x)
    if (open) { 
        if (.Platform['OS.type']!="windows"){
            system(paste("open", w))
        } else {
            shell.exec(w)
        }
    }
    cat('\npackages with an "***" are loaded when R starts\n\n')
    print(noquote(z))
    invisible(x)
}
