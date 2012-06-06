#' List the functions from a package
#' 
#' List the functions from a package
#' 
#' @rdname p_functions
#' @param package Name of the package you want the list of functions for.
#' @param load logical.  If TRUE the package will be loaded.
#' @keywords function package
#' @seealso \code{\link[=base]{object}}
#' @export
#' @examples
#' p_functions()
#' p_funs()
#' p_funs(pacman)
p_functions <- 
function (package = "base", load = FALSE) 
{
    # deparse is a little better/safer than as.character
    package <- as.character(substitute(package))[1]
    
    # Shouldn't have to check for this with deparse
    if (identical(package, character(0))) {
        package <- "base"
    }
    
    if (package %in% (.packages())) {  
        load <- TRUE
    } else {
        
        ## We could replace this with p_load since
        ## p_load installs if it isn't found...
        if (!package %in% list.files(.libPaths())) {
            install.packages(package)
        } else {
            require(package, character.only = TRUE)
        }
    }
    
    ## To get all functions...
    # unclass(lsf.str(envir = asNamespace(package), all = T))
    
    w <- paste0("package:", package)
    packagefunctions <- objects(w)
    if (!load){
        detach(w, unload = TRUE, character.only = TRUE, force = TRUE)
    }
    return(packagefunctions)
}

#' @rdname p_functions
#' @export
p_funs <- p_functions
