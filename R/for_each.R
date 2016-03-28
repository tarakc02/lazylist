stream_for_each <- function(s, f, until = 5) UseMethod("stream_for_each")
stream_for_each.lazylist <- function(s, f, until = 5) {
    while (until > 0 && !is.null(s)) {
        f(stream_car(s))
        s <- stream_cdr(s)
        until <- until - 1
    }
}
