#' Load one or more packages 
#'
#' This function is a wrapper for library and require.
#' It checks to see if a package is installed, if not 
#' it installs the package(s) and loads it.
#' 
#' @aliases p_load
#' @param \ldots name(s) of package(s)
#' @param install logical.  If TRUE will attempt to install a package 
#' not found in the library
#' @param update logical.  If TRUE will attempt to update out of date packages
#' @param require logical.  If TRUE will use require; FALSE will use library
#' @keywords library require package update
#' @seealso 
#' \code{\link[base]{library}},
#' \code{\link[base]{require}},
#' \code{\link[utils]{install.packages}}
#' @export
#' @examples
#' \dontrun{
#' p_load(lattice)
#' p_unload(lattice)
#' p_load(lattice, foreign, boot, rpart)
#' p_loaded()
#' p_unload(lattice, foreign, boot, rpart)
#' p_loaded()
#' }
p_load <-
function (..., install = TRUE, update = TRUE, require = TRUE){ 
#     nonnamed <- which(names(as.list(match.call())) == "")[-1]
#     packages <- as.character(match.call())[nonnamed]
#     if(identical(packages, character(0))){
#         packages <- as.character(match.call())[-1]
#     }
    mf <- match.call(expand.dots = FALSE)
    packages <- as.character(mf[[2]])

    if (update | install){
        upper <- function(pack, Update, Install) {
            y <- utils::old.packages()[, 1]
            packs <- names(sessionInfo()[["otherPkgs"]])
            A <- all(c(pack %in% y, !pack %in% packs))
            B <- !pack %in% list.files(.libPaths())
            if ((A & Update)) {
                install.packages(pack)
            }
            if ((B & Install)) {
                install.packages(pack)
            }
        }
        lapply(packages, upper, Update = update, Install = install)
    }
    ## TODO: Why do we offer the option to use require or library?
    if (require) {
         invisible(lapply(packages, function(x) do.call("require", 
             list(x))))
    } else {
         invisible(lapply(packages, function(x) do.call("library", 
             list(x))))
    }
}
