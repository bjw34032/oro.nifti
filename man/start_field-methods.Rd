% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/start_field.R
\docType{methods}
\name{start_field-methods}
\alias{start_field-methods}
\alias{start_field-methods,}
\alias{start_field}
\alias{start_field,anlz-method}
\alias{start_field<-}
\alias{start_field<-,anlz-method}
\title{Extract Image Attribute \code{start_field}}
\usage{
start_field(object)

\S4method{start_field}{anlz}(object)

start_field(object) <- value

\S4method{start_field}{anlz}(object) <- value
}
\arguments{
\item{object}{is an object of class \code{nifti} or \code{anlz}.}

\item{value}{is the value to assign to the \code{start_field} field.}
}
\description{
Methods that act on the \code{start_field} field in the
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
