#' List all the packages in a base install
#' 
#' List all the packages in a base install
#' 
#' @param open logical. If TRUE opens the directory of the base install packages
#' @note Packages that are installed when R starts are marked with an asterisk(*)
#' @seealso \code{\link[base]{getOption}}
#' @keywords base package
#' @export
#' @examples
#' \dontrun{
#' p_base()
#' p_base(TRUE)
#' }
p_base <- 
function(open = FALSE){
    add_asterisks <- function(x) paste(x, "***")
    
    basepath <- paste0(Sys.getenv("R_HOME"), "/library")
    
    basefiles <- dir(basepath) 
    basepackages <- c(getOption("defaultPackages"), "base")
    modified_output <- ifelse(basefiles %in% basepackages,
                              add_asterisks(basefiles),
                              basefiles)
    if (open) { 
        p_opendir(basepath)
    }
    cat('\npackages with an "***" are loaded when R starts\n\n')
    print(noquote(modified_output))
    invisible(basefiles)
}
