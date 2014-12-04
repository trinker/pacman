#' Load One or More Packages 
#'
#' This function is a wrapper for \code{\link[base]{library}} and 
#' \code{\link[base]{require}}.  It checks to see if a 
#' package is installed, if not it attempts to install the package from CRAN 
#' and/or any other repository in the \pkg{pacman} repository list.
#' 
#' @param \ldots name(s) of package(s).
#' @param char Character vector containing packages to load.  If you are calling
#' \code{p_load} from within a function (or just having difficulties calling it 
#' using a character vector input) then pass your character vector of packages 
#' to load to this parameter directly.
#' @param install logical.  If \code{TRUE} will attempt to install a package not 
#' found in the library.
#' @param update logical.  If \code{TRUE} will attempt to update all out of date 
#' packages.  Default allows the user to set a \code{"pac_update"} in his/her 
#' .Rprofile.
#' @param character.only logical. If \code{TRUE} then \code{p_load} will only 
#' accept a single input which is a character vector containing the names of 
#' packages to load.
#' @seealso 
#' \code{\link[base]{library}},
#' \code{\link[base]{require}},
#' \code{\link[utils]{install.packages}}
#' @export
#' @examples
#' \dontrun{
#' p_load(lattice)
#' p_unload(lattice)
#' p_load(lattice, foreign, boot, rpart)
#' p_loaded()
#' p_unload(lattice, foreign, boot, rpart)
#' p_loaded()
#' }
p_load <- function (..., char, install = TRUE, update = getOption("pac_update"), 
	character.only = FALSE){ 

    if(!missing(char)){
        packages <- char
    }else if(character.only){
        packages <- eval(match.call()[[2]])
    }else{
        packages <- as.character(match.call(expand.dots = FALSE)[[2]])
    }
    
    
    if(length(packages) == 0){
        return(invisible())
    }
    
    # Update all packages
    if (is.null(update)) {
    	update <- FALSE
    }
    if (update){
        p_update()
    }
    
    # Attempt to load packages making note of which don't load
    loaded <- sapply(packages, p_load_single, install = install)
    # Give a warning if some packags couldn't be installed/loaded
    if(!all(loaded)){
        failed <- packages[!loaded]
        # TODO: We should make this more descriptive
        # Could it not load - or could it not install?
        warning("Failed to install/load:\n", paste(failed, collapse=", "))
    }
    
    return(invisible(loaded))
}
