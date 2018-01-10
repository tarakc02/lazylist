#' @export
empty_stream <- function() {
    structure(cons_stream(NULL, empty_stream()),
              class = c("emptystream", "lazylist"))
}

#' @export
is_emptystream <- function(s) {
    inherits(s, "emptystream") ||
        is.null(s) ||
        is.null(stream_car(s))
}

#' @export
stream_map.emptystream <- function(s, f, ...) empty_stream()

#' @export
stream_filter.emptystream <- function(stream, predicate) empty_stream()

#' @export
as.list.emptystream <- function(x, ..., from, to) {
    vector("list", to - from + 1L)
}
