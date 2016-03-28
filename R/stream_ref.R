stream_ref <- function(s, n) UseMethod("stream_ref")
stream_ref.lazylist <- function(s, n) {
    stopifnot(n > 0)
    if (n == 1) return(stream_car(s))
    while (n > 1) {
        s <- stream_cdr(s)
        n <- n - 1
    }
    stream_car(s)
}

`[.lazylist` <- function(s, n) stream_ref(s, n)
