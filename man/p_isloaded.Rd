\name{p_isloaded}
\alias{p_isloaded}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Test If a Package(s) Is Loaded
}
\description{
Test to determine if a package(s) is loaded.
}
\usage{
p_isloaded(...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{\dots}{
%%     ~~Describe \code{\dots} here~~
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (...) 
{
    x <- substitute(...())
    x <- unlist(lapply(x, function(y) as.character(y)))
    if (length(x) == 1) {
        x \%in\% p_loaded(TRUE)
    }
    else {
        loaded <- x \%in\% p_loaded(TRUE)
        names(loaded) <- x
        return(loaded)
    }
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
