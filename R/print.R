display_line <- function(s) cat("|  ", s, "\n")

#' @export
print.lazylist <- function(s, n = 5) {
    stream_for_each(s, display_line, until = n)
    cat("|  ", "...", "\n")
}
