#' Load One or More Packages 
#'
#' This function is a wrapper for \code{\link[base]{library}}, 
#' \code{\link[base]{require}}, and \code{p_install}.  It checks to see if a 
#' package is installed, if not it attempts to install the package from CRAN 
#' and/or any other repository in the pacman repository list. \code{p_load} also
#' attempts to install and load packages from source (.tar.gz/.zip) or from a
#' \href{https://github.com/}{GitHub} repository.
#' 
#' @param \ldots name(s) of package(s).
#' @param char Character vector containing packages to load.  If you are calling
#' \code{p_load} from within a function (or just having difficulties calling it 
#' using a character vector input) then pass your character vector of packages 
#' to load to this parameter directly.
#' @param install logical.  If \code{TRUE} will attempt to install a package not 
#' found in the library.
#' @param update logical.  If \code{TRUE} will attempt to update all out of date 
#' packages.  Default allows the user to set a \code{"pac_update"} in his/her 
#' .Rprofile.
#' @param character.only logical. If \code{TRUE} then \code{p_load} will only 
#' accept a single input which is a character vector containing the names of 
#' packages to load.
#' @param quick if \code{TRUE} skips docs, multiple-architectures,
#' demos, and vignettes, to make installation as fast as possible.
#' @param build_vignettes if \code{TRUE}, will build vignettes. Normally it is
#' \code{build} that's responsible for creating vignettes; this argument makes
#' sure vignettes are built even if a build never happens (i.e. because 
#' \code{local = TRUE}.
#' @references Helper function \code{github_parse_path} taken from devtools: 
#' \url{https://github.com/hadley/devtools/blob/master/R/install-github.r}.
#' @seealso 
#' \code{\link[base]{library}},
#' \code{\link[base]{require}},
#' \code{\link[utils]{install.packages}},
#' \code{\link[devtools]{install_github}}
#' @export
#' @examples
#' \dontrun{
#' p_load(lattice)
#' p_unload(lattice)
#' p_load(lattice, foreign, boot, rpart)
#' p_loaded()
#' p_unload(lattice, foreign, boot, rpart)
#' p_loaded()
#' 
#' ## From GitHub
#' p_load(Dasonk/findPackage)
#' }
p_load <- function (..., char, install = TRUE, update = getOption("pac_update"), 
	quick = FALSE, build_vignettes = !quick, character.only = FALSE){ 

    if(!missing(char)){
        packages <- char
    }else if(character.only){
        packages <- eval(match.call()[[2]])
    }else{
        packages <- as.character(match.call(expand.dots = FALSE)[[2]])
    }
    
    
    if(length(packages) == 0){
        invisible()
    }
    
    # Update all packages
    if (is.null(update)) {
    	update <- FALSE
    }
    if (update){
        p_update()
    }
    
    # Attempt to load packages making note of which don't load
    out <- sapply(packages, p_load_single, install = install, quick = quick, 
        build_vignettes = build_vignettes, USE.NAMES = FALSE)

    # Attempt to load packages making note of which don't load
    loaded <- sapply(names(out)[out], require, character.only = TRUE)

    # Give a warning if some packags couldn't be installed/loaded
    if(!all(out)){
        warning("\n\nFailed to install the following:\n", 
            paste(names(out)[!out], collapse=", "))
    }
    if(!all(loaded)){
        warning("\n\nFailed to load the following:\n", 
            paste(names(loaded)[!loaded], collapse=", "))
    }
    if(any(loaded)){
        message("\n\npacman loaded the following:\n", 
            paste(names(loaded)[loaded], collapse=", "))
    }
	return(invisible(
        list(notinstall=names(out)[!out], 
        notloaded=names(loaded)[!loaded], 
        loaded=names(loaded)[loaded]
     )))    
}
