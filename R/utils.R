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
#' q <- qtr(20204)
#' qtr_start(q)
#' qtr_end(q)
#' qtr_year(q)
#' qtr_qtr(q)
qtr_start <- function(x) {
  stopifnot(
    "'x' must be a qtr object." = is_qtr(x)
  )
  out <- quarterly::quarter_starts[which(names(quarterly::quarter_starts) == vec_cast.character.qtr(x, character()))]
  unname(out)
}

#' @rdname qtr-utils
#' @export
qtr_end <- function(x) {
  stopifnot(
    "'x' must be a qtr object." = is_qtr(x)
  )
  out <- quarterly::quarter_ends[which(names(quarterly::quarter_ends) == vec_cast.character.qtr(x, character()))]
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
qtr_yq <- function(x, orders) {
  d <- tryCatch({
    lubridate::parse_date_time(x, orders)
  }, warning = function(w) {
    stop(conditionMessage(w), call. = FALSE)
  })
  paste0(lubridate::year(d), lubridate::quarter("2022-02-02"))
}
