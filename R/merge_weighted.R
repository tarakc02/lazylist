merge_weighted <- function(stream1, stream2, weight) {
    if (is.null(stream1)) stream2
    if (is.null(stream2)) stream1

    s1car <- stream_car(stream1)
    s2car <- stream_car(stream2)

    if (weight(s1car) <= weight(s2car))
        return(cons_stream(s1car, merge_weighted(stream_cdr(stream1), stream2, weight)))

    if (weight(s1car) > weight(s2car))
        return(cons_stream(s2car, merge_weighted(stream1, stream_cdr(stream2), weight)))
}
