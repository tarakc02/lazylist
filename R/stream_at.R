#' Select elements of a stream
#' 
#' @param stream A stream to select from
#' @param filter A stream of TRUE/FALSE values
#' @export
stream_at <- function(stream, filter) {
    if (stream_car(filter))
        return(cons_stream(
            stream_car(stream),
            stream_at(stream_cdr(stream),
                      stream_cdr(filter))
        ))
    else
        stream_at(
            stream_cdr(stream),
            stream_cdr(filter)
        )
}
