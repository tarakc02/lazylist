pairs <- function(s, t) {
    cons_stream(c(stream_car(s), stream_car(t)),
                interleave(
                    stream_map(
                        stream_cdr(t),
                        function(x) c(stream_car(s), x)),
                    pairs(stream_cdr(s), stream_cdr(t))
                ))
}
