#' Compare the origins of two qtr objects.
#'
#' @param x an object of class qtr.
#' @param y an object of class qtr.
#'
#' @return logical
#' @export
origins_check <- function(x, y) {
  if (!identical(qtr_origin(x), qtr_origin(y))) {
    stop(call. = FALSE, "quarters must share origins.")
  }
}
