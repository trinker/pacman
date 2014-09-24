####################
# MAINTENANCE FILE #
###############################################################
# This file is designed to hold small scripts associated with #
# internal pacman maintenance tasks.                          #
###############################################################
#========
# BUILD
#========
source("inst/build.R")

#==========================
# Run unit tests
#==========================
devtools::test()

#======================
#staticdocs dev version
#======================
#packages
# library(devtools); install_github("qdap", "trinker"); install_github("staticdocs", "hadley")
# install_github("acc.roxygen2", "trinker")
library(highlight); library(staticdocs)

#STEP 1: create static doc  
#right now examples are FALSE in the future this will be true
#in the future qdap2 will be the go to source
build_site(pkg="C:/Users/trinker/GitHub/pacman",launch = FALSE)
library(qdap); library(acc.roxygen2)

#STEP 2: reshape index
path <- "inst/web"
path2 <- file.path(path, "/index.html")
rdme <- "C:/Users/trinker/GitHub/pacman/inst/extra_statdoc/readme.R"
extras <- qcv(p_del, p_up, p_get, p_cite, p_funs, p_info, p_inter, p_ver, p_vign, 
	p_sa, p_sl, p_lib, p_iscran)
expand_statdoc(path2, to.icon = extras, readme = rdme)

x <- readLines(path2)
x[grepl("<h2>Authors</h2>", x)] <- paste(c("<h2>Author</h2>", 
    rep("<h2>Author</h2>", 1)),
    c("Tyler W. Rinker", "Dason Kurkiewicz"))

cat(paste(x, collapse="\n"), file=path2)


#STEP 3: move to trinker.guthub
library(reports)
file <- "C:/Users/trinker/GitHub/trinker.github.com"
incoming <- file.path(file, "pacman_dev")
delete(incoming)
file.copy(path, file, TRUE, TRUE)
file.rename(file.path(file, "web"), incoming)

#==========================
#staticdocs current version
#==========================
#packages
# library(devtools); install_github("qdap", "trinker"); install_github("staticdocs", "hadley")
# install_github("acc.roxygen2", "trinker")
library(highlight); library(staticdocs)

#STEP 1: create static doc  
#right now examples are FALSE in the future this will be true
#in the future qdap2 will be the go to source
build_site(pkg="C:/Users/trinker/GitHub/pacman",launch = FALSE)
library(qdap); library(acc.roxygen2)

#STEP 2: reshape index
path <- "inst/web"
path2 <- file.path(path, "/index.html")
rdme <- "C:/Users/trinker/GitHub/pacman/inst/extra_statdoc/readme.R"
extras <- qcv(p_del, p_up, p_get, p_cite, p_funs, p_info, p_inter, p_ver, p_vign, 
	p_sa, p_sl, p_lib, p_iscran)
expand_statdoc(path2, to.icon = extras, readme = rdme)

x <- readLines(path2)
x[grepl("<h2>Authors</h2>", x)] <- paste(c("<h2>Author</h2>", 
    rep("<h2>Author</h2>", 1)),
    c("Tyler W. Rinker", "Dason Kurkiewicz"))

cat(paste(x, collapse="\n"), file=path2)


#STEP 3: move to trinker.guthub
library(reports)
file <- "C:/Users/trinker/GitHub/trinker.github.com"
incoming <- file.path(file, "pacman")
delete(incoming)
file.copy(path, file, TRUE, TRUE)
file.rename(file.path(file, "web"), incoming)



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


