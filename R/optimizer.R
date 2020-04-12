#' @export
#' @include model.R
setClass("MOI_abstract_optimizer", contains = "MOI_abstract_model")

#' @export
setGeneric("moi_optimize", function(model) {
  standardGeneric("moi_optimize")
})
