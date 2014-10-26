#' Base Install Packages
#' 
#' List just base packages or list all the packages in the local library and 
#' mark those in a base install.
#' 
#' @param base.only logical.  If \code{TRUE} a character vector of only base 
#' install packages is returned.
#' @param open logical. If \code{TRUE} opens the directory of the base install 
#' packages.
#' @param basemarker Character string.  The string to append to mark which 
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
function(base.only = TRUE, open = FALSE,  basemarker = "***"){
    add_asterisks <- function(x) paste0(x, basemarker)
    
    basepath <- p_basepath()
    
    basefiles <- dir(basepath) 
    basepackages <- c(getOption("defaultPackages"), "base")
    if (base.only) return(basepackages)
    modified_output <- ifelse(basefiles %in% basepackages,
        add_asterisks(basefiles), basefiles)
    if (open) { 
        p_opendir(basepath)
    }
    message('\npackages marked with ', basemarker, ' are loaded when R starts\n\n')
    print(noquote(modified_output))
    invisible(basefiles)
}
