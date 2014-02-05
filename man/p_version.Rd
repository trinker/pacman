\name{p_version}
\alias{p_ver}
\alias{p_version}
\title{Determine installed package version}
\usage{
p_version(package = "R")

p_ver(package = "R")
}
\arguments{
  \item{package}{Name of package (default returns R
  version).}
}
\description{
Determine what version a package is in your library.
}
\examples{
\dontrun{
p_ver()
p_version()
p_ver(pacman)
p_version(pacman)
}
}
\seealso{
\code{\link[utils]{packageDescription}}
}
\keyword{package}
\keyword{version}

