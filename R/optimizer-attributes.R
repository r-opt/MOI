#' @export
setClass("MOI_abstract_optimizer_attribute")

#' @export
setClass("MOI_objective_value",
  contains = "MOI_abstract_optimizer_attribute",
  slots = c("result_idx" = "numeric")
)

#' @export
objective_value <- function(result_idx = 1) {
  new("MOI_objective_value", result_idx = result_idx)
}

#' @export
setClass("MOI_objective_bound", contains = "MOI_abstract_optimizer_attribute")

#' @export
objective_bound <- new("MOI_objective_bound")

#' @export
setClass("MOI_relative_gap", contains = "MOI_abstract_optimizer_attribute")

#' @export
relative_gap <- new("MOI_relative_gap")

#' @export
setClass("MOI_termination_status", contains = "MOI_abstract_optimizer_attribute")

#' @export
termination_status <- new("MOI_termination_status")

#' @export
setClass("MOI_termination_message", contains = "MOI_abstract_optimizer_attribute")

#' @export
termination_message <- new("MOI_termination_message")

#' @export
setClass("MOI_primal_status",
         contains = "MOI_abstract_optimizer_attribute",
         slots = c("result_idx" = "numeric"))

#' @export
primal_status <- function(result_idx = 1) {
  new("MOI_primal_status", result_idx = result_idx)
}

#' @export
setClass("MOI_dual_status",
         contains = "MOI_abstract_optimizer_attribute",
         slots = c("result_idx" = "numeric"))

#' @export
dual_status <- function(result_idx = 1) {
  new("MOI_dual_status", result_idx = result_idx)
}

#' @export
setClass("MOI_result_count", contains = "MOI_abstract_optimizer_attribute")

#' @export
result_count <- new("MOI_result_count")

#' @export
setClass("MOI_termination_solver_message_attribute", contains = "MOI_abstract_optimizer_attribute")

#' @export
termination_solver_message <- new("MOI_termination_solver_message_attribute")

