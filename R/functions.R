#' @export
setClass("MOI_abstract_function")

#' @export
setClass("MOI_abstract_scalar_function", contains = "MOI_abstract_function")

#' @export
#' @include indextypes.R
setClass("MOI_single_variable",
  contains = "MOI_abstract_function",
  slots = c("variable" = "MOI_variable_index")
)

#' @export
single_variable <- function(variable_index) {
  new("MOI_single_variable", variable = variable_index)
}

#' @export
setClass("MOI_scalar_affine_term",
  contains = "MOI_abstract_scalar_function",
  slots = c("coefficient" = "numeric", "variable" = "MOI_variable_index")
)

#' @export
scalar_affine_term <- function(coefficient, variable) {
  new("MOI_scalar_affine_term", coefficient = coefficient, variable = variable)
}

#' @export
setClass("MOI_scalar_affine_function",
  contains = "MOI_abstract_scalar_function",
  slots = c("constant" = "numeric", "terms" = "list")
)

#' @export
scalar_affine_function <- function(terms, constant) {
  if (!is.list(terms)) {
    terms <- as.list(terms)
  }
  new("MOI_scalar_affine_function", terms = terms, constant = constant)
}

#' @export
setClass("MOI_scalar_quadratic_term",
  contains = "MOI_abstract_function",
  slots = c(
    "coefficient" = "numeric",
    "variable1" = "MOI_variable_index",
    "variable2" = "MOI_variable_index"
  )
)

#' @export
scalar_quadratic_term <- function(coefficient, variable1, variable2) {
  new("MOI_scalar_quadratic_term", coefficient = coefficient,
      variable1 = variable1, variable2 = variable2)
}

#' @export
setClass("MOI_scalar_quadratic_function",
  contains = "MOI_abstract_function",
  slots = c(
    "constant" = "numeric",
    "affine_terms" = "list",
    "quadratic_terms" = "list"
  )
)

#' @export
scalar_quadratic_function <- function(quadratic_terms, affine_terms, constant) {
  new("MOI_scalar_quadratic_function", constant = constant,
      affine_terms = affine_terms, quadratic_terms = quadratic_terms)
}
