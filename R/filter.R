#' Filter a stream using a predicate function
#'
#' @param stream The stream to be filtered
#' @param predicate A function that takes a stream element as an argument, and returns TRUE/FALSE
#' @export
stream_filter <- function(stream, predicate) UseMethod("stream_filter")

#' @export
stream_filter.lazylist <- function(stream, predicate) {
    while(!predicate(stream_car(stream))) stream <- stream_cdr(stream)
    cons_stream(stream_car(stream),
                stream_filter(stream_cdr(stream), predicate))
}
