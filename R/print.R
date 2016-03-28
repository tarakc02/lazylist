display_line <- function(s) cat("|  ", s, "\n")
print.lazylist <- function(s, n = 5) {
    stream_for_each(s, display_line, until = n)
    cat("|  ", "...", "\n")
}
