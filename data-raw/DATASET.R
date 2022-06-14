# This script is used to generate all of the data used in the design.

devtools::load_all()

#' save_all
#'
#' Generates and saves all of the data
save_all <- function(){
  save_measurements()
  save_existing_pillars()
  save_existing_walls()
  save_existing_holes()
  save_new_walls()
  save_new_windows()
}


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

#' save_existing_walls
#'
#' Generates and saves the set of existing walls
save_existing_holes <- function(){
  existing_holes <- generate_existing_holes()
  usethis::use_data(existing_holes, overwrite = TRUE)
}

#' save_new_walls
#'
#' Generates and saves the set of new walls
save_new_walls <- function(){
  new_walls <- generate_new_walls()
  usethis::use_data(new_walls, overwrite = TRUE)
}

#' save_new_windows
#'
#' Generates and saves the set of new windows and doors
save_new_windows <- function(){
  new_windows <- generate_new_windows()
  usethis::use_data(new_windows, overwrite = TRUE)
}
