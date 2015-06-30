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
#' p_search_library(begins.with = "ma")
#' p_search_library(begins.with = "r", contains = "ar")
#' p_search_library(contains = "att")
#' }
p_search_library<-
function(begins.with = NULL, contains = NULL){
   
    y <- sort(.packages(all.available = TRUE))
    y1 <- y2 <- NULL
  
    ## search for packages starting with...
    if (!is.null(begins.with)) {
        y_first <- tolower(substring(y, 1, nchar(begins.with)))
        y1 <- y[y_first %in% tolower(begins.with)]
    }

    ## search for packages containing...
    if (!is.null(contains)) {
        y2 <- grep(contains, y, ignore.case = TRUE, value=TRUE)
    }

    ## combine begins with and contains hits
    matches <- sort(unique(c(y1, y2)))

    if(is.null(matches)) {
        message("No packages match")
    	return(invisible(NULL))
    }

    ## allow for interactive choice from matches and load
    choice <- utils::select.list(c("EXIT p_search_library", matches), 
        title = "packages")
    if (choice == "EXIT p_search_library") {
        return(invisible(NULL))
    }
    library(choice, character.only = TRUE)
    message(choice, "loaded\n")
}


#' @rdname p_search_library
#' @export
p_sl <- p_search_library

