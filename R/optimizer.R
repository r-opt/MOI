#' An abstract optimizer
#' @export
#' @include model.R
setClass("MOI_abstract_optimizer", contains = "MOI_abstract_model")

#' Optimize a model
#' @param model a MOI_abstract_model
#' @export
setGeneric("moi_optimize", function(model) {
  standardGeneric("moi_optimize")
})
