#' Which stream indices are TRUE?
#'
#' @param stream A stream
#' @param predicate A function that returns TRUE or FALSE
#' @param start_from Find indexes on or after this position
#'
#' @export
stream_which <- function(stream, predicate, start_from = 1) {
    ind <- start_from

    while(!predicate(stream_car(stream))) {
        ind <- ind + 1
        stream <- stream_cdr(stream)
    }

    cons_stream(ind,
                stream_which(stream_cdr(stream),
                             predicate,
                             start_from = ind + 1))
}
