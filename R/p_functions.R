#' List the functions from a package
#' 
#' List the functions from a package
#' 
#' @rdname p_functions
#' @param package Name of the package you want the list of functions for.
#' @param all logical.  If TRUE all of the functions from the package will
#' be displayed regardless of whether they're exported or not.
#' @param load logical.  If TRUE loads the package.
#' @param character.only logical. If TRUE the input is a variable 
#' containing the package name.
#' @keywords function package
#' @seealso \code{\link[=base]{object}}
#' @export
#' @examples
#' p_functions()
#' p_funs()
#' p_funs(pacman)
p_functions <- 
function (package = "base", all = FALSE, load = FALSE, character.only = FALSE){
    # deparse is a little better/safer than as.character
    # but it messes something up.  I don't remember what though...
    if(!character.only){
        package <- as.character(substitute(package))[1]
    }
    
    # Shouldn't have to check for this with deparse
    if (identical(package, character(0))) {
        package <- "base"
    }
    
    if (package %in% (.packages())) {  
        load <- TRUE
    } else {
        
        ## We could replace this with p_load since
        ## p_load installs if it isn't found...
        
        ##TODO: Find a way to look at functions without loading
        if (!package %in% list.files(.libPaths())) {
            suppressWarnings(suppressPackageStartupMessages(
                install.packages(package)
            ))
        } else {
            suppressWarnings(suppressPackageStartupMessages(
                require(package, character.only = TRUE) 
            ))
        }
    }
    
    w <- paste0("package:", package)
    
    ## Should we mark non-exported functions with asterisks or something?
    if(all){
        packagefunctions <- unclass(lsf.str(envir = asNamespace(package), all = T))
        # Removes pesky attributes.
        attributes(packagefunctions) <- NULL
    }else{
        packagefunctions <- objects(w)        
    }

    datas <- suppressWarnings(data(package = package)[["results"]][, 3])
    packagefunctions <- packagefunctions[!packagefunctions %in% datas]

    # If we didn't want to load then unload the packages
    # we needed to load.
    # TODO: Check if package was already loaded and don't unload those packages
    if (!load){
        detach(w, unload = TRUE, character.only = TRUE, force = TRUE)
    }
    
    return(packagefunctions)
}

#' @rdname p_functions
#' @export
p_funs <- p_functions
