# index
#' @export
setClass("MOI_abstract_index", representation(value = "numeric"))

#' @export
setClass("MOI_variable_index", contains = "MOI_abstract_index")

#' @export
setClass("MOI_constraint_index", contains = "MOI_abstract_index")
