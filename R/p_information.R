p_information <-
function(package=NULL) {
    x <- as.character(substitute(package))
    if(identical(x, character(0))) x <- "base"
    packageDescription(x)
}

p_info <- p_information