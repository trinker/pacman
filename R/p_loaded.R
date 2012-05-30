p_loaded <-
function(all=FALSE) {
    if (all) {
        (.packages()) 
    } else {
        names(sessionInfo()[["otherPkgs"]])
    }
}
