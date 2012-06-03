\name{p_author}
\alias{p_author}
\title{Returns the author of a package}
\usage{
  p_author(package = "base")
}
\arguments{
  \item{package}{Name of the package you want the author
  of.}
}
\description{
  Returns the author of a package
}
\examples{
p_author(pacman)
p_author()
}
\seealso{
  \code{\link[utils]{packageDescription}}
}
\keyword{author}
\keyword{package}

