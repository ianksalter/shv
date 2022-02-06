# Work around used to pass package checks
# Without this line the following is a note for the package check
# no visible binding for global variable ‘measurements
utils::globalVariables(c("measurements"))


#' generate_existing_pillars
#'
#' Function used to generate a tibble of existing pillars. This data is saved
#' as package data in data-raw/DATASET.R. The fields of the tibbles are
#' documented in R/data.R.
#'
#' @importFrom dplyr %>%
#'
#' @return A tibble of existing pillars.
#' @export
#' @examples
#' generate_existing_pillars()
generate_existing_pillars <- function(){

  utils::data("measurements", envir = environment())
  existing <- measurements

  structure_height <-
    distance(existing, "entrance", "height") +
    distance(existing, "first_step", "height")+
    distance(existing, "garden_step", "height")+
    distance(existing, "base", "height")


  # Standard pillar size
  pillar_length <- distance(existing, "pillar", "length")
  pillar_width <- distance(existing, "pillar", "length")
  pillar_height <- structure_height
  pillar_2_x_obtrusion <- distance(existing, "pillar_2", "x_obtrusion")


  pillar_names <-
    c("Pillar_1", "Pillar_2", "Pillar_3", "Pillar_4", "Pillar_5", "Pillar_6",
      "Pillar_7", "Pillar_8", "Pillar_9", "Pillar_10")


  pillar_6_x_start <- distance(existing, "pillar_6", "x_distance") +
    (pillar_length - pillar_2_x_obtrusion)
  pillar_7_x_start <- pillar_width +
    distance(existing, "pillar_5_7", "x_distance")
  pillar_8_x_start <- pillar_width +
    distance(existing, "pillar_4_8", "x_distance")
  pillar_9_x_start <- pillar_width +
    distance(existing, "wall_14", "length")
  pillar_10_x_start <- pillar_9_x_start
  pillar_x_starts <-
    c(0, 0, 0, 0, 0, pillar_6_x_start, pillar_7_x_start,
      pillar_8_x_start, pillar_9_x_start, pillar_10_x_start)

  pillar_1_y_start <- 0
  pillar_2_y_start <- pillar_width +
    distance(existing, "wall_1", "length")
  pillar_3_y_start <- pillar_2_y_start + pillar_width +
    distance(existing, "wall_2", "length")
  pillar_4_y_start <- pillar_3_y_start + pillar_width +
    distance(existing, "wall_3", "length")
  pillar_5_y_start <- pillar_4_y_start + pillar_width +
    distance(existing, "wall_4", "length")
  pillar_6_y_start <- pillar_5_y_start + pillar_width +
    distance(existing, "wall_5", "length") -
    distance(existing, "pillar_6", "y_obtrusion")
  pillar_7_y_start <- pillar_5_y_start
  pillar_8_y_start <- pillar_4_y_start
  pillar_9_y_start <- pillar_2_y_start
  pillar_10_y_start <- pillar_1_y_start
  pillar_y_starts <-
    c(pillar_1_y_start, pillar_2_y_start, pillar_3_y_start,
      pillar_4_y_start, pillar_5_y_start, pillar_6_y_start,
      pillar_7_y_start, pillar_8_y_start, pillar_9_y_start,
      pillar_10_y_start)


  pillar_z_starts <- rep(0, times = 10)

  pillar_lengths <- c(rep(pillar_length, times = 5),
                      distance(existing, "pillar_6", "length"),
                      rep(pillar_length, times = 4))

  pillar_widths <- c(rep(pillar_width, times = 5),
                     distance(existing, "pillar_6", "width"),
                     rep(pillar_width, times = 4))

  pillar_heights <- rep(structure_height, times = 10)

  pillar_x_locations <- pillar_x_starts + pillar_lengths / 2

  pillar_y_locations <- pillar_y_starts + pillar_widths / 2

  pillar_z_locations <- pillar_z_starts + pillar_heights /2

  basic_pillar_tbl <- tibble::tibble(
    name = pillar_names,
    length = pillar_lengths,
    width = pillar_widths,
    height = pillar_heights,
    location_x = pillar_x_locations,
    location_y = pillar_y_locations,
    location_z = pillar_z_locations,
    x_start = pillar_x_starts,
    y_start = pillar_y_starts,
    z_start = pillar_z_starts
  )

  created_pillar_tbl <- structure(
    basic_pillar_tbl,
    class = c("pillar_tbl", class(basic_pillar_tbl))
  )
  return(created_pillar_tbl)
}

