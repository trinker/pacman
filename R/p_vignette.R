#' View Package Vignette(s)
#' 
#' Interactively view vignettes for package(s) or return a dataframe of 
#' vignettes and accompanying information.
#' 
#' @param \ldots name(s) of package(s).
#' @param char Character vector containing packages to find vignettes for.  If 
#' you are calling \code{p_vignette} from within a function (or just having 
#' difficulties calling it using a character vector input) then pass your 
#' character vector of packages to this parameter directly.
#' @param interactive logical.  If \code{TRUE} will generate an HTML list of 
#' selections.
#' @param character.only logical. If \code{TRUE} then \code{p_vignette} will 
#' only accept a single input which is a character vector containing the names 
#' of packages to find vignettes for.
#' @seealso \code{\link[utils]{vignette}},
#' \code{\link[utils]{browseVignettes}}
#' @keywords vignette package
#' @export
#' @examples
#' p_vignette(interactive = FALSE)
#' \dontrun{
#' p_vignette()
#' p_vign()
#' p_vign(grid, utils)
#' p_vign(grid, utils, interactive = FALSE)
#' p_vign(fortunes)
#' }
p_vignette <-
function(..., char, interactive = TRUE, character.only = FALSE){

    if(!missing(char)){
        pack <- char
    }else if(character.only){
        pack <- eval(match.call()[[2]])
    }else{
        pack <- try(as.character(match.call(expand.dots = FALSE)[[2]]), 
            silent = TRUE)
        ## If nothing entered defaults to all
        if (inherits(pack, "try-error") | (length(pack) == 1 && 
            pack %in% c("TRUE", "FALSE"))) {
            if (interactive) {
                pack <- unique(vignette()[["results"]][, "Package"])
            } else {
                pack <- "all"
            }
        } 
    }

    ## Interactive picking if ! all
    if (interactive){
        p_load(tools)
        return(browseVignettes(package=pack))
    }

    ## Return a dataframe if not interactive
    ## Get list of all vignettes
    all <- vignette()
    all <- data.frame(all[["results"]], stringsAsFactors = FALSE)
    all <- all[, !colnames(all) %in% c("LibPath")]
    spltitle <- strsplit(all[, "Title"], " (source, ", fixed=TRUE)
    all[, "Title"] <- sapply(spltitle, "[", 1)
    all[, "Type"] <- gsub("\\)", "", sapply(spltitle, "[", 2))
    all <- all[, c("Package", "Item", "Type", "Title")]

    ## Handling if individual packages were given
    if (length(pack) > 1 || pack != "all") {
        all <- all[all[, "Package"] %in% pack,]
        rownames(all) <- NULL
        ## Error handling in case no vignettes found
        if (nrow(all) == 0) {
            message("No vignettes found for:\n", paste(pack, collapse=", "))
            return(invisible())
        }
    }

    class(all) <- c("wide_table", class(all))
    return(all)

}

#' @rdname p_vignette
#' @export
p_vign <- p_vignette
