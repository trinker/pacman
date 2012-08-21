\name{p_functions}
\alias{p_functions}
\alias{p_funs}
\title{List the functions from a package}
\usage{
  p_functions(package = "base", all = FALSE, load = FALSE)

  p_funs(package = "base", all = FALSE, load = FALSE)
}
\arguments{
  \item{package}{Name of the package you want the list of
  functions for.}

  \item{all}{logical.  If TRUE all of the functions from
  the package will be displayed regardless of whether
  they're exported or not.}

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

