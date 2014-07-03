#' Path to Library of Add-On Packages
#' 
#' Path to library of add-on packages.
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
