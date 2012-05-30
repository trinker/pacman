\name{p_help}
\alias{p_help}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Generate an html, web or pdf package help manual
}
\description{
Generate an html, web or pdf of a package's help manual
}
\usage{
p_help(package = NULL, web = FALSE, pdf = FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
 \item{package}{
name of package
}

  \item{web}{
logical.  If TRUE grabs current help manual from the web
}
  \item{pdf}{
logical.  If TRUE uses a LaTeX compiler to generate a pdf
}
}
\section{Warning }{To use the pdf argument you must have a pdf compiler 
(e.g. MikTex) installed.}
\seealso{
\code{\link[utils]{help}}
}
\examples{
# p_help()
# p_help(pacman)
# p_help(pacman, web=TRUE)
# p_help(pacman, pdf=TRUE)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{help}
\keyword{manual}
\keyword{package}