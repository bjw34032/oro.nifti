% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/orient.R
\docType{methods}
\name{orient-methods}
\alias{orient-methods}
\alias{orient-methods,}
\alias{orient}
\alias{orient,anlz-method}
\alias{orient<-}
\alias{orient<-,anlz-method}
\title{Extract Image Attribute \code{orient}}
\usage{
orient(object)

\S4method{orient}{anlz}(object)

orient(object) <- value

\S4method{orient}{anlz}(object) <- value
}
\arguments{
\item{object}{is an object of class \code{nifti} or \code{anlz}.}

\item{value}{is the value to assign to the \code{orient} field.}
}
\description{
Methods that act on the \code{orient} field in the
NIfTI/ANALYZE header.
}
\details{
See documentation on the ANALYZE and/or NIfTI data standards for
more details.
}
\references{
ANALYZE 7.5\cr
\url{http://eeg.sourceforge.net/ANALYZE75.pdf}\cr
NIfTI-1\cr
\url{http://nifti.nimh.nih.gov/}
}
\author{
John Muschelli \email{muschellij2@gmail.com},\cr
Brandon Whitcher \email{bwhitcher@gmail.com}
}
