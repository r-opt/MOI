#' @export
setClass("MOI_abstract_set")

#' @export
setClass("MOI_abstract_scalar_set", contains = "MOI_abstract_set")

#' @export
setClass("MOI_abstract_vector_set", contains = "MOI_abstract_set")

#' @export
setClass("MOI_greater_than_set",
  contains = "MOI_abstract_scalar_set",
  slots = c("lower" = "numeric")
)

#' @export
setClass("MOI_less_than_set",
  contains = "MOI_abstract_scalar_set",
  slots = c("upper" = "numeric")
)

#' @export
setClass("MOI_equal_to_set",
  contains = "MOI_abstract_scalar_set",
  slots = c("value" = "numeric")
)

#' @export
setClass("MOI_interval_set",
  contains = "MOI_abstract_scalar_set",
  slots = c("lower" = "numeric", "upper" = "numeric")
)

#' @export
setClass("MOI_integer_set", contains = "MOI_abstract_scalar_set")

#' @export
setClass("MOI_zero_one_set", contains = "MOI_integer_set")

#' @export
integer_set <- new("MOI_integer_set")

#' @export
zero_one_set <- new("MOI_zero_one_set")

#' @export
less_than_set <- function(upper) {
  stopifnot(is.numeric(upper), length(upper) == 1)
  new("MOI_less_than_set", upper = upper)
}

#' @export
greater_than_set <- function(lower) {
  stopifnot(is.numeric(lower), length(lower) == 1)
  new("MOI_greater_than_set", lower = lower)
}

#' @export
interval_set <- function(lower, upper) {
  stopifnot(
    is.numeric(lower), length(lower) == 1,
    is.numeric(upper), length(upper) == 1
  )
  new("MOI_interval_set", lower = lower, upper = upper)
}
