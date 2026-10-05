#' @name sizeof_hdr-methods
#' @title Extract Image Attribute \code{sizeof_hdr}
#' @docType methods 
#' @param object is an object of class \code{nifti} or \code{anlz}.
#' @param value is the value to assign to the \code{data_type} field.  
#'
#' @description Methods that act on the \code{sizeof_hdr} field in the
#' NIfTI/ANALYZE header.
#' @rdname sizeof_hdr-methods
#' @aliases sizeof_hdr-methods, sizeof_hdr
#' @details See documentation on the ANALYZE and/or NIfTI data standards for
#' more details.
#' @author John Muschelli \email{muschellij2@@gmail.com},\cr
#' Brandon Whitcher \email{bwhitcher@@gmail.com}
#' @references
#' ANALYZE 7.5\cr
#' \url{https://eeg.sourceforge.net/ANALYZE75.pdf}\cr
#' NIfTI-1\cr
#' \url{http://nifti.nimh.nih.gov/}
#'
#' @export
setGeneric("sizeof_hdr", function(object) standardGeneric("sizeof_hdr"))
#' @rdname sizeof_hdr-methods
#' @aliases sizeof_hdr,nifti-method
#' @export
setMethod("sizeof_hdr", "nifti", function(object) object@"sizeof_hdr")
#' @rdname sizeof_hdr-methods
#' @aliases sizeof_hdr,anlz-method
#' @export
setMethod("sizeof_hdr", "anlz", function(object) object@"sizeof_hdr")
#' @rdname sizeof_hdr-methods
#' @aliases sizeof.hdr,nifti-method
#' @export
setGeneric("sizeof.hdr", function(object) standardGeneric("sizeof.hdr"))
#' @rdname sizeof_hdr-methods
#' @aliases sizeof.hdr,nifti-method
#' @export
setMethod("sizeof.hdr", "nifti", function(object) object@"sizeof_hdr")
#' @rdname sizeof_hdr-methods
#' @aliases sizeof.hdr,anlz-method
#' @export
setMethod("sizeof.hdr", "anlz", function(object) object@"sizeof_hdr")

#' @rdname sizeof_hdr-methods
#' @aliases sizeof_hdr<- 
#' @export
setGeneric("sizeof_hdr<-", function(object, value) standardGeneric("sizeof_hdr<-"))
#' @rdname sizeof_hdr-methods
#' @aliases sizeof_hdr<-,nifti-method
#' @export
setMethod("sizeof_hdr<-", 
          signature(object="nifti"), 
          function(object, value) { 
            if ( "sizeof_hdr" %in% slotNames(object) ){
              object@"sizeof_hdr" <- value
              audit.trail(object) <-
                niftiAuditTrailEvent(object, "modification", match.call(),
                                     paste("sizeof_hdr <-", value))               
            } else {
              warning("sizeof_hdr is not in slotNames of object")
            }                       
            return(object)
          })
#' @rdname sizeof_hdr-methods
#' @aliases sizeof_hdr<-,anlz-method
#' @export
setMethod("sizeof_hdr<-", 
          signature(object="anlz"), 
          function(object, value) { 
            if ( "sizeof_hdr" %in% slotNames(object) ){
              object@"sizeof_hdr" <- value
            } else {
              warning("sizeof_hdr is not in slotNames of object")
            }
            return(object)
          })
