p_vignette <-
function(package = "all"){
    x <- as.character(substitute(package))
    vigns <- vignette()
    if (x == "all") {
        vigns     
    } else {
        vn <- vigns$results
        if (x %in% vn[, 3]) {
            pn <- vn[vn[, 3] %in% x, 3]
            vignette(pn)
        } else {
            if (!x %in% vn[, 1]){
                stop (paste(x, 
                            "does not appear to be a package with a vignette or the name of a vignette"))
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
    }
}

p_vign <- p_vignette