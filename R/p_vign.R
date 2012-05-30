p_vign <-
function(package="all"){
    x <- as.character(substitute(package))
    if(x%in%c("all")) {
        vignette() 
    } else {
        vignette(x)
    }
}
