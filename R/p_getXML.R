## NOTE: This is not roxygen anymore

# Get the XML package
#
# A convenience function to get XML as the package 
# is not available for Windows users as a standard 
# install from CRAN.  This function is not intended 
# for general use but as a helper function to other 
# pacman functions, for use inside of functions that 
# require XML.  It interacts with the user and asks 
# for permission to download before doing so.  
# Choosing not to download will result in a warning 
# message (and likely will result in an error).
# 
# @param package Provides the name of XML to the warning
# @param fun Provides the name of the function getXML is being used in to the warning
# @keywords XML
p_getXML <- 
function(package="XML", fun){
    url <- "http://www.stats.ox.ac.uk/pub/RWin/bin/windows/contrib/2.15/"
    mm <- "isn't available as a binary on CRAN.\nDownloading from:"
    mess <- paste(paste0("\b", package), mm, url)
    cat("\n", mess)
    cat("\n\nDo you want to continue?\n")
    men <- menu(c("yes", "no"))
    if(men==1){
        install.packages("XML", contriburl = url)
    }else{
        cat("Please download the XML package before using", fun, "\n")    
    }
}
