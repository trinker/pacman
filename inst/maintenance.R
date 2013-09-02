####################
# MAINTENANCE FILE #
###############################################################
# This file is designed to hold small scripts associated with #
# internal pacman maintenance tasks.                          #
###############################################################




#====================================
# NEWS.md - create NEWS.md from NEWS
#====================================
News <- readLines("NEWS")
library(pacman); p_load(qdap)
News <- mgsub(
    c("<", ">", "&lt;major&gt;.&lt;minor&gt;.&lt;patch&gt;"), 
    c("&lt;", "&gt;", "<b>&lt;major&gt;.&lt;minor&gt;.&lt;patch&gt;</b>"), News)
cat(paste(News, collapse = "\n"), file = "NEWS.md")

#==========================