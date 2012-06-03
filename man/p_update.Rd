\name{p_update}
\alias{p_up}
\alias{p_update}
\title{Update out of date packages}
\usage{
  p_update(install = TRUE)
}
\arguments{
  \item{install}{logical.  If TRUE installs any out of date
  packages; if FALSE retuns a list of out of date packages}
}
\description{
  Either view out of date packages or update out of data
  packages
}
\examples{
# p_update()
# p_update(FALSE)
# p_up(FALSE)
}
\seealso{
  \code{\link[utils]{old.packages}}
}
\keyword{packages}
\keyword{update}

