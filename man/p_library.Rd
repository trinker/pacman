\name{p_library}
\alias{p_lib}
\alias{p_library}
\title{Display library packages}
\usage{
p_library(open = FALSE)

p_lib(open = FALSE)
}
\arguments{
  \item{open}{logical. If \code{TRUE} opens the directory
  of the add on packages library.}
}
\description{
Generates a vector of all available add on packages
available to the user and optionally opens the user's
library (this isn't necessarily where all of the available
packages are stored).
}
\examples{
p_lib()
p_library()
\dontrun{p_lib(TRUE)}
}
\keyword{library}
\keyword{package}

