\name{p_seeRipley}
\alias{p_seeRipley}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
See What Packages are Maintained by Professor Brian Ripley
}
\description{
See what packages are maintained by Professor Brian Ripley
}
\usage{
p_seeRipley()
}
%- maybe also 'usage' for other objects documented here.
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
function () 
{
    URL <- "http://www.stats.ox.ac.uk/pub/RWin/bin/windows/contrib/2.15/PACKAGES"
    x <- tolower(readLines(URL))
    sapply(strsplit(x[grep("package:", x)], ": "), function(x) x[2])
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
