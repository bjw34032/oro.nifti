#' @name origin-methods
#' @title Extract Image Attribute \code{origin}
#' @docType methods 
#' @param object is an object of class \code{nifti} or \code{anlz}.
#' @param value is the value to assign to the \code{origin} field.  
#' @description Methods that act on the \code{origin} field in the
#' NIfTI/ANALYZE header.
#' @rdname origin-methods
#' @aliases origin-methods, origin
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
#' @examples 
#' fname = system.file("nifti", "mniRL.nii.gz", 
#' package = "oro.nifti")
#' img = readNIfTI(fname)
#' oimg = origin(img)
#' stopifnot(all(oimg == c(-90, -126, -72)))
#' zero_img = img
#' origin(zero_img) = rep(0, 3)
#' stopifnot(all(origin(zero_img) == 0))
setGeneric("origin", function(object) standardGeneric("origin"))

#' @rdname origin-methods
#' @aliases origin,nifti-method
#' @export
setMethod("origin", "nifti", function(object) {
  c(srow_x(object)[4],
    srow_y(object)[4],
    srow_z(object)[4])
})


#' @rdname origin-methods
#' @aliases origin,anlz-method
#' @export
setMethod("origin", "anlz", function(object) object@"origin")
#' @rdname origin-methods
#' @aliases origin,ANY-method
#' @export
#' @importFrom RNifti origin
setMethod("origin", "ANY", function(object) { 
  if (inherits(object, "niftiImage")) {
    return(RNifti::origin(object))
  } 
  stop("origin not implemented for this type!")
})
#' @rdname origin-methods
#' @aliases origin<- 
#' @export
setGeneric("origin<-", function(object, value) standardGeneric("origin<-"))
#' @rdname origin-methods
#' @aliases origin<-,anlz-method
#' @export
setMethod("origin<-", 
          signature(object = "anlz"), 
          function(object, value) { 
            if ( "origin" %in% slotNames(object) ) {
              object@"origin" <- value
            } else {
              warning("origin is not in slotNames of object")
            }
            return(object)
          })

#' @rdname origin-methods
#' @aliases origin<-,nifti-method
#' @export
setMethod("origin<-",
          signature(object = "nifti"), 
          function(object, value) {
            stopifnot(length(value) == 3)
            sx = srow_x(object)
            sy = srow_y(object)
            sz = srow_z(object)
            sx[4] = value[1]
            sy[4] = value[2]
            sz[4] = value[3]
            srow_x(object) = sx
            srow_y(object) = sy
            srow_z(object) = sz
            return(object)
          })
