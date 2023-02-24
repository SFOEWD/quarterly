#' @rdname vctrs-compat
#' @method vec_proxy_compare qtr
#' @export
#' @export vec_proxy_compare.qtr
vec_proxy_compare.qtr <- function(x, ...) {
  vctrs::vec_cast(x, double())
}

#' @rdname vctrs-compat
#' @method vec_proxy_equal qtr
#' @export
#' @export vec_proxy_equal.qtr
vec_proxy_equal.qtr <- function(x, ...) {
  vctrs::vec_cast(x, double())
}
