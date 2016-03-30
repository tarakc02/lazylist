#' Get a single element of a stream
#' @param stream A stream
#' @param n An integer
#' @export
stream_ref <- function(stream, n) UseMethod("stream_ref")
stream_ref.lazylist <- function(stream, n) {
    stopifnot(n > 0)
    if (n == 1) return(stream_car(stream))
    while (n > 1) {
        stream <- stream_cdr(stream)
        n <- n - 1
    }
    stream_car(stream)
}

#' @rdname stream_ref
#' @export
`[.lazylist` <- function(stream, n) stream_ref(stream, n)
