####################
# MAINTENANCE FILE #
###############################################################
# This file is designed to hold small scripts associated with #
# internal pacman maintenance tasks.                          #
###############################################################
#========
# BUILD
#========
update_news(); source("inst/build.R")

#==========================
# Run unit tests
#==========================
devtools::test()



#==========================
# NEWS new version
#==========================
x <- c("BUG FIXES", "NEW FEATURES", "MINOR FEATURES", "IMPROVEMENTS", "CHANGES")
cat(paste(x, collapse = "\n\n"), file="clipboard")


knitr::knit2html("vignettes/Introduction_to_pacman.Rmd", 
    "vignettes/Introduction_to_pacman.html", 
    stylesheet='vignettes/css/style.css'#, options = c('toc')
)


knitr::knit2html("vignettes/pacman_functions_quick_reference.Rmd", 
    "vignettes/pacman_functions_quick_reference.html", 
    stylesheet='vignettes/css/style.css'
)


