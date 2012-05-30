p_cran <-
function(menu=FALSE){
    a <- available.packages()
    b <- rownames(a)  
    if(menu){
    b <- select.list(b, title = "CRAN packages")
    }
    return(b)          
}
