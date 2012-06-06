\name{p_functions}
\alias{p_functions}
\alias{p_funs}
\title{List the functions from a package}
\usage{
  p_functions(package = "base", load = FALSE)

  p_funs(package = "base", load = FALSE)
}
\arguments{
  \item{package}{Name of the package you want the list of
  functions for.}

  \item{load}{logical.  If TRUE the package will be
  loaded.}
}
\description{
  List the functions from a package
}
\examples{
p_functions()
p_funs()
p_funs(pacman)
}
\seealso{
  \code{\link[=base]{object}}
}
\keyword{function}
\keyword{package}