#' generate_existing_walls
#'
#' Function used to generate a tibbles of existing walls This data is saved
#' as package data in data-raw/DATASET.R. The fields of the tibbles are
#' documented in R/data.R.
#'
#' @importFrom dplyr %>%
#'
#' @return A tibble of existing walls.
#' @export
#' @examples
#' generate_existing_walls()
generate_existing_walls <- function(){

  utils::data("measurements", envir = environment())
  existing <- measurements

  structure_height <-
    distance(existing, "entrance", "height") +
    distance(existing, "first_step", "height")+
    distance(existing, "garden_step", "height")+
    distance(existing, "base", "height")

  # Standard pillar size
  pillar_length <- distance(existing, "pillar", "length")
  pillar_width <- distance(existing, "pillar", "length")
  pillar_height <- structure_height
  pillar_2_x_obtrusion <- distance(existing, "pillar_2", "x_obtrusion")

  # Wall widths
  west_wall_width <- pillar_length -
    distance(existing, "pillar_2", "x_obtrusion")
  east_wall_width <- west_wall_width

  # Space dimensions
  space_4_x_direction <- distance(existing, "space_4", "x_direction")

  wall_names <-
    c("Wall_1", "Wall_2", "Wall_3", "Wall_4", "Wall_5", "Wall_6", "Wall_7",
      "Wall_8", "Wall_9", "Wall_10", "Wall_11", "Wall_12", "Wall_13", "Wall_14")

  wall_1_x_start <- 0
  wall_1_y_start <- pillar_width
  wall_1_width <- west_wall_width
  wall_1_length <- distance(existing, "wall_1", "length")
  wall_1_z_rotation <- 90

  wall_2_x_start <- 0
  wall_2_y_start <- wall_1_y_start + wall_1_length + pillar_width
  wall_2_width <- west_wall_width
  wall_2_length <- distance(existing, "wall_2", "length")
  wall_2_z_rotation <- 90

  wall_3_x_start <- 0
  wall_3_y_start <- wall_2_y_start + wall_2_length + pillar_width
  wall_3_width <- west_wall_width
  wall_3_length <- distance(existing, "wall_3", "length")
  wall_3_z_rotation <- 90

  wall_4_x_start <- 0
  wall_4_x_start <- 0
  wall_4_y_start <- wall_3_y_start + wall_3_length+ pillar_width
  wall_4_width <- west_wall_width
  wall_4_length <- distance(existing, "wall_4", "length")
  wall_4_z_rotation <- 90

  wall_5_x_start <- 0
  wall_5_y_start <- wall_4_x_start + wall_4_width + pillar_width
  wall_5_width <- west_wall_width
  wall_5_length <- distance(existing, "wall_5", "length")
  wall_5_z_rotation <- 90

  wall_6_x_start <- 0
  wall_6_y_start <- wall_5_y_start + wall_5_length
  wall_6_width <- distance(existing, "pillar_6", "width") -
    distance(existing, "pillar_6", "y_obtrusion")
  wall_6_length <- west_wall_width +
    distance(existing, "pillar_6", "x_distance")
  wall_6_z_rotation <- 0

  wall_7_x_start <- wall_6_length  +
    distance(existing, "pillar_6", "length")
  wall_7_y_start <- wall_6_y_start
  wall_7_width <- wall_6_width
  wall_7_length <-
    space_4_x_direction +
    east_wall_width -
    wall_7_y_start
  wall_7_z_rotation <- 0

  wall_8_x_start <- west_wall_width +
    space_4_x_direction
  wall_8_y_start <- wall_7_y_start -
    distance(existing, "space_4", "y_direction")
  wall_8_width <- east_wall_width
  wall_8_length <- distance(existing, "space_4", "y_direction")
  wall_8_z_rotation <- 90

  space_3_4_x_difference <-
    space_4_x_direction - distance(existing, "space_3", "x_direction")
  wall_9_width <- east_wall_width
  wall_9_length <- space_3_4_x_difference + east_wall_width
  wall_9_x_start <- wall_8_x_start - space_3_4_x_difference
  wall_9_y_start <- wall_8_y_start
  wall_9_z_rotation <- 0

  wall_10_width <- east_wall_width
  wall_10_length <- distance(existing, "space_3", "y_direction") -
    2 * wall_9_width
  wall_10_x_start <- wall_9_x_start
  wall_10_y_start <- wall_9_y_start - wall_10_length
  wall_10_z_rotation <- 90

  space_2_3_x_difference <-
    distance(existing, "space_2", "x_direction") -
    distance(existing, "space_3", "x_direction")
  wall_11_width <- east_wall_width
  wall_11_length <- space_2_3_x_difference + east_wall_width
  wall_11_x_start <- wall_10_x_start
  wall_11_y_start <- wall_10_y_start - wall_11_width
  wall_11_z_rotation <- 0

  wall_12_width <- east_wall_width
  wall_12_length <- wall_2_length
  wall_12_x_start <- wall_11_x_start + space_2_3_x_difference
  wall_12_y_start <- wall_1_y_start - wall_12_length
  wall_12_z_rotation <- 90

  wall_13_width <- east_wall_width
  wall_13_length <- wall_1_length
  wall_13_x_start <- wall_12_x_start
  wall_13_y_start <- wall_1_y_start - wall_13_length - pillar_width
  wall_13_z_rotation <- 90

  wall_14_width <- pillar_width
  wall_14_length <- distance(existing, "wall_14", "length")
  wall_14_x_start <- pillar_length
  wall_14_y_start <- 0
  wall_14_z_rotation <- 0

 wall_x_starts <-
   c(wall_1_x_start,
     wall_2_x_start,
     wall_3_x_start,
     wall_4_x_start,
     wall_5_x_start,
     wall_6_x_start,
     wall_7_x_start,
     wall_8_x_start,
     wall_9_x_start,
     wall_10_x_start,
     wall_11_x_start,
     wall_12_x_start,
     wall_13_x_start,
     wall_14_x_start)

 wall_y_starts <-
   c(wall_1_y_start,
     wall_2_y_start,
     wall_3_y_start,
     wall_4_y_start,
     wall_5_y_start,
     wall_6_y_start,
     wall_7_y_start,
     wall_8_y_start,
     wall_9_y_start,
     wall_10_y_start,
     wall_11_y_start,
     wall_12_y_start,
     wall_13_y_start,
     wall_14_y_start)

 wall_z_starts <- rep(0, times = 14)

 wall_widths <-
   c(wall_1_width,
     wall_2_width,
     wall_3_width,
     wall_4_width,
     wall_5_width,
     wall_6_width,
     wall_7_width,
     wall_8_width,
     wall_9_width,
     wall_10_width,
     wall_11_width,
     wall_12_width,
     wall_13_width,
     wall_14_width)

 wall_lengths <-
   c(wall_1_length,
     wall_2_length,
     wall_3_length,
     wall_4_length,
     wall_5_length,
     wall_6_length,
     wall_7_length,
     wall_8_length,
     wall_9_length,
     wall_10_length,
     wall_11_length,
     wall_12_length,
     wall_13_length,
     wall_14_length)

 wall_heights <- rep(structure_height, times = 14)

 wall_z_rotations <-
   c(wall_1_z_rotation,
     wall_2_z_rotation,
     wall_3_z_rotation,
     wall_4_z_rotation,
     wall_5_z_rotation,
     wall_6_z_rotation,
     wall_7_z_rotation,
     wall_8_z_rotation,
     wall_9_z_rotation,
     wall_10_z_rotation,
     wall_11_z_rotation,
     wall_12_z_rotation,
     wall_13_z_rotation,
     wall_14_z_rotation)

  wall_x_locations <-  wall_loc_x(wall_x_starts,
                                  wall_lengths, wall_widths, wall_z_rotations)

  wall_y_locations <- wall_loc_y(wall_y_starts,
                                 wall_lengths, wall_widths, wall_z_rotations)

  wall_z_locations <- wall_z_starts + wall_heights /2

  basic_wall_tbl <- tibble::tibble(
    name = wall_names,
    location_x = wall_x_locations,
    location_y = wall_y_locations,
    location_z = wall_z_locations,
    length = wall_lengths,
    width = wall_widths,
    height = wall_heights,
    rotation_z = wall_z_rotations,
    start_x = wall_x_starts,
    start_y = wall_y_starts,
    start_z = wall_z_starts
  )

  created_wall_tbl <- structure(
    basic_wall_tbl,
    class = c("wall_tbl", class(basic_wall_tbl))
  )
  return(created_wall_tbl)
}


