#' An abstract function
#' @export
setClass("MOI_abstract_function")

#' An abstract scalar function
#' @export
setClass("MOI_abstract_scalar_function", contains = "MOI_abstract_function")

#' A single variable
#' @slot variable a MOI Variable Index
#' @export
#' @include indextypes.R
setClass("MOI_single_variable",
  contains = "MOI_abstract_function",
  slots = c("variable" = "MOI_variable_index")
)

#' A single variable
#' @param variable_index a scalar variable index
#' @export
moi_single_variable <- function(variable_index) {
  new("MOI_single_variable", variable = variable_index)
}

#' A scalar affine time
#' @slot variable a MOI Variable Index
#' @slot coefficient a length 1 numeric
#' @export
setClass("MOI_scalar_affine_term",
  contains = "MOI_abstract_scalar_function",
  slots = c("coefficient" = "numeric", "variable" = "MOI_variable_index")
)

#' A scalar affine term
#' @param coefficient a scalar numeric coefficient
#' @param variable a MOI variable
#' @export
moi_scalar_affine_term <- function(coefficient, variable) {
  new("MOI_scalar_affine_term", coefficient = coefficient, variable = variable)
}

#' A scalar affine function
#' @slot terms a list of terms (MOI_scalar_affine_term)
#' @slot constant a length 1 numeric
#' @export
setClass("MOI_scalar_affine_function",
  contains = "MOI_abstract_scalar_function",
  slots = c("constant" = "numeric", "terms" = "list")
)

#' A scalar affine function
#' @param terms a list of affine terms
#' @param constant a constant (scalar numeric)
#' @export
moi_scalar_affine_function <- function(terms, constant) {
  if (!is.list(terms)) {
    terms <- as.list(terms)
  }
  new("MOI_scalar_affine_function", terms = terms, constant = constant)
}

#' A scalar quadratic term
#' @slot variable1 A MOI variable index
#' @slot variable2 A MOI variable index
#' @slot coefficient a length 1 numeric
#' @export
setClass("MOI_scalar_quadratic_term",
  contains = "MOI_abstract_function",
  slots = c(
    "coefficient" = "numeric",
    "variable1" = "MOI_variable_index",
    "variable2" = "MOI_variable_index"
  )
)

#' A scalar quadratic term
#' @param coefficient a scalar numeric
#' @param variable1 a variable
#' @param variable2 another variable
#' @export
moi_scalar_quadratic_term <- function(coefficient, variable1, variable2) {
  new("MOI_scalar_quadratic_term", coefficient = coefficient,
      variable1 = variable1, variable2 = variable2)
}

#' A scalar quadratic function
#' @slot affine_terms a list of affine terms (MOI_scalar_affine_term)
#' @slot quadratic_terms a list of quadratic terms (MOI_scalar_quadratic_term)
#' @slot constant a length 1 numeric
#' @export
setClass("MOI_scalar_quadratic_function",
  contains = "MOI_abstract_function",
  slots = c(
    "constant" = "numeric",
    "affine_terms" = "list",
    "quadratic_terms" = "list"
  )
)

#' A scalar quadratic function
#' @param quadratic_terms A list of quadratic terms
#' @param affine_terms A list of affine terms
#' @param constant a scalar numeric constant
#' @export
moi_scalar_quadratic_function <- function(quadratic_terms,
                                          affine_terms, constant) {
  new("MOI_scalar_quadratic_function", constant = constant,
      affine_terms = affine_terms, quadratic_terms = quadratic_terms)
}
