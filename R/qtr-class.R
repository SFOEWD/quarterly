## Define qtr class ##

# The quarter class must have an 'origin', either 'calendar' or 'fiscal'

# 1. Constructor ----------------------------------------------------------

#' Internal constructor to create qtr type
#' Can be cast from either character or double
#' @keywords internal
#' @export
new_qtr <- function(x = double(), origin = c("calendar", "fiscal")) {
  # stopifnot(vctrs::vec_is(x, character()) | vctrs::vec_is(x, double()) | vctrs::vec_is(x, term()))
  origin <- match.arg(origin)
  stopifnot(
    "Quarters are 4 digit years followed by the quarter" = grepl("^\\d{5}$", x),
    "Quarters must end in 1, 2, 3, or 4" = grepl("[1-4]$", x)
  )

  vctrs::new_vctr(x, origin = origin, class = "qtr")
  # attr(out, "acad_year") <- acad_year(out)
  # attr(out, "cal_year") <- cal_year(out)
  # return(out)
}


# 2. Helper ---------------------------------------------------------------

#' A class for quarters
#'
#' @param x A character or double vector
#' @param origin either 'cs' or 'sims'
#' @export
qtr <- function(x, origin = c("calendar", "fiscal")) {
  origin <- match.arg(origin)
  new_qtr(x, origin)
}

# 3. Formally declare S3 class --------------------------------------------

#' @importFrom methods setOldClass
setOldClass(c("qtr", "vctrs_vctr"))

#' Get qtr origin
#'
#' @param x a term object
#'
#' @export
qtr_origin <- function(x) {
  stopifnot(is_qtr(x))
  attr(x, "origin")
}

#' Test if an object is of class 'qtr'
#'
#' @param x An object
#'
#' @export
is_qtr <- function(x) {inherits(x, "qtr")}


#' Cast an object to qtr
#'
#' @param x An object
#' @param origin Either 'calendar' or 'fiscal'
#'
#' @return An object of class 'qtr'
#' @export
as_qtr <- function(x, origin = c("calendar", "fiscal")) {
  origin <- match.arg(origin)
  new_qtr(x, origin = origin)
}
