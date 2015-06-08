#' Path to Library of Add-On Packages
#' 
#' Path to library of add-on packages.
#' 
#' @param package Name of package (default returns path to library of add-on 
#' packages).
#' @seealso \code{\link[base]{.libPaths}}
#' @keywords package library location path
#' @export
#' @examples
#' p_path()
#' p_path(pacman)
p_path <-
function(package="R"){

    ## check if package is an object
    if(!object_check(package) || !is.character(package)){
        package <- as.character(substitute(package))
    }
    
    if (package == "R"){
        return(.libPaths())
    } else {
        return(find.package(package))
    }
        
}
