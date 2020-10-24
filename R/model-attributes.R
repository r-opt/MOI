#' Abstract model attribute class
#' @export
setClass("MOI_abstract_model_attribute")

#' Number of variables class
#' @export
setClass("MOI_number_of_variables", contains = "MOI_abstract_model_attribute")

#' Number of variables attribute
#' @export
number_of_variables <- new("MOI_number_of_variables")

#' Number of constraints attribute class
#' @export
setClass("MOI_number_of_constraints", contains = "MOI_abstract_model_attribute")

#' Number of constraints attribute
#' @export
number_of_constraints <- new("MOI_number_of_constraints")

#' Objective sense attribute class
#' @export
setClass("MOI_objective_sense", contains = "MOI_abstract_model_attribute")

#' Objective function attribute class
#' @export
setClass("MOI_objective_function", contains = "MOI_abstract_model_attribute")

#' Objective sense attribute
#' @export
objective_sense <- new("MOI_objective_sense")

#' Objective function attribute
#' @export
objective_function <- new("MOI_objective_function")

#' Optimization sense attribute class
#' @export
setClass("MOI_optimization_sense", contains = "MOI_abstract_model_attribute")

#' Optimization min attribute class
#' @export
setClass("MOI_optimization_sense_min", contains = "MOI_optimization_sense")

#' Optimization max attribute class
#' @export
setClass("MOI_optimization_sense_max", contains = "MOI_optimization_sense")

#' Optimization feasibility sense attribute class
#' @export
setClass("MOI_optimization_sense_feasibility", contains = "MOI_optimization_sense")

#' Optimization min attribute
#' @export
MIN_SENSE <- new("MOI_optimization_sense_min")

#' Optimization max attribute
#' @export
MAX_SENSE <- new("MOI_optimization_sense_max")

#' Optimization feasibility sense attribute
#' @export
FEASIBILITY_SENSE <- new("MOI_optimization_sense_feasibility")
