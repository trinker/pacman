p_vignette <-
function(package = "all"){
    x <- as.character(substitute(package))
    if(x == "all") {
        vignette() 
    } else {
        vignette(x)
    }
}
