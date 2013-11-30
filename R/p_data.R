#' List all data sets available in a package
#' 
#' Generate a script of all data sets contained in package.
#' 
#' @param package name of package (default is the base install datasets package)
#' @param static logical.  If TRUE a static txt docuemnt is returned (e.g. 
#' \code{data("datasets")}).
#' @seealso \code{\link[utils]{data}}
#' @return Returns the data sets of a package as dataframe 
#' (\code{static = FALSE}) or as a static txt file (\code{static = TRUE}).
#' @keywords data package
#' @export
#' @examples
#' p_data()
#' p_data(lattice)
#' p_data(static=TRUE)
p_data <-
function(package = "datasets", static = FALSE) {
    pack <- as.character(substitute(package))
    results <- data(package = pack)[["results"]]
    o <- data.frame(results[, 3:4], 
        stringsAsFactors = FALSE
    )
	colnames(o) <- c("Data", "Description")
    if (static) {
        return(data(package = pack))
    } else {
        class(o) <- c("p_data", "data.frame")
        return(o)
    }
}


#' Prints a p_data Object
#' 
#' Prints a p_data object.
#' 
#' @param x The p_data object.
#' @param \ldots ignored
#' @method print p_data
#' @S3method print p_data
print.p_data <-
function(x, ...) {
    width <- options()[["width"]]
	options(width=10000)
    on.exit(options(width=width))
    print(left.just(x))
    return()
}
