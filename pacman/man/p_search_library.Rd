\name{p_search_library}
\alias{p_search_library}
\alias{p_sl}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Search library packages using partial matching
}
\description{
Search library packages using partial matching.  Search for packages by 
begining letter(s) or by any letter(s) contained within the package's name.  Useful for those times when you can't
remember that package name but you know ``it starts with...''
}
\usage{
p_search_library(begins.with = NULL, contains = NULL)
p_sl(begins.with = NULL, contains = NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{begins.with}{
a character string to search for packeges starting with the letter(s)
}
  \item{contains}{
a character string to search for packeges containing the letter(s)
}
}
\examples{
# p_search_library(begins.with = ma, contains = NULL)
# p_search_library(begins.with = MA, contains = NULL)
# p_search_library(begins.with = r, contains = t) #gives an error
# p_search_library(contains = att) 
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ search }
\keyword{ library }
\keyword{ package } 