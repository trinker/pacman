\name{p_functions}
\alias{p_functions}
\alias{p_funs}
\title{List the functions from a package}
\usage{
p_functions(package = "base", all = FALSE, load = FALSE,
  character.only = FALSE)

p_funs(package = "base", all = FALSE, load = FALSE,
  character.only = FALSE)
}
\arguments{
  \item{package}{Name of the package you want the list of
  functions for.}

  \item{all}{logical.  If \code{TRUE} all of the functions
  from the package will be displayed regardless of whether
  they're exported or not.}

  \item{load}{logical.  If \code{TRUE} loads the package.}

  \item{character.only}{logical. If \code{TRUE} the input
  is a variable containing the package name.}
}
\description{
List the functions from a package
}
\examples{
p_functions()
p_funs()
p_funs(pacman)
}
\keyword{function}
\keyword{package}

