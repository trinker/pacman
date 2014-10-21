#' Package Dependencies
#' 
#' \code{p_depends} - Get \href{http://cran.r-project.org/}{CRAN} or local 
#' package dependencies.
#' 
#' @param package Name of the package you want the list of dependencies/reverse 
#' dependencies for.
#' @param local logical.  If \code{TRUE} uses only packages found in local 
#' library.
#' @param character.only logical. If \code{TRUE} the input is a variable 
#' containing the package name.
#' @param \ldots other arguments passed to 
#' \code{\link[tools]{package_dependencies}} and 
#' \code{\link[tools]{dependsOnPkgs}}.
#' @return Returns a list of dependencies/reverse dependencies.
#' @keywords dependency dpendencies
#' @export
#' @rdname p_depends
#' @seealso \code{\link[pacman]{p_info}},
#' \code{\link[tools]{package_dependencies}},
#' \code{\link[tools]{dependsOnPkgs}}
#' @examples
#' p_depends(lattice)
#' p_depends_reverse(lattice)
#' 
#' \dontrun{
#' ## dependencies from CRAN
#' p_depends(pacman)
#' p_depends_reverse("pacman")
#' 
#' ## local dependencies 
#' p_depends(pacman, local = TRUE)
#' p_depends_reverse("qdap", local = TRUE)
#' }
p_depends <- function(package, local = FALSE, character.only = FALSE, ...) {
    if (!character.only & is.name(substitute(package))) {
        package <- deparse(substitute(package))
    }
    if (identical(package, character(0))) {
        package <- "base"
    }

    p_depends_helper(package, local = local, ...)
}


#' Package Dependencies
#' 
#' \code{p_depends_reverse} - Get \href{http://cran.r-project.org/}{CRAN} or 
#' local reverse dependencies.
#' 
#' @export
#' @rdname p_depends
p_depends_reverse <- function(package, local = FALSE, 
	character.only = FALSE, ...) {
	
    if (!character.only & is.name(substitute(package))) {
        package <- deparse(substitute(package))
    }
    if (identical(package, character(0))) {
        package <- "base"
    }

    p_depends_helper(package, local = local, reverse = TRUE, ...)
}


p_depends_helper <- function(package, local = local, reverse = FALSE, ...){

    type <- c("Depends", "Imports", "LinkingTo", "Suggests")

    if (local) {
    	## local packages
        if (reverse) {
        	## reverse dependencies
            out <- lapply(type, function(x) {
                tools::dependsOnPkgs(package, dependencies = x, ...)
            })
        } else {
            ## dependencies
            type <- type[type != "LinkingTo"] 
            out <- lapply(type, function(x) {
                deps <- p_extract(p_info(package=package, fields = x), FALSE)
                deps[deps != "R"]
            })
        }
    } else {
    	## set CRAN repo
    	p_set_cranrepo()
    	
    	## cran packages dependencies or reverse dependencies
        cran_db <- available.packages()
    	if (!package %in% cran_db[, "Package"]) {
    		stop(paste(package, "not found on CRAN\nconsider setting `local = TRUE`"))
    	}
        out <- lapply(type, function(x) {
            tools::package_dependencies(package, cran_db, reverse = reverse, 
                which=x, ...)[[1]]
        })
    }
	
    ## add dependency type name to list and remove empty/null elements
    out <- setNames(out, type)
    nulls <- sapply(out, is.null)
    empties <- sapply(out, identical, character(0))
    if (all(nulls)|all(empties)) return(NULL)  ## if no dependencies returns NULL
    out[empties|nulls] <- NULL
    out
}
