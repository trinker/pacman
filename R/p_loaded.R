#' View Loaded Packages
#'
#' Output is a character string of loaded packages.
#' 
#' @param \ldots Optional package names.  Adding package names will check their 
#' individual load status.
#' @param all logical.  If \code{TRUE} will show all packages 
#' including base install; \code{FALSE} will show all packages
#' excluding base install packages that install when R loads.
#' @keywords packages loaded
#' @seealso 
#' \code{\link[base]{.packages}},
#' \code{\link[utils]{sessionInfo}}
#' @export
#' @examples
#' \dontrun{
#' p_load(lattice)}
#' p_loaded()
#' p_loaded(all=TRUE)
#' p_loaded(ggplot2, tm, qdap)
#' \dontrun{p_unload(lattice)}
p_loaded <- 
function(..., all = FALSE) {
    # make this better...
    dots <- match.call(expand.dots = FALSE)
    packs <- tryCatch(dots[[2]], error=function(err) NA)
    if (is.logical(packs)) {
        packs <- NA
    } 
    if (all) {
        loaded <- .packages()
    } else {
        loaded <- names(sessionInfo()[["otherPkgs"]])
    }
    if (length(packs) > 1 || !is.na(packs)) {
       packs <- as.character(packs)
       
       #output <- packs %in% loaded
       output <- packs %in% .packages() # make sure we can detect any loaded package
       names(output) <- packs
       return(output)
    } else {
       return(loaded)
    }
}
