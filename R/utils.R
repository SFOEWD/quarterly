#' Utility functions with qtr
#'
#' @param x qtr object
#' @param orders character vector of date-time formats, passed to parse_date_time
#' @param origin either 'calendar' or 'fiscal'
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

#' @rdname qtr-utils
#' @export
qtr_yq <- function(x, orders, origin = "calendar") {
  stopifnot(
    "origin must be either calendar or fiscal" = origin %in% c("calendar", "fiscal")
  )
  d <- tryCatch({
    lubridate::parse_date_time(x, orders)
  }, warning = function(w) {
    stop(conditionMessage(w), call. = FALSE)
  })
  d <- lubridate::quarter(d, "year.quarter")
  d <- gsub("\\.", "", d)
  d <- qtr(d, "calendar")
  if (origin == "fiscal") return(qtr_convert(d))
  d
}

#' @rdname qtr-utils
#' @export
qtr_current <- function() {
  qtr_yq(Sys.Date(), "ymd")
}
