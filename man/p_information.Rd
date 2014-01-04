\name{p_information}
\alias{p_info}
\alias{p_information}
\title{See information on a package.}
\usage{
p_information(package = "base")

p_info(package = "base")
}
\arguments{
  \item{package}{Name of the package you want information
  on. The default is "base".}
}
\description{
Provides the information from for a package from the
NAMESPACE.  Information may include: title, version,
author, maintainer, description, depends, imports, suggests
}
\examples{
p_information()
p_info()
p_info(pacman)
}
\seealso{
\code{\link[utils]{packageDescription}}
}
\keyword{info}
\keyword{information}
\keyword{package}
\keyword{packageDescription}

