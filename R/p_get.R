p_get <-
function(package){
    pack<-as.character(substitute(package))
    install.packages(pack)
    do.call('library', list(pack))
}

p_install <- p_get