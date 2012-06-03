\name{p_library}
\alias{p_lib}
\alias{p_library}
\title{Display library packages}
\usage{
  p_library(open = FALSE)
}
\arguments{
  \item{open}{logical. If TRUE opens the directory of the
  add on packages library}
}
\description{
  Generates a vector all available add on packages in
  user's library and optionally opens that directory.
}
\examples{
p_lib()
p_library()
p_lib(TRUE)
}
\keyword{library}
\keyword{package}

