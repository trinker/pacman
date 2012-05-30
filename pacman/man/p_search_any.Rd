\name{p_search_any}
\alias{p_search_any}
\alias{p_sa}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Search for CRAN packages by maintainer or match by similar package names
}
\description{
Uses agrep to find packages by maintainer (often this is the author as well) or by name  
}
\usage{
p_search_any(term, search.by = "Maintainer")
p_sa(term, search.by = "Maintainer")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{term}{
a search character string
}
  \item{search.by}{
The variable to search by (takes a integer or a character string): 
1-"Maintainer", 1-"Author", 2-"Package", 3-"Version"
}
}
\details{
Useful for finding packages by the same author (usually the same as the 
maintainer).  This function will take 
some time as the function is searching thousands of packages via CRAN's website.
}
\references{
http://cran.r-project.org/web/checks/check_summary_by_maintainer.html#summary_by_maintainer
}
\examples{
p_search_any("hadley", 1)
p_sa("hadley", "author")
p_sa("color", 2)
p_sa("psych", "package")
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ author }
\keyword{package }
\keyword{ search } 