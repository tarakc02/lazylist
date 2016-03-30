#' Map a function onto a stream or streams
#' 
#' @param s A single stream, or a list of streams, to be used as function arguments
#' @param f A function that takes the appropriate number of arguments
#' 
#' @export
stream_map <- function(s, f, ...) UseMethod("stream_map")

#' @export
stream_map.lazylist <- function(s, f, ...) {
    cons_stream(f(stream_car(s, ...)), stream_map(stream_cdr(s), f))
}

#' @export
stream_map.NULL <- function(s, f, ...) NULL

#' @export
stream_map.list <- function(argstreams, f) {
    if (is.null(argstreams[[1]])) NULL

    x <- do.call(f, Map(stream_car, argstreams))
    cons_stream(x,
                stream_map(
                    Map(stream_cdr,
                        argstreams), f))
}
