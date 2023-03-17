#' Math stuff for qtr objects
#'
#' @param op Arithmetic operation
#' @param x qtr object
#' @param y integer
#'
#' @rdname vctrs-compat
#' @importFrom vctrs vec_arith
#' @method vec_arith qtr
#' @export
#' @export vec_arith.qtr
vec_arith.qtr <- function(op, x, y) {
  UseMethod("vec_arith.qtr", y)
}

#' @rdname vctrs-compat
#' @method vec_arith.qtr default
#' @export
vec_arith.qtr.default <- function(op, x, y) {
  vctrs::stop_incompatible_op(op, x, y)
}

#' @rdname vctrs-compat
#' @method vec_arith.qtr double
#' @export
vec_arith.qtr.double <- function(op, x, y) {
  switch(
    op,
    "+" = qtr_plus(x, y),
    "-" = qtr_minus(x, y),
    vctrs::stop_incompatible_op(op, x, y)
  )
}

qtr_plus <- function(x, y) {
  xo <- qtr_origin(x)
  qtr_ind <- which(vec_cast.character.qtr(x, character()) == quarterly::quarters)
  qtr(quarterly::quarters[qtr_ind + y], origin = xo)
}

qtr_minus <- function(x, y) {
  xo <- qtr_origin(x)
  qtr_ind <- which(vec_cast.character.qtr(x, character()) == quarterly::quarters)
  qtr(quarterly::quarters[qtr_ind - y], origin = xo)
}

#' @rdname vctrs-compat
#' @method vec_arith.qtr qtr
#' @export
vec_arith.qtr.qtr <- function(op, x, y) {
  switch(
    op,
    # "+" = qtr_plus(x, y),
    "-" = qtr_minus_qtr(x, y),
    vctrs::stop_incompatible_op(op, x, y)
  )
}

qtr_minus_qtr <- function(x, y) {
  qtr_indx <- which(vec_cast.character.qtr(x, character()) == quarterly::quarters)
  qtr_indy <- which(vec_cast.character.qtr(y, character()) == quarterly::quarters)
  qtr_indx - qtr_indy - 1
}

