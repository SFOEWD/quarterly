#' Utility functions with qtr
#'
#' @param x qtr object
#' @param orders character vector of date-time formats, passed to parse_date_time
#'
#' @export
#' @rdname qtr-utils
#' @return character
#'
#' @examples
#' q <- qtr(20204, "calendar")
#' qtr_start(q)
#' qtr_end(q)
#' qtr_year(q)
#' qtr_qtr(q)
#' qtr_convert(q)
qtr_start <- function(x) {
  stopifnot(
    "'x' must be a qtr object." = is_qtr(x)
  )
  o <- qtr_origin(x)
  qs <- switch(o,
               "calendar" = quarterly::quarter_starts,
               "fiscal" = quarterly::fy_quarter_starts)
  out <- qs[which(names(qs) == vec_cast.character.qtr(x, character()))]
  unname(out)
}

#' @rdname qtr-utils
#' @export
qtr_end <- function(x) {
  stopifnot(
    "'x' must be a qtr object." = is_qtr(x)
  )
  o <- qtr_origin(x)
  qs <- switch(o,
               "calendar" = quarterly::quarter_ends,
               "fiscal" = quarterly::fy_quarter_ends)
  out <- qs[which(names(qs) == vec_cast.character.qtr(x, character()))]
  unname(out)
}

#' @rdname qtr-utils
#' @export
qtr_year <- function(x) {
  o <- qtr_origin(x)
  y <- as.numeric(substr(vec_cast.integer.qtr(x, integer()), 1, 4))

  if (o == "calendar") return(y)

  if (qtr_qtr(x) %in% c(1, 2)) return(y - 1)

  y
}

#' @rdname qtr-utils
#' @export
qtr_qtr <- function(x) {
  stopifnot(
    "'x' must be a qtr object." = is_qtr(x)
  )
  x_int <- vec_cast.integer.qtr(x, integer())
  x_int - round(x_int, -1)
}

#' @rdname qtr-utils
#' @export
qtr_convert <- function(x) {
  stopifnot(
    "'x' must be a qtr object." = is_qtr(x)
  )
  o <- qtr_origin(x)
  qc <- as.character(x)
  inc <- switch(o,
               "calendar" = c(fiscal = 2),
               "fiscal" = c(calendar = -2))
  out <- quarterly::quarters[which(quarterly::quarters == qc) + inc]
  msg <- paste("Converting to", names(inc), "year-quarter")
  print(msg)
  return(qtr(out, origin = names(inc)))
}
