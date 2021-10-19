#' @export
setClass("MOI_abstract_constraint_attribute")

#' @export
setClass("MOI_constraint_dual", contains = "MOI_abstract_constraint_attribute",
         slots = c("result_idx" = "numeric"))

#' @export
moi_constraint_dual <- function(result_idx = 1) {
  new("MOI_constraint_dual", result_idx = result_idx)
}
