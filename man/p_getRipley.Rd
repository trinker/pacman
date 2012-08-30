\name{p_getRipley}
\alias{p_getRipley}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Download a Ripley Maintained Package
}
\description{
Download a Ripley maintained package directly from the website
}
\usage{
p_getRipley(package = "XML", fun)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{package}{
%%     ~~Describe \code{package} here~~
}
  \item{fun}{
%%     ~~Describe \code{fun} here~~
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
function (package = "XML", fun) 
{
    URL <- "http://www.stats.ox.ac.uk/pub/RWin/bin/windows/contrib/2.15/"
    install.packages(package, contriburl = URL)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
