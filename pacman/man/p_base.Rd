\name{p_base}
\alias{p_base}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
List all the packages in a base install
}
\description{
List all the packages in a base install
}
\usage{
p_base(open=FALSE)
%- maybe also 'usage' for other objects documented here.
}
\arguments{
  \item{open}{
logical. If TRUE opens the directory of the base install packages
}
}

\note{
PAckages that are installed when R starts are marked with an asterisk(*)
}
\seealso{
\code{\link[base]{getOption}}
}
\examples{
p_base()
p_base(TRUE)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{base}
\keyword{package}