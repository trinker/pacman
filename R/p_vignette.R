#' Look at a package's vignette
#' 
#' Use default "all" to see which packages have vignettes 
#' and supply a package name to view that vignette.
#' 
#' @rdname p_vignette
#' @param package Name of package or \code{"all"} (if \code{"all"} returns
#' all packages from the user's library that have vignettes).
#' @seealso  \code{\link[utils]{vignette}}
#' @keywords vignette package
#' @export
#' @examples
#' p_vignette()
#' p_vign()
#' \dontrun{p_vign(fortunes)}
p_vignette <-
function(package = "all"){
    x <- as.character(substitute(package))
    if(length(x) > 1){
        warning("There appears to be more than one input.",
                " Only first element will be used.")
        x <- x[1]
    }
    
    # Get list of all vignettes
    vigns <- vignette()
    if (x == "all") {
        # If the selection is 'all' 
        # return the list of all vignettes
        return(vigns)
    }
    
    vignette.names <- vigns$results[, "Item"]
    if (x %in% vignette.names) { 
        # x is the name of a vignette
        return(vignette(x))
    } 
    
    # else x isn't the name of a vignette
    # check if x is the name of a package
    vignette.packages <- unique(vigns$results[,"Package"])
    
    if (x %in% vignette.packages){
        package.vignettes <- vignette(package = x)$results[, "Item"]
        if (length(package.vignettes) > 1) {
            ALL <- "All Vignettes"
            choices <- c(package.vignettes, ALL)
            users.choice <- menu(choices)
            
            if (choices[users.choice] == ALL) {
                out <- lapply(package.vignettes, vignette)
                return(out)
            } else {
                return(vignette(choices[users.choice]))
            }
        } else { # only one vignette in package
            return(vignette(package.vignettes))
        }
    }
    
    # If x isn't the name of a vignette or a package
    message(paste0(x,": does not appear to be the name of a vignette\n",
                   " or a the name of a package that has a vignette"))
}

#' @rdname p_vignette
#' @export
p_vign <- p_vignette
