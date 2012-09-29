#' Update out of date packages
#' 
#' Either view out of date packages or update 
#' out of data packages
#' 
#' @rdname p_update
#' @param update logical.  If TRUE updates 
#' any out of date packages; if FALSE retuns a list 
#' of out of date packages
#' @seealso \code{\link[utils]{old.packages}}
#' @keywords update packages
#' @export
#' @examples
#' \dontrun{
#' p_update()
#' p_update(FALSE)
#' p_up(FALSE)
#' }
p_update <- 
function (update = TRUE) {
    # Figure out which packages need updates    
    y <- utils::old.packages()[, 1]
    packs <- names(sessionInfo()[["otherPkgs"]])
    if (any((y %in% packs)) & !is.null(packs)) {
        x <- y[na.omit(match(y, packs))]
        x <- paste0("package:", x)
        lapply(x, function(package) {
            suppressWarnings(detach(package, 
                                    character.only=TRUE, force = TRUE, 
                                    unload = TRUE))
        }
        )
    }
    cat(y, "\n")
    
    if (update){ 
        update.packages(ask = FALSE)
    }
}

#' @rdname p_update
#' @export
p_up <- p_update
