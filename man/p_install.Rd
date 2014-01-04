\name{p_install}
\alias{p_get}
\alias{p_install}
\title{Installs and loads a package provided the package is a CRAN package}
\usage{
p_install(package, character.only = FALSE, ...)

p_get(package, character.only = FALSE, ...)
}
\arguments{
  \item{package}{Name of package(s)}

  \item{character.only}{Logical indicating if input is a
  character string}

  \item{\ldots}{Additional parameters to pass to
  install.packages}
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

