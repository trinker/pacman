#' Load one or more packages 
#'
#' This function is a wrapper for library and require.
#' It checks to see if a package is installed, if not 
#' it attempts to install the package from CRAN and/or
#' any other repository in the pacman repository list.
#' 
#' @param \ldots name(s) of package(s)
#' @param install logical.  If TRUE will attempt to install a package not found 
#' in the library
#' @param update logical.  If TRUE will attempt to update all out of date 
#' packages.  Default allows the user to set a \code{"pac_update"} in their 
#' .Rprofile
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
p_load <- function (..., install = TRUE, update = getOption("pac_update")){ 
    packages <- as.character(match.call(expand.dots = FALSE)[[2]])
    if(length(packages) == 0){
        invisible()
    }
    
    # Update all packages
    if (is.null(update)) {
    	update <- FALSE
    }
    if (update){
        p_update()
    }
    
    # Attempt to load packages making note of which don't load
    loaded <- sapply(packages, p_load_single)
    # Give a warning if some packags couldn't be installed/loaded
    if(!all(loaded)){
        failed <- packages[!loaded]
        warning("Failed to install/load:\n", paste(failed, collapse=", "))
    }
    
    return(invisible(loaded))
}
