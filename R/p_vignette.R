p_vignette <-
function(package = "all"){
    x <- as.character(substitute(package))
    if (x == "all") {
        vignette() 
    } else {
        y <- vignette(package = x)$results[, 3]
        if (length(y) > 1) {
            w <- c(y, "All Vignettes")
            z <- menu(w) 
            if (w[z] == "All Vignettes") {
                lapply(y, vignette)
            } else {
                vignette(w[z])
            }
        } else {
            vignette(y)
        }
    }
}

p_vign <- p_vignette