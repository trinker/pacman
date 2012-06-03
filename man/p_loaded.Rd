\name{p_loaded}
\alias{p_loaded}
\title{View loaded packages}
\usage{
  p_loaded(all = FALSE)
}
\arguments{
  \item{all}{logical.  If TRUE will show all packages
  including base install; FALSE will show all packages
  excluding base install packages that install when R
  loads}
}
\description{
  Output is a character string of loaded packages
}
\examples{
\dontrun{p_load(lattice)}
p_loaded()
p_loaded(FALSE)
p_loaded(TRUE)
p_unload(lattice)
}
\seealso{
  \code{\link[base]{.packages}},
  \code{\link[utils]{sessionInfo}}
}
\keyword{loaded}
\keyword{packages}

