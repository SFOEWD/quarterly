#' @export
seq.qtr <- function(from, to, by = 1) {
  stopifnot(
    "'from' must be a qtr object." = is_qtr(from)
  )
  o <- qtr_origin(from)
  inds <- which(quarterly::quarters %in% c(as.character(from), to))
  out <- quarterly::quarters[inds[1]:inds[2]]
  out <- out[seq(1, length(out), by)]
  qtr(out, origin = o)
}
