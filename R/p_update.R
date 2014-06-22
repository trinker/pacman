#' Update Out-of-Date Packages
#' 
#' Either view out of date packages or update out of data packages.
#' 
#' @rdname p_update
#' @param update logical.  If \code{TRUE} updates any out-of-date packages; if 
#' \code{FALSE} returns a list of out-of-date packages.
#' @param ask logical. If \code{TRUE} asks user before packages are actually 
#' downloaded and installed, or the character string \code{"graphics"}, which 
#' brings up a widget to allow the user to (de-)select from the list of packages 
#' which could be updated or added.
#' @param \ldots Other arguments passed to  \code{\link[utils]{update.packages}}.
#' @seealso \code{\link[utils]{update.packages}},
#' \code{\link[utils]{old.packages}}
#' @keywords update packages
#' @export
#' @examples
#' \dontrun{
#' p_update()
#' p_update(FALSE)
#' p_up(FALSE)
#' }
p_update <- 
function (update = TRUE, ask = FALSE, ...) {
	
    p_set_cranrepo()
    out <- unname(old.packages()[, 1])
	
    if (update){ 
        # TODO: Add package options
        #       Make 'ask' one of those options...
        update.packages(ask = ask, ...)
    	return(invisible(out))
    } 
    out

}

#' @rdname p_update
#' @export
p_up <- p_update
