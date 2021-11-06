#' An abstract index
#' @slot value a length one integer like numeric
#' @export
setClass("MOI_abstract_index", representation(value = "numeric"))

#' A variable index
#' @slot value a length one integer like numeric
#' @export
setClass("MOI_variable_index", contains = "MOI_abstract_index")

#' A constraint index
#' @slot value a length one integer like numeric
#' @export
setClass("MOI_constraint_index", contains = "MOI_abstract_index")
