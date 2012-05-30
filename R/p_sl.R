p_sl<-
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
