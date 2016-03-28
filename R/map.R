stream_map <- function(s, f, ...) UseMethod("stream_map")
stream_map.lazylist <- function(s, f, ...) {
    cons_stream(f(stream_car(s, ...)), stream_map(stream_cdr(s), f))
}
stream_map.NULL <- function(s, f, ...) NULL
stream_map.list <- function(argstreams, f) {
    if (is.null(argstreams[[1]])) NULL

    x <- do.call(f, Map(stream_car, argstreams))
    cons_stream(x,
                stream_map(
                    Map(stream_cdr,
                        argstreams), f))
}
