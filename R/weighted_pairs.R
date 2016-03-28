weighted_pairs <- function(s1, s2, weight) {
    cons_stream(c(stream_car(s1), stream_car(s2)),
                merge_weighted(
                    stream_map(stream_cdr(s2),
                               function(x) c(stream_car(s1), x)),
                    weighted_pairs(stream_cdr(s1),
                                   stream_cdr(s2),
                                   weight),
                    weight))
}
