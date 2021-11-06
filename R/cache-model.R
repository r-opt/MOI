#' In-Memory backend that simply stores everything in-memory
#'
#' @keywords internal
#' @include model.R
#' @rdname CacheModelClass-class
#' @export
setClass("cache_model_class", contains = "MOI_abstract_model", slot = c(ptr = "ANY"))

CacheModelClassR6 <- R6::R6Class(
  "CacheModelClassR6",
  public = list(
    variables = list(),
    variable_map = fastmap::fastmap(),
    add_constraint = function(func, set) {
      constr <- new("MOI_constraint_index", value = private$new_constraint_id())
      private$variable_constraints <- c(private$variable_constraints,
                                        list(list(constr, func, set)))
      constr
    }
  ),
  private = list(
    variable_constraints = list(),
    n_constraints = 0,
    new_constraint_id = function() {
      private$n_constraints <- private$n_constraints + 1
    }
  )
)

#' Create a new cache_model
#'
#' @export
moi_cache_model <- function() {
  new("cache_model_class", ptr = CacheModelClassR6$new())
}

#' @export
#' @rdname CacheModelClass-class
setMethod("moi_supports", signature("cache_model_class", "MOI_variable_index_attribute"), function(model, type) {
  TRUE
})

#' @export
#' @rdname CacheModelClass-class
setMethod("moi_get", signature("cache_model_class", "MOI_variable_index_attribute", "character"), function(model, type, index) {
  model@ptr$variable_map$get(index)
})

#' @export
#' @rdname CacheModelClass-class
setMethod("moi_supports", signature("cache_model_class", "MOI_variable_name_attribute"), function(model, type) {
  TRUE
})

#' @export
#' @include indextypes.R
#' @rdname CacheModelClass-class
setMethod("moi_set", signature("cache_model_class", "MOI_variable_name_attribute", "MOI_variable_index", "character"), function(model, type, index, value) {
  model@ptr$variable_map$set(value, index)
  model
})

#' @export
#' @include functions.R
#' @rdname CacheModelClass-class
setMethod("moi_set", signature("cache_model_class", "MOI_objective_function", "MOI_scalar_affine_function", "missing"), function(model, type, index, value) {
  model
})

#' @export
#' @include model-attributes.R
#' @rdname CacheModelClass-class
setMethod("moi_set", signature("cache_model_class", "MOI_objective_sense", "numeric", "missing"), function(model, type, index, value) {
  model
})


#' @export
#' @rdname CacheModelClass-class
setMethod("moi_add_variable", signature("cache_model_class"), function(model) {
  variable <- new("MOI_variable_index", value = length(model@ptr$variables) + 1)
  model@ptr$variables <- c(model@ptr$variables, list(variable))
  variable
})

#' @export
#' @rdname CacheModelClass-class
#' @include sets.R
setMethod("moi_add_constraint", signature("cache_model_class", "MOI_abstract_function", "MOI_abstract_set"), function(model, func, set) {
  model@ptr$add_constraint(func, set)
})

#' @export
#' @rdname CacheModelClass-class
setMethod("moi_add_constraint", signature("cache_model_class", "MOI_abstract_index", "MOI_abstract_set"), function(model, func, set) {
  model@ptr$add_constraint(func, set)
})

#' Add a constraint variable to a cached model
#' @export
#' @rdname CacheModelClass-class
setMethod("moi_add_constrained_variable", signature("cache_model_class", "MOI_abstract_set"), function(model, set) {
  variable <- moi_add_variable(model)
  constraint <- moi_add_constraint(model, variable, set)
  list(variable, constraint)
})
