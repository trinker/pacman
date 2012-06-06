\name{p_library}
\alias{p_lib}
\alias{p_library}
\title{Display library packages}
\usage{
  p_library(open = FALSE)

  p_lib(open = FALSE)
}
\arguments{
  \item{open}{logical. If TRUE opens the directory of the
  add on packages library.}
}
\description{
  Generates a vector of all available add on packages in
  the user's library and optionally opens that directory.
}
\examples{
p_lib()
p_library()
\dontrun{p_lib(TRUE)}
}
\keyword{library}
\keyword{package}

