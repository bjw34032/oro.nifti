#############################################################################
## slice_overlay() for class="nifti"
#############################################################################
#' Methods for Function slice_overlay
#' 
#' Methods for function \code{slice_overlay}
#' 
#' The \code{image} command is used multiple times to simultaneously visualize
#' one of the three orthogonal planes in two multidimensional arrays, one on
#' top of the other, for medical imaging data.
#' 
#' @name slice_overlay-methods
#' @aliases slice_overlay slice_overlay-methods slice_overlay,nifti,nifti-method
#' slice_overlay,nifti,anlz-method slice_overlay,nifti,array-method
#' slice_overlay,anlz,nifti-method slice_overlay,anlz,anlz-method slice_overlay,anlz,array-method
#' slice_overlay,array,nifti-method slice_overlay,array,anlz-method
#' slice_overlay,array,array-method slice_overlay,afni,afni-method
#' slice_overlay,afni,array-method slice_overlay.nifti
#' @docType methods
#' @param x,y is an object of class \code{nifti} or similar.
#' @param z is the slice to be displayed (ignored when \code{plot.type =
#' "multiple"}).
#' @param w is the time point to be displayed (4D arrays only).
#' @param col.x is grayscale (by default).
#' @param col.y is hotmetal (by default).
#' @param zlim.x,zlim.y are set to \code{NULL} (by default) and taken from the
#' header information.
#' @param plane is the plane of acquisition to be displayed (choices are
#' \sQuote{axial}, \sQuote{coronal}, \sQuote{sagittal}).
#' @param xlab is set to \dQuote{} since all margins are set to zero.
#' @param ylab is set to \dQuote{} since all margins are set to zero.
#' @param axes is set to \code{FALSE} since all margins are set to zero.
#' @param oma is the size of the outer margins in the \code{par} function.
#' @param mar is the number of lines of margin in the \code{par} function.
#' @param bg is the background color in the \code{par} function.
#' @param NA.x Set any values of 0 in \code{x} to \code{NA}
#' @param NA.y Set any values of 0 in \code{y} to \code{NA} 
#' @param useRaster if \code{TRUE}, a bitmap raster is used to plot 
#' the image instead of polygons. Passed to \code{\link[graphics]{image}} 
#' @param \dots other arguments to the \code{image} function may be provided
#' here.
#' @section Methods: 
#' \describe{ 
#' \item{x = "nifti", y = "nifti"}{Produce slice_overlay of \code{y} on \code{x}.} 
#' \item{x = "anlz", y = "anlz"}{Produce slice_overlay of \code{y} on \code{x}.} 
#' \item{x = "afni", y = "afni"}{Produce slice_overlay of \code{y} on \code{x}.} 
#' }
#' @author Brandon Whitcher \email{bwhitcher@@gmail.com}
#' @seealso \code{\link{image-methods}}, \code{\link{slice_overlay-methods}}
#' @keywords methods
#' @export
#' @rdname slice_overlay-methods
slice_overlay.nifti <- function(x, y, z=1, w=1, col.x=gray(0:64/64),
                          col.y=hotmetal(), zlim.x=NULL, zlim.y=NULL,
                          plane=c("axial", "coronal", "sagittal"),
                          xlab="", ylab="", axes=FALSE, oma=rep(0,4),
                          mar=rep(0,4), bg="black",
                          NA.x = FALSE,
                          NA.y = TRUE,   
                          useRaster = TRUE,
                          ...) {
  overlay.nifti(
    x = x,
    y = y,
    z = z,
    w = w,
    col.x = col.x,
    col.y = col.y,
    zlim.x = zlim.x,
    zlim.y = zlim.y,
    plane = plane,
    plot.type = "single",
    xlab = xlab,
    ylab = ylab,
    axes = axes,
    oma = oma,
    mar = mar,
    bg = bg,
    NA.x = NA.x,
    NA.y = NA.y,
    useRaster = useRaster,
    ...
  )
}
#' @export
#' @rdname slice_overlay-methods
setGeneric("slice_overlay", function(x, y, ...) standardGeneric("slice_overlay"))
#' @export
#' @rdname slice_overlay-methods
setMethod("slice_overlay", signature(x="nifti", y="missing"), slice_overlay.nifti)
#' @export
#' @rdname slice_overlay-methods
setMethod("slice_overlay", signature(x="nifti", y="nifti"), slice_overlay.nifti)
#' @export
#' @rdname slice_overlay-methods
setMethod("slice_overlay", signature(x="anlz", y="anlz"), slice_overlay.nifti)
#' @export
#' @rdname slice_overlay-methods
setMethod("slice_overlay", signature(x="anlz", y="nifti"), slice_overlay.nifti)
#' @export
#' @rdname slice_overlay-methods
setMethod("slice_overlay", signature(x="nifti", y="anlz"), slice_overlay.nifti)
#' @export
#' @rdname slice_overlay-methods
setMethod("slice_overlay", signature(x="array", y="array"),
          function(x, y, ...) {
            x <- as(x, "nifti")
            y <- as(y, "nifti")
            slice_overlay.nifti(x, y, ...)
          })
#' @export
#' @rdname slice_overlay-methods
setMethod("slice_overlay", signature(x="array", y="nifti"),
          function(x, y, ...) {
            x <- as(x, "nifti")
            slice_overlay.nifti(x, y, ...)
          })
#' @export
#' @rdname slice_overlay-methods
setMethod("slice_overlay", signature(x="nifti", y="array"),
          function(x, y, ...) {
            y <- as(y, "nifti")
            slice_overlay.nifti(x, y, ...)
          })
#' @export
#' @rdname slice_overlay-methods
setMethod("slice_overlay", signature(x="array", y="anlz"),
          function(x, y, ...) {
            x <- as(x, "nifti")
            slice_overlay.nifti(x, y, ...)
          })
#' @export
#' @rdname slice_overlay-methods
setMethod("slice_overlay", signature(x="anlz", y="array"),
          function(x, y, ...) {
            y <- as(y, "nifti")
            slice_overlay.nifti(x, y, ...)
          })
#' @export
#' @rdname slice_overlay-methods
setMethod("slice_overlay", signature(x="afni", y="afni"),
          function(x, y, ...) {
            x <- as(x, "nifti")
            y <- as(y, "nifti")
            slice_overlay.nifti(x, y, ...)
          })
#' @export
#' @rdname slice_overlay-methods
setMethod("slice_overlay", signature(x="afni", y="array"),
          function(x, y, ...) {
            x <- as(x, "nifti")
            slice_overlay.nifti(x, y, ...)
          })
