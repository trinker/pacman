\name{p_base}
\alias{p_base}
\title{List all the packages in a base install}
\usage{
p_base(open = FALSE, basemarker = "***")
}
\arguments{
  \item{open}{logical. If TRUE opens the directory of the
  base install packages}

  \item{basemarker}{character string.  The string to append
  to mark which packages are part of the default packages.}
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

