#' Check if package(s) is loaded
#' 
#' Check if package(s) is loaded
#' 
#' @rdname p_isloaded
#' @param \ldots name(s) of package(s)
#' @seealso \code{\link[base]{.packages}}
#' @keywords delete package
#' @export
#' @examples
#' \dontrun{
#' p_isloaded(ggplot2)
#' p_isloaded(ggplot2, dfs, pacman)
#' }
p_isloaded <-
function(...) {
    x <- substitute(...())
    x <- sapply(x, as.character)
    
    # Note: Is there a reason we don't want to add a name
    # when there is only one input?  Otherwise we could
    # simplify this
    if (length(x) == 1) {
        x %in% p_loaded(all = TRUE)
    } else {
        loaded <- x %in% p_loaded(all = TRUE)
        names(loaded) <- x
        return(loaded)
    }
}
