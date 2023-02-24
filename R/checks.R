## Checks ##

#' @export
origins_check <- function(x, y) {
  if (!identical(qtr_origin(x), qtr_origin(y))) {
    stop(call. = FALSE, "quarters must share origins.")
  }
}
