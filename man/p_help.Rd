\name{p_help}
\alias{p_help}
\title{Generate an html, web or pdf package help manual}
\usage{
  p_help(package = NULL, web = FALSE, pdf = FALSE)
}
\arguments{
  \item{package}{name of package}

  \item{web}{logical.  If TRUE grabs current help manual
  from the web}

  \item{pdf}{logical.  If TRUE uses a LaTeX compiler to
  generate a pdf}
}
\description{
  Generate an html, web or pdf of a package's help manual
}
\section{Warning}{
  To use the pdf argument you must have a pdf compiler
  (e.g. MikTex) installed.
}
\examples{
# p_help()
# p_help(pacman)
# p_help(pacman, web=TRUE)
# p_help(pacman, pdf=TRUE)
}
\seealso{
  \code{\link[utils]{help}}
}
\keyword{help}
\keyword{manual}
\keyword{package}

