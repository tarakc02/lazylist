#' @export
stream_accumulate <- function(s, f, ..., init) UseMethod("stream_accumulate")

#' @export
stream_accumulate.emptystream <- function(s, f, ..., init) empty_stream()

#' @export
stream_accumulate.lazylist <- function(s, f, ..., init) {
    if (!missing(init))
        to_reduce <- cons_stream(init, s)
    else to_reduce <- s

    this <- stream_car(to_reduce)
    rest <- stream_cdr(to_reduce)

    this_res <- f(this, stream_car(rest))
    cons_stream(this_res,
                stream_accumulate(stream_cdr(rest), f, ..., init = this_res))
}
