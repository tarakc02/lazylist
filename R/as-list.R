#' Export a portion of a stream as a list
#'
#' @param x A stream
#' @param from Starting index
#' @param to Ending index
#' @param ... Not used
#'
#' @export
as.list.lazylist <- function(x, ..., from, to) {
    len <- to - from + 1L
    res <- vector("list", len)
    i <- 1L

    # find the beginning
    while(i < from) {
        x <- stream_cdr(x)
        i <- i + 1L
    }

    # keep adding to res until the end
    while(i <= to) {
        res[[i - from + 1]] <- stream_car(x)
        x <- stream_cdr(x)
        i <- i + 1L
    }
    res
}
