\name{p_search_any}
\alias{p_sa}
\alias{p_search_any}
\title{Search for CRAN packages by maintainer or match
by similar package names}
\usage{
  p_search_any(term, search.by = "Maintainer")

  p_sa(term, search.by = "Maintainer")
}
\arguments{
  \item{term}{A search character string}

  \item{search.by}{The variable to search by (takes a
  integer or a character string): 1-"Maintainer",
  1-"Author", 2-"Package", 3-"Version"}
}
\description{
  Uses agrep to find packages by maintainer (often this is
  the author as well) or by name
}
\section{details}{
  Useful for finding packages by the same author (usually
  the same as the maintainer).  This function will take
  some time as the function is searching thousands of
  packages via CRAN's website.
}
\examples{
p_search_any("hadley", 1)
p_sa("hadley", "author")
p_sa("color", 2)
p_sa("psych", "package")
}
\references{
  \url{http://cran.r-project.org/web/checks/check_summary_by_maintainer.html#summary_by_maintainer}
}
\keyword{author}
\keyword{package}
\keyword{search}

