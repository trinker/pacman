p_getXML <- 
function(package="XML", fun){
    url <- "http://www.stats.ox.ac.uk/pub/RWin/bin/windows/contrib/2.15/"
    mm <- "isn't available as a binary on CRAN.\nDownloading from:"
    mess <- paste(paste0("\b", package), mm, url)
    cat("\n", mess)
    cat("\n\nDo you want to continue?\n")
    men <- menu(c("yes", "no"))
    if(men==1){
        #install.packages("XML", contriburl = url)
        cat("C")
    }else{
        cat("Please download the XML package before using", fun, "\n")    
    }
}