#' Check if Package(s) is Loaded
#' 
#' Check if package(s) is loaded.
#' 
#' @rdname p_isloaded
#' @param \ldots Name(s) of package(s).
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
    p_loaded(char = sapply(x, as.character))

}