#' wall_loc_x
#'
#' Calculate a walls x location given the start_x, length, width and
#' rotation_z
#'
#' @param start_x a vector of wall x starts. Note that the x_start of a wall
#' is the x coordinate of the least_vertex of a wall. The least_vertex is least
#' when ordered by x coordinate, then y coordinate and then z coordinate.
#' @param wall_length a vector of positive wall lengths.
#' @param wall_width a vector of wall widths.
#' @param rotation_z - a vector of rotations in degrees where each rotation is
#' > -90 and l<= 90
#'
#' @return A vector giving the corresponding x locations for the walls.
#' @export
#' @examples
#' start_x <- c(0, 0, 2, 18, 20, 20)
#' wall_length <- c(18, 18, 18, 18, 20, 20)
#' wall_width <- c(2, 2, 2, 2, 2, 2)
#' rotation_z <- c(0, 90, 0, 90, 60, -30)
#' wall_loc_x(start_x, wall_length, wall_width, rotation_z)
wall_loc_x <- function(start_x, wall_length, wall_width, rotation_z){
  assertthat::assert_that(
    all(rotation_z > -90),
    msg = "rotation_z must be greater than -90")
  assertthat::assert_that(
    all(rotation_z <= 90),
    msg = "rotation_z must be less than or equal to 90")
  assertthat::assert_that(
    all(wall_length > 0),
    msg = "wall_length must be positive")
  assertthat::assert_that(
    all(wall_width > 0),
    msg = "wall_width must be positive")


  wall_z_rotations_rad <- pi * rotation_z / 180


  # correct calculations (TRIANGLES!)
  wall_x_location <-
    start_x +
    cos(wall_z_rotations_rad - 90) * wall_width / 2 +
    cos(wall_z_rotations_rad) * wall_length / 2
  return(wall_x_location)
}


