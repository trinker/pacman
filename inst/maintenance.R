####################
# MAINTENANCE FILE #
###############################################################
# This file is designed to hold small scripts associated with #
# internal pacman maintenance tasks.                          #
###############################################################

#==========================
#staticdocs current version
#==========================
#packages
library(highlight); library(qdap); library(staticdocs); library(acc.roxygen2)

#STEP 1: create static doc  
#right now examples are FALSE in the future this will be true
#in the future qdap2 will be the go to source
build_package(package="C:/Users/trinker/GitHub/pacman", 
    base_path="C:/Users/trinker/Desktop/pacman/", examples = TRUE)

#STEP 2: reshape index
path <- "C:/Users/trinker/Desktop/pacman"
path2 <- paste0(path, "/index.html")
rdme <- "C:/Users/trinker/GitHub/pacman/inst/extra_statdoc/readme.R"
extras <- qcv(p_cite, p_del, p_funs, p_info, p_inter, p_lib, p_sa, p_sl, p_vign,
	p_tar, p_up, p_ver)
expand_statdoc(path2, to.icon = extras, readme = rdme)


#STEP 3: move to trinker.guthub
library(reports)
file <- "C:/Users/trinker/GitHub/trinker.github.com/"
delete(paste0(file, "pacman"))
file.copy(path, file, TRUE, TRUE)
delete(path)


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
#Check spelling
#==========================
path <- file.path(getwd(), "R")
txt <- suppressWarnings(lapply(file.path(path, dir(path)), readLines))
txt <- lapply(txt, function(x) x[substring(x, 1, 2) == "#'"])
new <- lapply(1:length(txt), function(i){
    c("\n", dir(path)[i], "=========", txt[[i]])
})
out <- paste(unlist(new), collapse="\n")
cat(out, file=file.path(path.expand("C:/Users/trinker/Desktop"), "spelling.doc"))

#==========================
#Get Examples to run
#==========================
library(pacman)
examples(path = "C:/Users/trinker/GitHub/pacman/R/")

#==========================
# NEWS.md
#==========================
update_news()


#==========================
# NEWS new version
#==========================
x <- c("BUG FIXES", "NEW FEATURES", "MINOR FEATURES", "IMPROVEMENTS", "CHANGES")
cat(paste(x, collapse = "\n\n"), file="clipboard")



