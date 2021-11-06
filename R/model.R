#' The abstract model
#' @export
setClass("MOI_abstract_model")

#' A one variable to a model
#' @param model a MOI model
#' @export
setGeneric("moi_add_variable", function(model) {
  standardGeneric("moi_add_variable")
}, valueClass = "MOI_variable_index")

#' Add a constrained variable
#' @param model a MOI model
#' @param set the constraint set of the variable
#' @export
setGeneric("moi_add_constrained_variable", function(model, set) {
  standardGeneric("moi_add_constrained_variable")
}, valueClass = "list")

#' Add variables
#' @param model a MOI model
#' @param n_vars a integer like numeric >= 1
#' @export
setGeneric("moi_add_variables", function(model, n_vars) {
  standardGeneric("moi_add_variables")
}, valueClass = "list")

#' Batch add a number of variables to a model
#' @param model the model
#' @param n_vars the number of variables
#' @export
setMethod("moi_add_variables", signature("MOI_abstract_model", "numeric"), function(model, n_vars) {
  stopifnot(n_vars > 0)
  lapply(seq_len(n_vars), function(i) {
    moi_add_variable(model)
  })
})

#' Add a constraint to a model
#' @param model the model
#' @param func a function in the MOI sense (e.g. a MOI_affine_term)
#' @param set the constraint set
#' @export
setGeneric("moi_add_constraint", function(model, func, set) {
  standardGeneric("moi_add_constraint")
}, valueClass = "MOI_constraint_index")

#' Add a constraint variable
#' @param model a model
#' @param set a set
#' @export
setMethod("moi_add_constrained_variable", signature("MOI_abstract_model", "MOI_abstract_set"), function(model, set) {
  variable <- moi_add_variable(model)
  constraint <- moi_add_constraint(model, moi_single_variable(variable), set)
  list(variable, constraint)
})

#' Check if a model supports something
#' @param model a MOI_model
#' @param type the type it supports
#' @export
setGeneric("moi_supports", function(model, type) {
  standardGeneric("moi_supports")
}, valueClass = "logical")

#' Default implementation supporting model attributes
#' @param model an abstract model
#' @param type the abstract model attribute
#' Should be overwritten.
#' @export
#' @include model-attributes.R
setMethod("moi_supports", signature("MOI_abstract_model", "MOI_abstract_model_attribute"), function(model, type) {
  FALSE
})

#' Default implementation supporting variable attributes
#' @param model an abstract model
#' @param type the abstract variable attribute
#' Should be overwritten.
#' @export
#' @include variable-attributes.R
setMethod("moi_supports", signature("MOI_abstract_model", "MOI_abstract_variable_attribute"), function(model, type) {
  FALSE
})

#' Default implementation supporting constraint attributes
#' @param model an abstract model
#' @param type the abstract constraint attribute
#' Should be overwritten.
#' @export
#' @include constraint-attributes.R
setMethod("moi_supports", signature("MOI_abstract_model", "MOI_abstract_constraint_attribute"), function(model, type) {
  FALSE
})

#' Modify a model
#' @param model the model
#' @param type what you want to modify
#' @param index where you want to modify something
#' @param value the optional value
#' @export
setGeneric("moi_set", function(model, type, index, value) {
  standardGeneric("moi_set")
}, valueClass = "MOI_abstract_model")

#' Get something from a model
#' @param model a MOI model
#' @param type the type to retrieve
#' @param index the index
#' @export
setGeneric("moi_get", function(model, type, index) {
  standardGeneric("moi_get")
}, valueClass = "ANY")

#' Get the primal value of a list of variables
#' @param model the model
#' @param type the variable primal attribute
#' @param index in this case a list of variables
#' @export
setMethod("moi_get", signature("MOI_abstract_model", "MOI_variable_primal_attribute", "list"), function(model, type, index) {
  vapply(index, function(x) moi_get(model, type, x), numeric(1L))
})
