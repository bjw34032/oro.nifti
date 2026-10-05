#' @name img_data-methods
#' @title Extract Image Attribute \code{.Data}
#' @docType methods 
#' @param object is an object of class \code{nifti} or \code{anlz}.
#' @param value is the value to assign to the \code{.Data} field.  
#' @description Methods that act on the \code{.Data} field in the
#' NIfTI/ANALYZE header.
#' @rdname img_data-methods
#' @aliases img_data-methods, img_data
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
setGeneric("img_data", function(object) standardGeneric("img_data"))
#' @rdname img_data-methods
#' @aliases img_data,nifti-method
#' @export
setMethod("img_data", "nifti", function(object) object@".Data")
#' @rdname img_data-methods
#' @aliases img_data,anlz-method
#' @export
setMethod("img_data", "anlz", function(object) object@".Data")
#' @rdname img_data-methods
#' @aliases img_data,character-method
#' @export
setMethod("img_data", "character", function(object) { 
  object = readNifti(object)
  object = array(object)
  object = as.array(object)
  as(object, "array")
  })
#' @rdname img_data-methods
#' @aliases img_data,ANY-method
#' @importFrom RNifti retrieveNifti
#' @export
setMethod("img_data", "ANY", function(object) { 
  object = RNifti::asNifti(object, internal = FALSE)
  object = array(object, dim = dim(object))
  object = as.array(object)
  as(object, "array")
})

#' @rdname img_data-methods
#' @aliases img_data<- 
#' @export
setGeneric("img_data<-", function(object, value) standardGeneric("img_data<-"))
#' @rdname img_data-methods
#' @aliases img_data<-,nifti-method
#' @export
setMethod("img_data<-", 
          signature(object = "nifti"), 
          function(object, value) { 
            if ( ".Data" %in% slotNames(object) ) {
              object@".Data" <- value
              object = cal_img(object)
              audit.trail(object) <-
                niftiAuditTrailEvent(object, "modification", match.call(),
                                     paste(".Data <-", value))               
            } else {
              warning(".Data is not in slotNames of object")
            }                       
            return(object)
          })
#' @rdname img_data-methods
#' @aliases img_data<-,anlz-method
#' @export
setMethod("img_data<-", 
          signature(object = "anlz"), 
          function(object, value) { 
            if ( ".Data" %in% slotNames(object) ) {
              object@".Data" <- value
              object = cal_img(object)
            } else {
              warning(".Data is not in slotNames of object")
            }
            return(object)
          })
