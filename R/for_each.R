#' Perform a function on each element of a stream (without returning values)
#' @details This function is only useful for the side effects of \code{fun}
#' @param stream A stream
#' @param fun A function to perform
#' @param until How many iterations
#' @export
stream_for_each <- function(stream, fun, until = 5) UseMethod("stream_for_each")

#' @export
stream_for_each.lazylist <- function(stream, fun, until = 5) {
    while (until > 0 && !is_emptystream(stream)) {
        fun(stream_car(stream))
        stream <- stream_cdr(stream)
        if (!inherits(stream, "lazylist")) {
            fun(stream)
            return()
        }
        until <- until - 1
    }
}
