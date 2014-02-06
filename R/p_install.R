#' Installs & Loads Packages 
#' 
#' Installs a package provided the package is a CRAN package.
#' 
#' @rdname p_install
#' @param package Name of package(s).
#' @param character.only logical.  If \code{TRUE} \code{\dots} is treated a 
#' character string.
#' @param \ldots Additional parameters to pass to \code{install.packages}.
#' @keywords install package
#' @seealso \code{\link[utils]{install.packages}}
#' @export
#' @examples
#' \dontrun{p_install(pacman)}
p_install <-
function(package, character.only = FALSE, ...){
    p_set_cranrepo()
    
    if(!character.only){
        package <- as.character(substitute(package))
    }
    install.packages(package, ...)
}

#' @rdname p_install
#' @export
p_get <- p_install