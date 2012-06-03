#' See path to library of add on package
#' 
#' See path to library of add on package
#' 
#' @alias p_path
#' @seealso \code{\link[base]{.libPaths}}
#' @keyword package library location path
#' @export
#' @examples
#' p_path()
p_path <-
function(){
    return(.libPaths())
}
