#' Termination status code class
#' @export
setClass("MOI_termination_status_code")

#' Optimal status code class
#' @export
setClass("MOI_optimal_termination_status_code", contains = "MOI_termination_status_code")

#' Optimize not called status code class
#' @export
setClass("MOI_optimize_not_called_termination_status_code", contains = "MOI_termination_status_code")

#' Infeasible termination status code class
#' @export
setClass("MOI_infeasible_termination_status_code", contains = "MOI_termination_status_code")

#' Infeasible or unbounded termination status code class
#' @export
setClass("MOI_infeasible_or_unbounded_termination_status_code", contains = "MOI_termination_status_code")

#' Success termination status code class
#' @export
setClass("MOI_success_termination_status_code", contains = "MOI_termination_status_code")

#' Other error status code class
#' @export
setClass("MOI_other_error_termination_status_code", contains = "MOI_termination_status_code")

#' Status codes
#' @rdname status_codes
#' @export
OPTIMIZE_NOT_CALLED <- new("MOI_optimize_not_called_termination_status_code")

#' @export
#' @rdname status_codes
OPTIMAL <- new("MOI_optimal_termination_status_code")

#' @export
#' @rdname status_codes
SUCCESS <- new("MOI_success_termination_status_code")

#' @export
#' @rdname status_codes
OTHER_ERROR <- new("MOI_other_error_termination_status_code")

#' @export
#' @rdname status_codes
INFEASIBLE <- new("MOI_infeasible_termination_status_code")

#' @export
#' @rdname status_codes
INFEASIBLE_OR_UNBOUNDED <- new("MOI_infeasible_or_unbounded_termination_status_code")
