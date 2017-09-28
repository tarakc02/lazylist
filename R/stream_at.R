#' Select elements of a stream
#'
#' @param stream A stream to select from
#' @param filter A stream of TRUE/FALSE values
#' @export
stream_at <- function(stream, filter) {
    while (!stream_car(filter)) stream <- stream_cdr(stream)
    cons_stream(stream_car(stream),
                stream_at(stream_cdr(stream),
                          stream_cdr(filter)))
}
