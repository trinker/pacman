\name{p_update}
\alias{p_up}
\alias{p_update}
\title{Update Out-of-Date Packages}
\usage{
p_update(update = TRUE)

p_up(update = TRUE)
}
\arguments{
  \item{update}{logical.  If \code{TRUE} updates any
  out-of-date packages; if \code{FALSE} returns a list of
  out-of-date packages.}
}
\description{
Either view out of date packages or update out of data
packages.
}
\examples{
\dontrun{
p_update()
p_update(FALSE)
p_up(FALSE)
}
}
\seealso{
\code{\link[utils]{old.packages}}
}
\keyword{packages}
\keyword{update}

