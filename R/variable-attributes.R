# variables
#' @export
setClass("MOI_abstract_variable_attribute")

#' @export
setClass("MOI_variable_name_attribute", contains = "MOI_abstract_variable_attribute")

#' @export
setClass("MOI_variable_primal_start_attribute", contains = "MOI_abstract_variable_attribute")

#' @export
setClass("MOI_variable_primal_attribute", contains = "MOI_abstract_variable_attribute")

#' @export
setClass("MOI_variable_dual_attribute", contains = "MOI_abstract_variable_attribute")

#' @export
setClass("MOI_variable_index_attribute", contains = "MOI_abstract_variable_attribute")

#' @export
moi_variable_name <- new("MOI_variable_name_attribute")

#' @export
moi_variable_primal_start <- new("MOI_variable_primal_start_attribute")

#' @export
moi_variable_primal <- new("MOI_variable_primal_attribute")

#' @export
moi_variable_dual <- new("MOI_variable_dual_attribute")

#' @export
moi_variable_index <- function(index) {
  if (missing(index)) { #TODO: not sure if good idea
    new("MOI_variable_index_attribute")
  } else {
    new("MOI_variable_index", value = index)
  }
}
