#' An abstract constraint attribute
#' @export
setClass("MOI_abstract_constraint_attribute")

#' A dual of a constraint
#' @slot result_idx a length 1 numeric
#' @export
setClass("MOI_constraint_dual", contains = "MOI_abstract_constraint_attribute",
         slots = c("result_idx" = "numeric"))

#' A new constraint dual
#' @param result_idx a scalar index >= 1
#' @export
moi_constraint_dual <- function(result_idx = 1) {
  new("MOI_constraint_dual", result_idx = result_idx)
}
