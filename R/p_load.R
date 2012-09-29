#' Load one or more packages 
#'
#' This function is a wrapper for library and require.
#' It checks to see if a package is installed, if not 
#' it installs the package(s) and loads it.
#' 
#' @param \ldots name(s) of package(s)
#' @param install logical.  If TRUE will attempt to install a package 
#' not found in the library
#' @param update logical.  If TRUE will attempt to update out of date packages
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
p_load <- function (..., install = TRUE, update = TRUE){ 
    mf <- match.call(expand.dots = FALSE)
    packages <- as.character(mf[[2]])
    if(length(packages) == 0){
        invisible()
    }
    
    # Update all packages
    if (update){
        p_update()
    }
    
    # Attempt to load packages making note of which don't load
    loaded <- sapply(packages, p_load_single)
    if(all(loaded)){
        return(invisible())
    }
    
    failed <- packages[!loaded]
    warning("Failed to install/load:\n", paste(failed, collapse=", "))    
}
