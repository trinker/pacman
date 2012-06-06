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
    ## This doesn't necessarily have all add-on
    ## packages though...
    userlibrary <- Sys.getenv("R_LIBS_USER")
    userpackages <- list.files(userlibrary)
    if (open) {

        p_opendir(userlibrary)
    }
    return(userpackages)
}

#' @rdname p_library
#' @export
p_lib <- p_library
