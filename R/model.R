#' @export
setClass("MOI_abstract_model")

#' @export
setGeneric("moi_add_variable", function(model) {
  standardGeneric("moi_add_variable")
}, valueClass = "MOI_variable_index")

#' @export
setGeneric("moi_add_constrained_variable", function(model, set) {
  standardGeneric("moi_add_constrained_variable")
}, valueClass = "list")

#' @export
setGeneric("moi_add_variables", function(model, n_vars) {
  standardGeneric("moi_add_variables")
}, valueClass = "list")

#' @export
setMethod("moi_add_variables", signature("MOI_abstract_model", "numeric"), function(model, n_vars) {
  stopifnot(n_vars > 0)
  lapply(seq_len(n_vars), function(i) {
    moi_add_variable(model)
  })
})

#' @export
setGeneric("moi_add_constraint", function(model, func, set) {
  standardGeneric("moi_add_constraint")
}, valueClass = "MOI_constraint_index")

#' @export
setMethod("moi_add_constrained_variable", signature("MOI_abstract_model"), function(model, set) {
  variable <- moi_add_variable(model)
  constraint <- moi_add_constraint(model, moi_single_variable(variable), set)
  list(variable, constraint)
})

#' @export
setGeneric("moi_supports", function(model, type) {
  standardGeneric("moi_supports")
}, valueClass = "logical")

#' @export
#' @include model-attributes.R
setMethod("moi_supports", signature("MOI_abstract_model", "MOI_abstract_model_attribute"), function(model, type) {
  FALSE
})

#' @export
#' @include variable-attributes.R
setMethod("moi_supports", signature("MOI_abstract_model", "MOI_abstract_variable_attribute"), function(model, type) {
  FALSE
})

#' @export
#' @include constraint-attributes.R
setMethod("moi_supports", signature("MOI_abstract_model", "MOI_abstract_constraint_attribute"), function(model, type) {
  FALSE
})

#' @export
setGeneric("moi_set", function(model, type, index, value) {
  standardGeneric("moi_set")
}, valueClass = "MOI_abstract_model")

#' @export
setGeneric("moi_get", function(model, type, index) {
  standardGeneric("moi_get")
}, valueClass = "ANY")

#' @export
setMethod("moi_get", signature("MOI_abstract_model", "MOI_variable_primal_attribute", "list"), function(model, type, index) {
  vapply(index, function(x) moi_get(model, type, x), numeric(1L))
})
