p_seeRipley <-
function() {
    URL <- "http://www.stats.ox.ac.uk/pub/RWin/bin/windows/contrib/2.15/PACKAGES"
    x <- tolower(readLines(URL))
    sapply(strsplit(x[grep("package:", x)], ": "), function(x) x[2])
}
