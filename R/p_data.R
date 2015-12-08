#' Package Data Sets
#' 
#' Generate a script of all data sets contained in package.
#' 
#' @param package name of package (default is the base install datasets 
#' package).
#' @param static logical.  If \code{TRUE} a static text document is returned 
#' (e.g. \code{data("datasets")}).
#' @seealso \code{\link[utils]{data}}
#' @return Returns the data sets of a package as a \code{\link[base]{data.frame}}.
#' (\code{static = FALSE}) or as a static text file (\code{static = TRUE}).
#' @keywords data package
#' @export
#' @examples
#' p_data()
#' p_data(lattice)
#' \dontrun{p_data(static=TRUE)}
p_data <-
function(package = "datasets", static = FALSE) {

    ## check if package is an object
    if(!object_check(package) || !is.character(package)){
        package <- as.character(substitute(package))
    }

    if (static) {
        return(utils::data(package = package))
    } else {    
        ## grab the data sets
        results <- utils::data(package = package)[["results"]]
    
        ## if 0 rows return NULL and message
        if (nrow(results) == 0) {
            message("no data sets found")
            return(invisible(NULL))
        }
    
        ## make results into a dataframe and add anmes
        o <- stats::setNames(data.frame(results[, 3:4, drop = FALSE], 
            stringsAsFactors = FALSE
        ), c("Data", "Description"))
    
        class(o) <- c("wide_table", class(o))
        return(o)
    }
}

#' Prints a wide_table Object
#' 
#' Prints a wide_table object.
#' 
#' @param x The wide_table object.
#' @param right logical.  If \code{FALSE} stings will be left-aligned.
#' @param \ldots ignored
#' @method print wide_table
#' @export
print.wide_table <-
function(x, right = FALSE, ...) {
    width <- options()[["width"]]
    options(width=10000)
    on.exit(options(width=width))
    print.data.frame(x, right = right, ...)
    return()
}
