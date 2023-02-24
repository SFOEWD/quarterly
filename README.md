
<!-- README.md is generated from README.Rmd. Please edit that file -->

# quarterly

<!-- badges: start -->
<!-- badges: end -->

The goal of quarterly is to make working with year-quarter data easier.

## Installation

You can install the development version of quarterly like so:

``` r
remotes::install_github("SFOEWD/quarterly")
```

## Examples

``` r
library(quarterly)
q1 <- qtr(20204, origin = "calendar")

q1 + 1
#> [1] "20211"
q1 - 1
#> [1] "20203"
q1 - 4
#> [1] "20194"

qtr_start(q1)
#> [1] "2020-10-01"
qtr_end(q1)
#> [1] "2020-12-31"

q2 <- qtr(20214)

q2 - q1
#> [1] 3
```
