\name{p_delete}
\alias{p_delete}
\alias{p_del}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Remove package(s) from the library
}
\description{
Remove package(s) from the library permanently.  
}
\usage{
p_delete(...)
p_del(...)
}
%- maybe also 'usage' for other objects documented here
\arguments{
  \item{\dots}{
name(s) of package(s)
}
}

\section{Warning }{Using this function will remove the package from your 
library and can not be loaded again without reinstalling the package.} 

\seealso{
\code{\link[utils]{remove.packages}}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ delete }
\keyword{ package }
