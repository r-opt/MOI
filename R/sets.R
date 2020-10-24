#' An abstract set
#'
#' @export
setClass("MOI_abstract_set")

#' An abstract scalar set
#'
#' @export
setClass("MOI_abstract_scalar_set", contains = "MOI_abstract_set")

#' An abstract vector set
#'
#' @export
setClass("MOI_abstract_vector_set", contains = "MOI_abstract_set")

#' An greater than or equal set
#'
#' @slot lower A length-one numeric vector
#' @export
setClass("MOI_greater_than_set",
  contains = "MOI_abstract_scalar_set",
  slots = c("lower" = "numeric")
)

#' An less than or equal set
#'
#' @slot upper A length-one numeric vector
#' @export
setClass("MOI_less_than_set",
  contains = "MOI_abstract_scalar_set",
  slots = c("upper" = "numeric")
)

#' An equal-to set
#'
#' @slot value A length-one numeric vector
#' @export
setClass("MOI_equal_to_set",
  contains = "MOI_abstract_scalar_set",
  slots = c("value" = "numeric")
)

#' An interval set
#'
#' @slot lower A length-one numeric vector
#' @slot upper A length-one numeric vector
#' @export
setClass("MOI_interval_set",
  contains = "MOI_abstract_scalar_set",
  slots = c("lower" = "numeric", "upper" = "numeric")
)

#' An integer set
#'
#' All elements must be integral.
#'
#' @export
setClass("MOI_integer_set", contains = "MOI_abstract_scalar_set")

#' A set of binaries
#'
#' All elements must be integral and 0/1.
#'
#' @export
setClass("MOI_zero_one_set", contains = "MOI_integer_set")

#' An instance of an integer set
#'
#' @export
integer_set <- new("MOI_integer_set")

#' An instance of an equal-to set
#'
#' @param value a length 1 numeric vector
#'
#' @export
equal_to_set <- function(value) {
  stopifnot(is.numeric(value), length(value) == 1)
  new("MOI_equal_to_set", value = value)
}

#' An instance of a set of binaries
#'
#' All elements must be integral and 0/1.
#'
#' @export
zero_one_set <- new("MOI_zero_one_set")

#' An instance of a less than or equal set
#'
#' @param upper a length 1 numeric vector
#'
#' @export
less_than_set <- function(upper) {
  stopifnot(is.numeric(upper), length(upper) == 1)
  new("MOI_less_than_set", upper = upper)
}

#' An instance of a greater than or equal set
#'
#' @param lower a length 1 numeric vector
#'
#' @export
greater_than_set <- function(lower) {
  stopifnot(is.numeric(lower), length(lower) == 1)
  new("MOI_greater_than_set", lower = lower)
}

#' An instance of an interval set
#'
#' @param lower a length 1 numeric vector
#' @param upper a length 1 numeric vector
#'
#' @export
interval_set <- function(lower, upper) {
  stopifnot(
    is.numeric(lower), length(lower) == 1,
    is.numeric(upper), length(upper) == 1
  )
  new("MOI_interval_set", lower = lower, upper = upper)
}
