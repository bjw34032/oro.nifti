% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/zero_trans.R
\name{resetSlopeIntercept}
\alias{resetSlopeIntercept}
\alias{zero_trans}
\title{Change Intercept to 0 and Slope to 1 in NIfTI Object}
\usage{
resetSlopeIntercept(img)

zero_trans(img)
}
\arguments{
\item{img}{is a \code{nifti} object (or character of filename).  If an 
\code{anlz} object is passed, the unaltered \code{anlz} object is returned.}
}
\value{
An object of the same type passed.
}
\description{
Forces image \code{scl_slope} to 1 and \code{scl_inter}
to be 0 of slots of class \code{nifti}.  This is so that when images are 
rendered/written, the values correspond to those in the array (stored in the
\code{.Data} slot) and are not scaled.
}
\author{
John Muschelli \email{muschellij2@gmail.com}
}
