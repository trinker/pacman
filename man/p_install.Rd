\name{p_install}
\alias{p_get}
\alias{p_install}
\title{Installs and loads a package provided the package is a CRAN package}
\usage{
  p_install(package)

  p_get(package)
}
\arguments{
  \item{package}{Name of package(s)}
}
\description{
  Installs a package provided the package is a CRAN package
}
\examples{
\dontrun{p_install(pacman)}
}
\seealso{
  \code{\link[utils]{install.packages}}
}
\keyword{install}
\keyword{package}

