#' Create a stream
#' 
#' @param x An object
#' @param y An object
#' @export
cons_stream <- function(x, y) {
    evaly <- NULL
    structure(list(x = x,
                   y = function() {
                       if (is.null(evaly)) evaly <<- force(y)
                       evaly
                   }),
              class = "lazylist")
}

#' Stream accessors
#' 
#' \code{stream_car} returns the first element of a stream, and 
#' \code{stream_cdr} returns the rest of the stream
#' 
#' @param stream A stream
#' @export
stream_car <- function(stream) UseMethod("stream_car")

#' @export
stream_car.lazylist <- function(stream) stream$x

#' @export
stream_car.NULL <- function(stream) stop("Index out of bounds")

#' @rdname stream_car
#' @export
stream_cdr <- function(stream) UseMethod("stream_cdr")

#' @export
stream_cdr.lazylist <- function(stream) stream$y()

#' @export
stream_cdr.NULL <- function(stream) stop("Index out of bounds")

#' Shift a stream to the left
#' 
#' When viewing streams as sequences, \code{stream_cdr} is equivalent to 
#' left-shifting the sequence. This function is just for convenience and readability
#' 
#' @param stream A stream
#' @export
shift_left <- function(stream) stream_cdr(stream)

#' @export
as.lazylist <- function(x) {
    n <- length(x)
    if (n <= 0) return()
    cons_stream(x[[1]], as.lazylist(x[-1]))
}
