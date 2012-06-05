\name{p_base}
\alias{p_base}
\title{List all the packages in a base install}
\usage{
  p_base(open = FALSE)
}
\arguments{
  \item{open}{logical. If TRUE opens the directory of the
  base install packages}
}
\description{
  List all the packages in a base install
}
\note{
  Packages that are installed when R starts are marked with
  an asterisk(*)
}
\examples{
\dontrun{
p_base()
p_base(TRUE)
}
}
\seealso{
  \code{\link[base]{getOption}}
}
\keyword{base}
\keyword{package}

