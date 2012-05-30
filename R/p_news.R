p_news <-
function(package=NULL){   
    x <- as.character(substitute(package))
    if(identical(x, character(0))) x <- "R"
    if(x=="r") x <- "R"
    news(package = (x))
}
