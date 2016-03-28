cons_stream <- function(x, y) {
    evaly <- NULL
    structure(list(x = x,
                   y = function() {
                       if (is.null(evaly)) evaly <<- force(y)
                       evaly
                   }),
              class = "lazylist")
}

stream_car <- function(stream) UseMethod("stream_car")
stream_car.lazylist <- function(stream) stream$x
stream_car.NULL <- function(stream) stop("Index out of bounds")

stream_cdr <- function(stream) UseMethod("stream_cdr")
stream_cdr.lazylist <- function(stream) stream$y()
stream_cdr.NULL <- function(stream) stop("Index out of bounds")

shift_right <- function(stream) stream_cdr(stream)

as.lazylist <- function(x) {
    n <- length(x)
    if (n <= 0) return()
    cons_stream(x[[1]], as.lazylist(x[-1]))
}
