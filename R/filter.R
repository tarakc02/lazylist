stream_filter <- function(stream, predicate) UseMethod("stream_filter")
stream_filter.lazylist <- function(stream, predicate) {
    if (predicate(stream_car(stream)))
        cons_stream(stream_car(stream), stream_filter(stream_cdr(stream), predicate))
    else stream_filter(stream_cdr(stream), predicate)
}
