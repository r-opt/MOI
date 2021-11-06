#' An abstract optimizer attribute
#' @export
setClass("MOI_abstract_optimizer_attribute")

#' The objective value attribute of an optimizer
#' @slot result_idx the length 1 index
#' @export
setClass("MOI_objective_value",
  contains = "MOI_abstract_optimizer_attribute",
  slots = c("result_idx" = "numeric")
)

#' The objective value attribute
#' @param result_idx a result index
#' @export
moi_objective_value <- function(result_idx = 1) {
  new("MOI_objective_value", result_idx = result_idx)
}

#' The objective bound attribute of an optimizer
#' @export
setClass("MOI_objective_bound", contains = "MOI_abstract_optimizer_attribute")

#' The objective bound attribute
#' @export
moi_objective_bound <- new("MOI_objective_bound")

#' The relative gap attribute of an optimizer
#' @export
setClass("MOI_relative_gap", contains = "MOI_abstract_optimizer_attribute")

#' The relative GAP attribute
#' @export
moi_relative_gap <- new("MOI_relative_gap")

#' The termination status attribute of an optimizer
#' @export
setClass("MOI_termination_status", contains = "MOI_abstract_optimizer_attribute")

#' Termination status attribute
#' @export
moi_termination_status <- new("MOI_termination_status")

#' The termination message attribute of an optimizer
#' @export
setClass("MOI_termination_message", contains = "MOI_abstract_optimizer_attribute")

#' Termination message attribute
#' @export
moi_termination_message <- new("MOI_termination_message")

#' The primal status attribute of an optimizer
#' @slot result_idx the length 1 index
#' @export
setClass("MOI_primal_status",
         contains = "MOI_abstract_optimizer_attribute",
         slots = c("result_idx" = "numeric"))

#' Primate status attribute
#' @param result_idx a result index (scalar >= 1)
#' @export
moi_primal_status <- function(result_idx = 1) {
  new("MOI_primal_status", result_idx = result_idx)
}

#' The dual status attribute of an optimizer
#' @slot result_idx the length 1 index
#' @export
setClass("MOI_dual_status",
         contains = "MOI_abstract_optimizer_attribute",
         slots = c("result_idx" = "numeric"))

#' The dual status attribute
#' @param result_idx a length 1 scalar >= 1
#' @export
moi_dual_status <- function(result_idx = 1) {
  new("MOI_dual_status", result_idx = result_idx)
}

#' The result count attribute of an optimizer
#' @export
setClass("MOI_result_count", contains = "MOI_abstract_optimizer_attribute")

#' The result count attribute
#' @export
moi_result_count <- new("MOI_result_count")

#' The termination solver message attribute of an optimizer
#' @export
setClass("MOI_termination_solver_message_attribute", contains = "MOI_abstract_optimizer_attribute")

#' Termination solver message attribute
#' @export
moi_termination_solver_message <- new("MOI_termination_solver_message_attribute")