#' wall_loc_y
#'
#' Calculate a walls y location given the start_y, length, width and
#' rotation_z
#'
#' @param start_y a vector of wall y starts. Note that the start_y of a wall
#' is the y coordinate of the least_vertex of a wall. The least_vertex is least
#' when ordered by x coordinate, then y coordinate and then z coordinate.
#' @param wall_length a vector of positive wall lengths.
#' @param wall_width a vector of wall widths.
#' @param rotation_z - a vector of rotations in degrees where each rotation is
#' > -90 and l<= 90
#'
#' @return A vector giving the corresponding y locations for the walls.
#' @export
#' @examples
#' start_y <- c(0, 0, 2, 18, 20, 20)
#' wall_length <- c(18, 18, 18, 18, 20, 20)
#' wall_width <- c(2, 2, 2, 2, 2, 2)
#' rotation_z <- c(0, 90, 0, 90, 60, -30)
#' wall_loc_y(start_y, wall_length, wall_width, rotation_z)
wall_loc_y <- function(start_y, wall_length, wall_width, rotation_z){
  assertthat::assert_that(
    all(rotation_z > -90),
    msg = "rotation_z must be greater than -90")
  assertthat::assert_that(
    all(rotation_z <= 90),
    msg = "rotation_z must be less than or equal to 90")
  assertthat::assert_that(
    all(wall_length > 0),
    msg = "wall_length must be positive")
  assertthat::assert_that(
    all(wall_width > 0),
    msg = "wall_width must be positive")

  wall_z_rotations_rad <- pi * rotation_z / 180

  wall_y_location <-
    start_y +
    sin(wall_z_rotations_rad + 90) * wall_width / 2 +
    sin(wall_z_rotations_rad) * wall_length / 2
  return(wall_y_location)
}




