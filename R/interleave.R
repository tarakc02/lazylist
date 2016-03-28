interleave <- function(s1, s2) {
    if (is.null(s1)) s2
    cons_stream(stream_car(s1),
                interleave(s2, stream_cdr(s1)))
}
