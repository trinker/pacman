#' Display library packages
#'
#' Generates a vector of all available add on packages 
#' available to the user and optionally opens the user's
#' library (this isn't necessarily where all of the available
#' packages are stored).
#' 
#' @rdname p_library
#' @param open logical. If TRUE opens the directory of 
#' the add on packages library.
#' @keywords library package
#' @export
#' @examples
#' p_lib()
#' p_library()
#' \dontrun{p_lib(TRUE)}
p_library <-
function (open = FALSE) 
{
    ## This location doesn't necessarily have all add-on packages
    userlibrary <- Sys.getenv("R_LIBS_USER")
    userpackages <- .packages(all.available = TRUE) #list.files(userlibrary)
    if (open) {
        p_opendir(userlibrary)
    }
    return(userpackages)
}

#' @rdname p_library
#' @export
p_lib <- p_library
