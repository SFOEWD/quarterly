## Casting for qtr ##

#' @rdname vctrs-compat
#' @importFrom vctrs vec_cast vec_ptype2 vec_cast.integer vec_ptype2.character vec_proxy_compare vec_proxy_equal
#' @method vec_cast qtr
#' @export
#' @export vec_cast.qtr
vec_cast.qtr <- function(x, to, ...) UseMethod("vec_cast.qtr")

#' @method vec_cast.qtr default
#' @export
vec_cast.qtr.default <- function(x, to, ...) {
  vctrs::vec_default_cast(x, to)
}

#' @importFrom vctrs vec_cast.double
#' @method vec_cast.qtr double
#' @export
vec_cast.qtr.double <- function(x, to, origin = c("calendar", "fiscal"), ...) {
  origin <- match.arg(origin)
  qtr(x, origin)
}

#' @method vec_cast.qtr qtr
#' @export
vec_cast.qtr.qtr <- function(x, to, ...) {
  x
}

#' @export
vec_ptype2.qtr.qtr <- function(x, y, ...) {
  x
}

#' @export
vec_ptype2.qtr.integer <- function(x, y, ...) {
  y
}

#' @export
vec_ptype2.qtr.double <- function(x, y, ...) {
  y
}
#' @export
vec_ptype2.double.qtr <- function(x, y, ...) {
  x
}


#' @method vec_cast.qtr character
#' @export
vec_cast.qtr.character <- function(x, to, origin = c("calendar", "fiscal"), ...) {
  origin <- match.arg(origin)
  qtr(x, origin)
}

#' @method vec_cast.integer qtr
#' @export
vec_cast.integer.qtr <- function(x, to, ...) {
  attributes(x) <- NULL
  as.integer(x)
}

#' @method vec_cast.double qtr
#' @export
vec_cast.double.qtr <- function(x, to, ...) {
  attributes(x) <- NULL
  as.double(x)
}

#' @importFrom vctrs vec_cast.character
#' @method vec_cast.character qtr
#' @export
vec_cast.character.qtr <- function(x, to, ...) {
  attributes(x) <- NULL
  as.character(x)
}


