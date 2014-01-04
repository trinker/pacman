\name{p_zip}
\alias{p_tar}
\alias{p_zip}
\title{Install zip/tar}
\usage{
p_zip(package = NULL, path = getOption("download_path"))

p_tar(package = NULL, path = getOption("download_path"))
}
\arguments{
  \item{package}{A quoted character string of the
  name/partial name of the package to install as zip/tar.}

  \item{path}{The path to the directory that contains the
  package.  It is convenient to set \code{download_path} in
  .Rprofile options to the downloads directory.}
}
\description{
Installs zip/tar packages.  This is convenient to set
\code{download_path} in .Rprofile options to the downloads
directory.
}
\keyword{source}
\keyword{tar}
\keyword{tar.gz}
\keyword{zip}

