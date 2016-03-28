stream_zip <- function(stream1, stream2) {
    cons_stream(
        c(stream_car(stream1), stream_car(stream2)),
        stream_zip(stream_cdr(stream1), stream_cdr(stream2))
    )
}
