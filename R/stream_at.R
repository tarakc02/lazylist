#' Select elements of a stream
#'
#' @param stream A stream to select from
#' @param filter A stream of TRUE/FALSE values
#' @param index A stream of integer indexes
#'
#' @name subset
#' @export
stream_at <- function(stream, filter) {
    while (!stream_car(filter)) stream <- stream_cdr(stream)
    cons_stream(stream_car(stream),
                stream_at(stream_cdr(stream),
                          stream_cdr(filter)))
}

#' @rdname subset
#' @export
stream_at_index <- function(stream, index) {
    cons_stream(stream_ref(stream, stream_car(index)),
                stream_at_index(stream, stream_cdr(index)))
}
