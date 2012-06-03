#' See path to library of add on package
#' 
#' See path to library of add on package
#' 
#' @seealso \code{\link[base]{.libPaths}}
#' @keywords package library location path
#' @export
#' @examples
#' p_path()
p_path <-
function(){
    return(.libPaths())
}
