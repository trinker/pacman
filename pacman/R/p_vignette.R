p_vignette <-
function(package="all"){
    x <- as.character(substitute(package))
    if(x%in%c("all")) {
        vignette() 
    } else {
        vignette(x)
    }
}
