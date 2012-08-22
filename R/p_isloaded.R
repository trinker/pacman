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
    x <-unlist(lapply(x, function(y) as.character(y)))
    if (length(x) == 1) {
        x %in% p_loaded(TRUE)
    } else {
        loaded <- x %in% p_loaded(TRUE)
        names(loaded) <- x
        return(loaded)
    }
}
