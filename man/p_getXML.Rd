\name{p_getXML}
\alias{p_getXML}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Get the XML package
}
\description{
A convenience function to get XML as the package is not available for Windows users as a standard install from CRAN.  This function is not intended for general use but as a helper function to other pacman functions, for use inside of functions that require XML.  It interacts with the user and asks for permission to download before doing so.  Choosing not to download will result in a warning message (and likely will result in an error).
}
\usage{
p_getXML(package = "XML", fun)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{package}{
Provides the name of XML to the warning
}
  \item{fun}{
Provides the name of the function getXML is being used in to the warning
}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ XML }