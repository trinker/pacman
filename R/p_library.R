#' Display library packages
#'
#' Generates a vector of all available add on packages 
#' in the user's library and optionally opens that directory.
#' 
#' @rdname p_library
#' @param open logical. If TRUE opens the directory of 
#' the add on packages library.
#' @keywords library package
#' @export
#' @examples
#' p_lib()
#' p_library()
#' p_lib(TRUE)
p_library <-
function (open = FALSE) 
{
    x <- .libPaths()
    y <- list.files(x)
    if (open) {
        ## TODO: Possibly fix this
        ## Why only the first of the libPaths.
        ## on my system that opens the least useful library :(
        lib <- x[1]
        p_opendir(lib)
    }
    return(y)
}

#' @rdname p_library
#' @export
p_lib <- p_library
