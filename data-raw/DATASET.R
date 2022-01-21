# This script is used to generate all of the data used in the design.

devtools::load_all()


#' save_measurements
#'
#' Generates and saves the set of existing building measurements
save_measurements <- function(){
  measurements <- generate_measurements()
  usethis::use_data(measurements, overwrite = TRUE)
}

#' save_existing_pillars
#'
#' Generates and saves the set of existing pillars
save_existing_pillars <- function(){
  existing_pillars <- generate_existing_pillars()
  usethis::use_data(existing_pillars, overwrite = TRUE)
}

#' save_existing_walls
#'
#' Generates and saves the set of existing walls
save_existing_walls <- function(){
  existing_walls <- generate_existing_walls()
  usethis::use_data(existing_walls, overwrite = TRUE)
}
