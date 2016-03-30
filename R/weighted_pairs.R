#' Create a stream of (ordered) pairs, from two individual streams
#' 
#' The output stream will be ordered in ascending order of the weight function on 
#' each pair.
#' 
#' @param s1 A stream
#' @param s2 A stream
#' @param weight a weight function that is used to order the resulting stream
#' @export
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
