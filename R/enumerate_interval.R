stream_enumerate_interval <- function(low, high) {
    if (low > high) return(NULL)
    cons_stream(low,
                stream_enumerate_interval(low + 1, high))
}
