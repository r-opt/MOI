#' The status code class
#'
#' @export
setClass("MOI_result_status_code")

#' The no solution status code class
#'
#' @export
setClass("MOI_no_solution_result_status_code", contains = "MOI_result_status_code")

#' The no solution status code
#'
#' @export
NO_SOLUTION <- new("MOI_no_solution_result_status_code")

#' The feasible point result status code class
#'
#' @export
setClass("MOI_feasible_point_result_status_code", contains = "MOI_result_status_code")

#' The feasible point result status code
#' @export
FEASIBLE_POINT <- new("MOI_feasible_point_result_status_code")
