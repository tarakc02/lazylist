
<!-- README.md is generated from README.Rmd. Please edit that file -->
lazylist
========

Lazy lists, or streams, are like lists but have delayed evaluation, allowing for the possibility of representing infinite sequences, among other things. This implementation is a direct translation of what is laid out in the book Structure and Interpretation of Computer Programs.

Basics
------

Create an empty stream using `empty_stream()`, or construct a new stream by attaching a head element to an existing stream using `cons_stream`:

``` r
library(lazylist)
empty_stream()
#> |   ...
cons_stream(1, empty_stream())
#> |   1 
#> |   ...
```

The tail of a stream is lazily evaluated, which allows for recursive definitions of infinite sequences:

``` r
integers_starting_from <- function(n) 
    cons_stream(n, integers_starting_from(n + 1))
integers <- integers_starting_from(1)
integers
#> |   1 
#> |   2 
#> |   3 
#> |   4 
#> |   5 
#> |   ...
```

Stream versions of the functionals `map`, `accumulate`, and `filter` are available:

``` r
# squares
stream_map(integers, function(x) x**2)
#> |   1 
#> |   4 
#> |   9 
#> |   16 
#> |   25 
#> |   ...

# running sub-total
stream_accumulate(integers, function(x, y) x + y, init = 0)
#> |   1 
#> |   3 
#> |   6 
#> |   10 
#> |   15 
#> |   ...

# only the evens:
stream_filter(integers, function(x) x%%2 == 0)
#> |   2 
#> |   4 
#> |   6 
#> |   8 
#> |   10 
#> |   ...
```

To access components of a stream, use `stream_car` (for the head) or `stream_cdr` (for the rest):

``` r
stream_car(integers)
#> [1] 1

stream_cdr(integers)
#> |   2 
#> |   3 
#> |   4 
#> |   5 
#> |   6 
#> |   ...
```

Examples/tutorials
------------------

To see how lazy lists can be useful in practice, see:

-   [Solving the 8-puzzle with lazy evaluation](https://tarakc02.github.io/puzzle8/): uses lazily evaluated lists to implement A\* search to find the shortest solution to a tile-puzzle.
-   [Lazy lists and branch-and-bound](https://tarakc02.github.io/branch-and-bound/): uses lazy lists to implement a flexible branch-and-bound search to solve the knapsack problem
-   [Searching for Ramanujan's taxicab numbers](https://tarakc02.github.io/taxicab/): Using lazily evaluated lists to find integers that can be expressed as the sum of two cubes in two different ways, such as 1729 (which is 1<sup>3</sup> + 12<sup>3</sup> as well as 9<sup>3</sup> + 10<sup>3</sup>)

Installation
------------

You can install lazylist from github with:

``` r
# install.packages("devtools")
devtools::install_github("tarakc02/lazylist")
```
