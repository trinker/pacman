\name{p_library}
\alias{p_library}
\alias{p_lib}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Display library packages
}
\description{
Generates a vector all available add on packages in user's library and optionally opens that directory.
}
\usage{
p_library(open=FALSE)
p_lib(open=FALSE)
%- maybe also 'usage' for other objects documented here.
}
\arguments{
  \item{open}{
logical. If TRUE opens the directory of the add on packages library
}
}
\examples{
p_lib()
p_library()
p_lib(TRUE)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ package}
\keyword{ library }% __ONLY ONE__ keyword per line
