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

    if (!character.only & is.name(substitute(package))) {
        package <- deparse(substitute(package))
    }
    
    
    # Shouldn't have to check for this with deparse
    # Guess it can't hurt though...
    if (identical(package, character(0))) {
        package <- "base"
    }
    
    ## We should probably do some error checking 
    ## TODO: Add some error checking and display custom
    ##       message if user asks for a package that
    ##       doesn't exist
    ns <- loadNamespace(package)
    
    ## Should we mark non-exported functions with asterisks or something?
    if(all){
        packagefunctions <- ls(ns)
    }else{
        packagefunctions <- getNamespaceExports(ns)
    }

    datas <- suppressWarnings(utils::data(package = package)[["results"]][, 3])
    packagefunctions <- packagefunctions[!packagefunctions %in% datas]

    return(sort(packagefunctions))
}

#' @rdname p_functions
#' @export
p_funs <- p_functions
