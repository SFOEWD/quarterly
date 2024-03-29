
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
#> <qtr[1]>
#> [1] 20211
q1 - 1
#> <qtr[1]>
#> [1] 20203
q1 - 4
#> <qtr[1]>
#> [1] 20194

qtr_start(q1)
#> [1] "2020-10-01"
qtr_end(q1)
#> [1] "2020-12-31"

qtr_convert(q1)
#> [1] "Converting to fiscal year-quarter"
#> <qtr[1]>
#> [1] 20212

q2 <- qtr(20214)

q2 - q1
#> [1] 3

qtr_yq("2022-02-02", orders = "ymd")
#> <qtr[1]>
#> [1] 20221
qtr_yq("10/31/2021", "mdy", origin = "fiscal")
#> [1] "Converting to fiscal year-quarter"
#> <qtr[1]>
#> [1] 20222

seq(q1, q2)
#> <qtr[5]>
#> [1] 20204 20211 20212 20213 20214
seq(q1, 20232)
#> <qtr[11]>
#>  [1] 20204 20211 20212 20213 20214 20221 20222 20223 20224 20231 20232
seq(q1, 20254, by = 4)
#> <qtr[6]>
#> [1] 20204 20214 20224 20234 20244 20254
```
