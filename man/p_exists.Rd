\name{p_exists}
\alias{p_exists}
\title{Checks CRAN to determine if a package exists}
\usage{
  p_exists(package, cran = TRUE)
}
\arguments{
  \item{package}{name of package}

  \item{cran}{logical.  If TRUE checks CRAN for the
  package; if FALSE checks the user's local library}
}
\description{
  Checks CRAN to determine if a package exists
}
\examples{
p_exists(pacman)
p_exists(pacman, FALSE)
p_exists(I_dont_exist)
}
\keyword{exists}
\keyword{package}

