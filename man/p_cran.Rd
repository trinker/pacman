\name{p_cran}
\alias{p_cran}
\title{List all available CRAN packages}
\usage{
  p_cran(menu = FALSE)
}
\arguments{
  \item{menu}{logical.  If TRUE allows user to select the
  package and return that package name}
}
\description{
  Generate a vector of all available packages.
}
\examples{
p_cran()
\dontrun{p_cran(TRUE)}
}
\seealso{
  \code{\link[utils]{available.packages}}
}
\keyword{CRAN}
\keyword{package}

