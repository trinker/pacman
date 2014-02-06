\name{p_information}
\alias{p_info}
\alias{p_information}
\title{Package Information}
\usage{
p_information(package = "base")

p_info(package = "base")
}
\arguments{
  \item{package}{Name of the package to grab information
  for.  Default is \code{"base"}.}
}
\description{
Provides the information from for a package from the
\emph{NAMESPACE}.  Information may include: title, version,
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

