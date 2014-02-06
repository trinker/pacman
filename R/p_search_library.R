#' Partial Matching Package Search
#' 
#' Search library packages using partial matching.  Search for packages by 
#' partial matching letter(s) or by any letter(s) contained within the package's 
#' name.  Useful for those times when you can't remember that package name but 
#' you know ``it starts with...''
#' 
#' @rdname p_search_library
#' @param begins.with A character string to search for packages starting with 
#' the letter(s).
#' @param contains A character string to search for packages containing the 
#' letter(s).
#' @keywords search library package
#' @export
#' @examples
#' \dontrun{
#' p_search_library(begins.with = ma, contains = NULL)
#' p_search_library(begins.with = MA, contains = NULL)
#' p_search_library(begins.with = r, contains = t) #gives an error
#' p_search_library(contains = att) 
#' }
p_search_library<-
function(begins.with = NULL, contains = NULL){
    begins.with <- as.character(substitute(begins.with))
    contains <- as.character(substitute(contains))
    
    if (!identical(begins.with, character(0)) & 
        !identical(contains, character(0))) {
        stop("Can not use both 'begins.with' & 'contains' arguments")
    }
    
    y <- sort(.packages(all.available = TRUE))

    if (!identical(begins.with, character(0))) {
        begins.with <- c(tolower(begins.with), toupper(begins.with))
        y <- y[substring(y, 1, nchar(begins.with)) %in% begins.with]
        if(length(y)==0) stop("No packages match")
    }
    if (!identical(contains, character(0))) {
        y <- y[grep(contains, y, ignore.case = TRUE)]
        if(length(y)==0) stop("No packages match")
    }
    x <- select.list(y, title = "packages")
    library(x, character.only = TRUE)
    cat(x, "loaded\n")
}

#' @rdname p_search_library
#' @export
p_sl <- p_search_library

