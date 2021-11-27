#' Termination status code class
#' @export
setClass("MOI_termination_status_code")

#' Optimal status code class
#' @export
setClass("MOI_optimal_termination_status_code", contains = "MOI_termination_status_code")

setMethod(
  "format",
  "MOI_optimal_termination_status_code",
  function(x, ...) {
    format("Status: optimal value")
  }
)

#' Optimize not called status code class
#' @export
setClass("MOI_optimize_not_called_termination_status_code", contains = "MOI_termination_status_code")

setMethod(
  "format",
  "MOI_optimize_not_called_termination_status_code",
  function(x, ...) {
    format("Status: optimize not called")
  }
)

#' Infeasible termination status code class
#' @export
setClass("MOI_infeasible_termination_status_code", contains = "MOI_termination_status_code")

setMethod(
  "format",
  "MOI_infeasible_termination_status_code",
  function(x, ...) {
    format("Status: infeasible")
  }
)

#' Infeasible or unbounded termination status code class
#' @export
setClass("MOI_infeasible_or_unbounded_termination_status_code", contains = "MOI_termination_status_code")

setMethod(
  "format",
  "MOI_infeasible_or_unbounded_termination_status_code",
  function(x, ...) {
    format("Status: infeasible or unbounded")
  }
)

#' Success termination status code class
#' @export
setClass("MOI_success_termination_status_code", contains = "MOI_termination_status_code")

setMethod(
  "format",
  "MOI_success_termination_status_code",
  function(x, ...) {
    format("Status: success")
  }
)

#' Other error status code class
#' @export
setClass("MOI_other_error_termination_status_code", contains = "MOI_termination_status_code")

setMethod(
  "format",
  "MOI_other_error_termination_status_code",
  function(x, ...) {
    format("Status: other error")
  }
)

setMethod(
  "print",
  "MOI_termination_status_code",
  function(x, ...) {
    cat(format(x))
    invisible(x)
  }
)

setMethod(
  "show",
  "MOI_termination_status_code",
  function(object) {
    print(object)
  }
)

#' Status codes
#' @rdname status_codes
#' @export
MOI_OPTIMIZE_NOT_CALLED <- new("MOI_optimize_not_called_termination_status_code")

#' @export
#' @rdname status_codes
MOI_OPTIMAL <- new("MOI_optimal_termination_status_code")

#' @export
#' @rdname status_codes
MOI_SUCCESS <- new("MOI_success_termination_status_code")

#' @export
#' @rdname status_codes
MOI_OTHER_ERROR <- new("MOI_other_error_termination_status_code")

#' @export
#' @rdname status_codes
MOI_INFEASIBLE <- new("MOI_infeasible_termination_status_code")

#' @export
#' @rdname status_codes
MOI_INFEASIBLE_OR_UNBOUNDED <- new("MOI_infeasible_or_unbounded_termination_status_code")
