#' @export
setClass("MOI_termination_status_code")

#' @export
setClass("MOI_optimal_termination_status_code", contains = "MOI_termination_status_code")

#' @export
setClass("MOI_optimize_not_called_termination_status_code", contains = "MOI_termination_status_code")

#' @export
setClass("MOI_infeasible_termination_status_code", contains = "MOI_termination_status_code")

#' @export
setClass("MOI_infeasible_or_unbounded_termination_status_code", contains = "MOI_termination_status_code")

#' @export
setClass("MOI_success_termination_status_code", contains = "MOI_termination_status_code")

#' @export
setClass("MOI_other_error_termination_status_code", contains = "MOI_termination_status_code")

#' @export
OPTIMIZE_NOT_CALLED <- new("MOI_optimize_not_called_termination_status_code")

#' @export
OPTIMAL <- new("MOI_optimal_termination_status_code")

#' @export
SUCCESS <- new("MOI_success_termination_status_code")

#' @export
OTHER_ERROR <- new("MOI_other_error_termination_status_code")

#' @export
INFEASIBLE <- new("MOI_infeasible_termination_status_code")

#' @export
INFEASIBLE_OR_UNBOUNDED <- new("MOI_infeasible_or_unbounded_termination_status_code")
