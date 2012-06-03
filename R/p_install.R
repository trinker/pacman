#' Installs and loads a package provided the package is a CRAN package
#' 
#' Installs a package provided the package is a CRAN package
#' 
#' @aliases p_install p_get
#' @param package name of package
#' @keywords install package
#' @seealso \code{\link[utils]{install.packages}}
#' @export
#' @examples
#' \dontrun{p_install(pacman)}
p_install <-
function(package){
    pack<-as.character(substitute(package))
    install.packages(pack)
    do.call('library', list(pack))
}

#' @export
p_get <- p_install
