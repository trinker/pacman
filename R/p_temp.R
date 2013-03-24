#' Install a package temporarily
#' 
#' Installs and loads a package for the current session.
#' The package won't be available in future sessions and will
#' eventually be deleted from the machine with no additional
#' effort needed by the user.  This will also install the necessary
#' dependencies temporarily as well.
#' 
#' @param package - The package we want to install temporarily
#' @param character.only Logical - Is the input a character string?
#' 
#' @export
#' 
p_temp <- function(package, character.only = FALSE){
    if(!character.only){
        package <- as.character(substitute(package))
    }
    
    # Get a temporary directory to install into
    # the logic being that this will be wiped eventually
    temppath <- tempdir()
    currentLibPaths <- .libPaths()
    # Add the temp path to libPaths so that it can be loaded...
    .libPaths(c(currentLibPaths, temppath))
    # Install into the temppath
    p_install(package, character.only = TRUE, lib = temppath)
    # load the package
    require(package, character.only = TRUE)

}