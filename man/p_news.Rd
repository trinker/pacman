\name{p_news}
\alias{p_news}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
View news for R or add-on packages
}
\description{
Find out news on a package
}
\usage{
p_news(package = NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{package}{
name of package (default is to see news for R)
}
}
\seealso{
\code{\link[utils]{news}}
}
\examples{
p_news()
p_news(lattice)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ news}
\keyword{ packages}

