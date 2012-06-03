#' View loaded packages
#'
#' Output is a character string of loaded packages
#' 
#' @param all logical.  If TRUE will show all packages 
#' including base install; FALSE will show all packages
#'  excluding base install packages that install when R loads
#' @keywords packages loaded
#' @seealso 
#' \code{\link[base]{.packages}},
#' \code{\link[utils]{sessionInfo}}
#' @export
#' @examples
#' \dontrun{p_load(lattice)}
#' p_loaded()
#' p_loaded(FALSE)
#' p_loaded(TRUE)
#' \dontrun{p_unload(lattice)}
p_loaded <-
function(all=FALSE) {
    if (all) {
        (.packages()) 
    } else {
        names(sessionInfo()[["otherPkgs"]])
    }
}
