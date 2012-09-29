#' Installs and loads a package provided the package is a CRAN package
#' 
#' Installs a package provided the package is a CRAN package
#' 
#' @rdname p_install
#' @param package Name of package(s)
#' @param character.only Logical indicating if input is a character string
#' @keywords install package
#' @seealso \code{\link[utils]{install.packages}}
#' @export
#' @examples
#' \dontrun{p_install(pacman)}
p_install <-
function(package, character.only = FALSE){
    if(!character.only){
        package <- as.character(substitute(package))
    }
    install.packages(package)
}

#' @rdname p_install
#' @export
p_get <- p_install