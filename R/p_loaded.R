#' Check for Loaded Packages
#'
#' \code{p_loaded} - Output is a character string of loaded packages.
#' 
#' @param \ldots Optional package names.  Adding package names will check their 
#' individual load status.
#' @param all logical.  If \code{TRUE} will show all packages 
#' including base install; \code{FALSE} will show all packages
#' excluding base install packages that install when R loads.
#' @param char Character vector containing packages to load.  If you are calling
#' \code{p_loaded} from within a function (or just having difficulties calling it 
#' using a character vector input) then pass your character vector of packages 
#' to load to this parameter directly.
#' @param character.only logical. If \code{TRUE} then \code{p_loaded} will only 
#' accept a single input which is a character vector containing the names of 
#' packages to load.
#' @keywords packages loaded
#' @rdname p_loaded
#' @seealso 
#' \code{\link[base]{.packages}},
#' \code{\link[utils]{sessionInfo}}
#' @export
#' @examples
#' \dontrun{
#' p_load(lattice, ggplot2)
#' }
#' p_loaded()
#' p_loaded(all=TRUE)
#' p_loaded(ggplot2, tm, qdap)
#' 
#' p_isloaded(ggplot2)
#' p_isloaded(ggplot2, dfs, pacman)
#' \dontrun{p
#' _unload(lattice)
#' }
p_loaded <- 
function(..., all = FALSE, char, character.only = FALSE) {
    # make this better...	
    if(!missing(char)){
        packs <- char
    }else if(character.only){
        packs <- eval(match.call()[[2]])
    }else{
        packs <- tryCatch(as.character(match.call(expand.dots = FALSE)[[2]]), 
        	error=function(err) NA)
    }
	
    if (is.logical(packs)) {
        packs <- NA
    } 
    
    ## check if all = TRUE & supply `.packages` or `sessionInfo`
    if (all) {
        loaded <- .packages()
    } else {
        loaded <- names(utils::sessionInfo()[["otherPkgs"]])
    }

    if (!all && (length(packs) > 1 || !is.na(packs))) {
       packs <- as.character(packs)
       
       #output <- packs %in% loaded
       output <- packs %in% .packages() # make sure we can detect any loaded package
       names(output) <- packs
       return(output)
    } else {
       return(loaded)
    }
}


#' Check for Loaded Packages
#' 
#' \code{p_isloaded} - Check if package(s) is loaded.
#' 
#' @rdname p_loaded
#' @export
p_isloaded <-
function(...) {
    x <- substitute(...())
    p_loaded(char = sapply(x, as.character))

}
