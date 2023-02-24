## Coercion for qtr prototypes ##

#' @rdname vctrs-compat
#' @importFrom vctrs vec_ptype2 vec_ptype2.double vec_ptype2.integer
#' @method vec_ptype2 qtr
#' @export
#' @export vec_ptype2.qtr
vec_ptype2.qtr <- function(x, y, ...) {
  UseMethod("vec_ptype2.qtr", y)
}

#' @method vec_ptype2.qtr qtr
#' @export
vec_ptype2.qtr.qtr <- function(x, y, ...) {
  # origin <- qtr_origin(y)
  # if (is_qtr(y)) {
  #   y <- vec_cast(y, double())
  # }
  # new_qtr(y, origin = origin)
  # new_qtr(origin = qtr_origin(x))
}

#' @method vec_ptype2.qtr integer
#' @export
vec_ptype2.qtr.integer <- function(x, y, ...) y

#' @method vec_ptype2.integer qtr
#' @export
vec_ptype2.integer.qtr <- function(x, y, ...) x

#' @method vec_ptype2.character qtr
#' @export
vec_ptype2.character.qtr <- function(x, y, ...) x

#' @method vec_ptype2.character qtr
#' @export
vec_ptype2.qtr.character <- function(x, y, ...) y
