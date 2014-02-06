#' Base Install Packages
#' 
#' List all the packages and marks those in a base install.
#' 
#' @param open logical. If \code{TRUE} opens the directory of the base install 
#' packages.
#' @param basemarker character string.  The string to append to mark which 
#' packages are part of the default packages.
#' @note Packages that are installed when R starts are marked with an asterisk(*).
#' @seealso \code{\link[base]{getOption}}
#' @keywords base package
#' @export
#' @examples
#' \dontrun{
#' p_base()
#' p_base(TRUE)
#' }
p_base <- 
function(open = FALSE,  basemarker = "***"){
    add_asterisks <- function(x) paste(x, basemarker)
    
    basepath <- p_basepath()
    
    basefiles <- dir(basepath) 
    basepackages <- c(getOption("defaultPackages"), "base")
    modified_output <- ifelse(basefiles %in% basepackages,
                              add_asterisks(basefiles),
                              basefiles)
    if (open) { 
        p_opendir(basepath)
    }
    message('\npackages with an', basemarker, 'are loaded when R starts\n\n')
    print(noquote(modified_output))
    invisible(basefiles)
}
