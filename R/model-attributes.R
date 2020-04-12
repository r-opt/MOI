#' @export
setClass("MOI_abstract_model_attribute")

#' @export
setClass("MOI_number_of_variables", contains = "MOI_abstract_model_attribute")

#' @export
number_of_variables <- new("MOI_number_of_variables")

#' @export
setClass("MOI_number_of_constraints", contains = "MOI_abstract_model_attribute")

#' @export
number_of_constraints <- new("MOI_number_of_constraints")

#' @export
setClass("MOI_objective_sense", contains = "MOI_abstract_model_attribute")

#' @export
setClass("MOI_objective_function", contains = "MOI_abstract_model_attribute")

#' @export
objective_sense <- new("MOI_objective_sense")

#' @export
objective_function <- new("MOI_objective_function")

#' @export
setClass("MOI_optimization_sense", contains = "MOI_abstract_model_attribute")

#' @export
setClass("MOI_optimization_sense_min", contains = "MOI_optimization_sense")

#' @export
setClass("MOI_optimization_sense_max", contains = "MOI_optimization_sense")

#' @export
setClass("MOI_optimization_sense_feasibility", contains = "MOI_optimization_sense")

#' @export
MIN_SENSE <- new("MOI_optimization_sense_min")

#' @export
MAX_SENSE <- new("MOI_optimization_sense_max")

#' @export
FEASIBILITY_SENSE <- new("MOI_optimization_sense_feasibility")
