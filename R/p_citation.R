p_citation <-
function(package="r") {
    x <- as.character(substitute(package))
    if(x%in%c("R", "r")){
        citation() 
    } else {
        citation(package = x, 
            lib.loc = NULL, auto = NULL)
    }
}

p_cite <- p_citation