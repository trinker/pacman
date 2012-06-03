\name{p_search_library}
\alias{p_search_library}
\alias{p_sl}
\title{Search library packages using partial matching}
\usage{
  p_search_library(begins.with = NULL, contains = NULL)
}
\arguments{
  \item{begins.with}{a character string to search for
  packages starting with the letter(s)}

  \item{contains}{a character string to search for packages
  containing the letter(s)}
}
\description{
  Search library packages using partial matching. Search
  for packages by begining letter(s) or by any letter(s)
  contained within the package's name. Useful for those
  times when you can't remember that package name but you
  know ``it starts with...''
}
\examples{
# p_search_library(begins.with = ma, contains = NULL)
# p_search_library(begins.with = MA, contains = NULL)
# p_search_library(begins.with = r, contains = t) #gives an error
# p_search_library(contains = att)
}
\keyword{library}
\keyword{package}
\keyword{search}

