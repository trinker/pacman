#' Test If Environment is Global
#' 
#' A logical test to determine if the current environment is the global 
#' environment.
#' 
#' @param n The number of generations to go back.  If used as a function 
#' argument n should be set to 2.
#' @return A logical response.
#' @references \url{http://stackoverflow.com/questions/18637656/detect-if-environment-is-global-enviroment}
#' @export
#' @author Simon O'Hanlon and Tyler Rinker <tyler.rinker@@gmail.com>
#' @seealso \code{\link[base]{globalenv}},
#' \code{\link[base]{parent.frame}}
#' @examples
#' is.global()
#' lapply(1:3, function(i) is.global())
#' FUN <- function() is.global(); FUN()
#' 
#' FUN2 <- function(x = is.global(2)) x
#' FUN2()
#' FUN3 <- function() FUN2(); FUN3()
is.global <- function(n = 1) {
    identical(parent.frame(n = n) , globalenv())
}
