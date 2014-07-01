#' Package Functions
#' 
#' List the functions from a package.
#' 
#' @rdname p_functions
#' @param package Name of the package you want the list of functions for.
#' @param all logical.  If \code{TRUE} all of the functions from the package 
#' will be displayed regardless of whether they're exported or not.
#' @param character.only logical. If \code{TRUE} the input is a variable 
#' containing the package name.
#' @keywords function package
#' @export
#' @examples
#' p_functions()
#' p_funs()
#' p_funs(pacman)
p_functions <- 
function (package = "base", all = FALSE, character.only = FALSE){
    # deparse is a little better/safer than as.character
    # but it messes something up.  I don't remember what though...
    if(!character.only){
        package <- as.character(substitute(package))[1]
    }
    
    # Shouldn't have to check for this with deparse
    if (identical(package, character(0))) {
        package <- "base"
    }
    
    ## Should we mark non-exported functions with asterisks or something?
    if(all){
        packagefunctions <- ls(loadNamespace(package))
    }else{
        packagefunctions <- getNamespaceExports(loadNamespace(package))
    }

    datas <- suppressWarnings(data(package = package)[["results"]][, 3])
    packagefunctions <- packagefunctions[!packagefunctions %in% datas]

    return(packagefunctions)
}

#' @rdname p_functions
#' @export
p_funs <- p_functions
