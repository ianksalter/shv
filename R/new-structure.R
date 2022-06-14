# Work around used to pass package checks
# Without this line the following is a note for the package check
# no visible binding for global variable ‘measurements
utils::globalVariables(c("measurements"))

# Global design parameters
design_param <-
  tibble::tibble(
    gap = 10, # Gap in mil to allow margin of error.
    steel_width = 130, # width of the steel frame
    wall_height_low = 2600, # Height of the low walls
    wall_height_high = 3300, # Height of the high walls
    wall_z_start = 250 # Height at which the walls start from the base of the drawing.
  )


#' generate_new_walls
#'
#' Function used to generate a tibbles of new walls This data is saved
#' as package data in data-raw/DATASET.R. The fields of the tibbles are
#' documented in R/data.R.
#'
#' @importFrom dplyr %>%
#'
#' @return A tibble of existing walls.
#' @export
#' @examples
#' generate_new_walls()
generate_new_walls <- function(){

  utils::data("measurements", envir = environment()) #Check to see if these are used.
  existing <- measurements
  utils::data("existing_walls", envir = environment())

  gap <- design_param$gap
  steel_width <- design_param$steel_width
  wall_height_low <- design_param$wall_height_low
  wall_height_high <- design_param$wall_height_high
  wall_z_start <- design_param$wall_z_start

  wall_row <-
    existing_walls %>%
    dplyr::filter(name == "Wall_1")
  wall_1_name <- "Steel_Wall_1"
  wall_1_x_start <- wall_row$start_x  + wall_row$width + gap
  wall_1_y_start <- wall_row$start_y + gap
  wall_1_width <- steel_width
  wall_1_length <- + wall_row$length - gap * 2
  wall_1_height <- wall_height_low
  wall_1_z_rotation <- wall_row$rotation_z

  wall_row <-
    existing_walls %>%
    dplyr::filter(name == "Wall_2")
  wall_2_name <- "Steel_Wall_2"
  wall_2_x_start <- wall_row$start_x + wall_row$width + gap
  wall_2_y_start <- wall_row$start_y + gap
  wall_2_width <- steel_width
  wall_2_length <- wall_row$length - gap * 2
  wall_2_height <- wall_height_low
  wall_2_z_rotation <- wall_row$rotation_z

  wall_row <-
    existing_walls %>%
    dplyr::filter(name == "Wall_3")
  wall_3_name <- "Steel_Wall_3"
  wall_3_x_start <- wall_row$start_x + wall_row$width + gap
  wall_3_y_start <- wall_row$start_y + gap
  wall_3_width <- steel_width
  wall_3_length <- wall_row$length - gap * 2
  wall_3_height <- wall_height_low
  wall_3_z_rotation <- wall_row$rotation_z

  wall_row <-
    existing_walls %>%
    dplyr::filter(name == "Wall_4")
  wall_4_name <- "Steel_Wall_4"
  wall_4_x_start <- wall_row$start_x + wall_row$width + gap
  wall_4_y_start <- wall_row$start_y + gap
  wall_4_width <- steel_width
  wall_4_length <- wall_row$length - gap * 2
  wall_4_height <- wall_height_low
  wall_4_z_rotation <- wall_row$rotation_z

  # Need north wall width
  north_wall_width <-
    distance(existing, "north_wall", "width")

  wall_row <-
    existing_walls %>%
    dplyr::filter(name == "Wall_5")
  wall_5_name <- "Steel_Wall_5"
  wall_5_x_start <- wall_row$start_x + wall_row$width + gap
  wall_5_y_start <- wall_row$start_y + gap
  wall_5_width <- steel_width
  wall_5_length <-
    wall_row$length -
    gap * 2  -
    steel_width -
    north_wall_width
  wall_5_height <- wall_height_low
  wall_5_z_rotation <- wall_row$rotation_z


  wall_row <-
    existing_walls %>%
    dplyr::filter(name == "Wall_6")
  wall_6_name <- "Steel_Wall_6"
  wall_6_x_start <- wall_row$start_x + gap
  wall_6_y_start <- wall_row$start_y - wall_row$width - gap * 2
  wall_6_width <- steel_width
  wall_6_length <- wall_row$length- gap * 2
  wall_6_height <- wall_height_low
  wall_6_z_rotation <- wall_row$rotation_z


  wall_row <-
    existing_walls %>%
    dplyr::filter(name == "Wall_7")
  wall_7_name <- "Steel_Wall_7"
  wall_7_x_start <- wall_row$start_x + gap
  wall_7_y_start <- wall_row$start_y - wall_row$width - gap *2
  wall_7_width <- steel_width
  wall_7_length <- wall_row$length - gap * 2
  wall_7_height <- wall_height_low
  wall_7_z_rotation <- wall_row$rotation_z

  # Need north wall width
  east_wall_width <-
    distance(existing, "east_wall", "width")

  wall_row <-
    existing_walls %>%
    dplyr::filter(name == "Wall_8")
  wall_8_name <- "Steel_Wall_8"
  wall_8_x_start <- wall_row$start_x - steel_width - gap
  wall_8_y_start <- wall_row$start_y + gap + east_wall_width
  wall_8_width <- steel_width
  wall_8_length <-
    wall_row$length -
    gap * 2  -
    east_wall_width -
    steel_width -
    north_wall_width
  wall_8_height <- wall_height_low
  wall_8_z_rotation <- wall_row$rotation_z

  # For bathroom wall calcs
  pillar_8_x_end <-
    distance(existing, "pillar_4_8", "x_distance") +
    distance(existing, "pillar", "width") * 2 -
    distance(existing, "pillar_2", "x_obtrusion")

  wall_row <-
    existing_walls %>%
    dplyr::filter(name == "Wall_9")
  wall_9_name <- "Steel_Wall_9"
  wall_9_x_start <- pillar_8_x_end + gap
  wall_9_y_start <- wall_row$start_y + wall_row$width + gap
  wall_9_width <- steel_width
  wall_9_length <-
    wall_row$start_x - pillar_8_x_end +
    wall_row$length -
    steel_width - gap * 2
  wall_9_height <- wall_height_low
  wall_9_z_rotation <- wall_row$rotation_z

  wall_row <-
    existing_walls %>%
    dplyr::filter(name == "Wall_10")
  wall_10_name <- "Steel_Wall_10"
  wall_10_x_start <- wall_row$start_x - steel_width - gap
  wall_10_y_start <- wall_row$start_y - gap
  wall_10_width <- steel_width
  wall_10_length <- wall_row$length + gap * 2
  wall_10_height <- wall_height_low
  wall_10_z_rotation <- wall_row$rotation_z

  wall_row <-
    existing_walls %>%
    dplyr::filter(name == "Wall_11")
  wall_11_name <- "Steel_Wall_11"
  wall_11_x_start <-
    wall_row$start_x -
    east_wall_width -
    steel_width - gap
  wall_11_y_start <- wall_row$start_y - steel_width - gap
  wall_11_width <- steel_width
  wall_11_length <-
    wall_row$length - gap +
    east_wall_width +
    steel_width + gap
  wall_11_height <- wall_height_low
  wall_11_z_rotation <- wall_row$rotation_z

  wall_row <-
    existing_walls %>%
    dplyr::filter(name == "Wall_12")
  wall_12_name <- "Steel_Wall_12"
  wall_12_x_start <- wall_row$start_x - steel_width - gap
  wall_12_y_start <- wall_row$start_y + gap
  wall_12_width <- steel_width
  wall_12_length <-
    wall_row$length - gap -
    east_wall_width -
    steel_width - gap
  wall_12_height <- wall_height_low
  wall_12_z_rotation <- wall_row$rotation_z

  wall_row <-
    existing_walls %>%
    dplyr::filter(name == "Wall_13")
  wall_13_name <- "Steel_Wall_13"
  wall_13_x_start <- wall_row$start_x - steel_width - gap
  wall_13_y_start <- wall_row$start_y + gap
  wall_13_width <- steel_width
  wall_13_length <- wall_row$length - gap * 2
  wall_13_height <- wall_height_low
  wall_13_z_rotation <- wall_row$rotation_z

  # useful measurements
  pillar_x_obtrusion <-
    distance(existing, "pillar_2", "x_obtrusion")
  space_1_x_direction <-
    distance(existing, "space_1", "x_direction")
  entrance_x_start <-
    distance(existing, "entrance", "x_start")
  entrance_length <-
    distance(existing, "entrance", "length")
  entrance_small_hole_height <-
    distance(existing, "entrance_small_hole", "height")

  entrance_length <-
    distance(existing, "entrance", "length")

  wall_row <-
    existing_walls %>%
    dplyr::filter(name == "Wall_14")
  wall_14_1_name <- "Steel_Wall_14_1"
  wall_14_1_x_start <-
    wall_row$start_x -
    pillar_x_obtrusion +
    steel_width + gap
  wall_14_1_y_start <- wall_row$start_y + wall_row$width + gap
  wall_14_1_width <- steel_width
  wall_14_1_length <-
    pillar_x_obtrusion +
    entrance_x_start -
    (steel_width + gap)
  wall_14_1_height <- wall_height_low
  wall_14_1_z_rotation <- wall_row$rotation_z

  wall_14_2_name <- "Steel_Wall_14_2"
  wall_14_2_x_start <-
    wall_14_1_x_start +
    wall_14_1_length
  wall_14_2_y_start <- wall_14_1_y_start
  wall_14_2_width <- steel_width
  wall_14_2_length <- entrance_length
  wall_14_2_height <- entrance_small_hole_height - wall_z_start
  wall_14_2_z_rotation <- wall_row$rotation_z

  wall_14_3_name <- "Steel_Wall_14_3"
  wall_14_3_x_start <-
    wall_14_2_x_start +
    wall_14_2_length
  wall_14_3_y_start <- wall_14_1_y_start
  wall_14_3_width <- steel_width
  wall_14_3_length <-
    space_1_x_direction -
    (steel_width + gap) * 2 -
    wall_14_1_length -
    wall_14_2_length
  wall_14_3_height <- wall_height_low
  wall_14_3_z_rotation <- wall_row$rotation_z


 wall_names <-
   c(wall_1_name,
     wall_2_name,
     wall_3_name,
     wall_4_name,
     wall_5_name,
     wall_6_name,
     wall_7_name,
     wall_8_name,
     wall_9_name,
     wall_10_name,
     wall_11_name,
     wall_12_name,
     wall_13_name,
     wall_14_1_name,
     wall_14_2_name,
     wall_14_3_name)

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
     wall_14_1_x_start,
     wall_14_2_x_start,
     wall_14_3_x_start)

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
     wall_14_1_y_start,
     wall_14_2_y_start,
     wall_14_3_y_start)


 no_of_walls <- length(wall_names)
 wall_z_starts <- rep(wall_z_start, times = no_of_walls)

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
     wall_14_1_width,
     wall_14_2_width,
     wall_14_3_width)

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
     wall_14_1_length,
     wall_14_2_length,
     wall_14_3_length)

 wall_heights <-
   c(wall_1_height,
     wall_2_height,
     wall_3_height,
     wall_4_height,
     wall_5_height,
     wall_6_height,
     wall_7_height,
     wall_8_height,
     wall_9_height,
     wall_10_height,
     wall_11_height,
     wall_12_height,
     wall_13_height,
     wall_14_1_height,
     wall_14_2_height,
     wall_14_3_height)

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
     wall_14_1_z_rotation,
     wall_14_2_z_rotation,
     wall_14_3_z_rotation)

  wall_x_locations <- wall_x_starts + z_rotate_x(wall_lengths / 2,
                                                 wall_widths / 2 * ifelse(wall_z_rotations <= 0, 1, -1),
                                                 wall_z_rotations)

  wall_y_locations <- wall_y_starts + z_rotate_y(wall_lengths / 2,
                                                 wall_widths / 2 * ifelse(wall_z_rotations <= 0, 1, -1),
                                                 wall_z_rotations)

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


#' generate_new_windows
#'
#' Function used to generate a tibbles of new windows and doors This data is
#' saved as package data in data-raw/DATASET.R. The fields of the tibbles are
#' documented in R/data.R.
#'
#' @importFrom dplyr %>%
#'
#' @return A tibble of new windows and doors.
#' @export
#' @examples
#' generate_new_windows()
generate_new_windows <- function(){

  utils::data("measurements", envir = environment()) #Check to see if these are used.
  existing <- measurements
  utils::data("existing_walls", envir = environment())

  gap <- design_param$gap
  steel_width <- design_param$steel_width
  wall_height_low <- design_param$wall_height_low
  wall_height_high <- design_param$wall_height_high
  wall_z_start <- design_param$wall_z_start


  # Prep window bvectors
  window_names <- c()
  window_wall_names <- c()
  window_types <- c()
  window_starts <- c()
  window_widths <- c()
  window_heights <- c()
  window_h1s <- c()
  window_h2s <- c()
  window_h3s <- c()
  window_w1s <- c()
  window_w2s <- c()
  window_o1s <- c()
  window_o2s <- c()

  #Front door
  window_name  <- "Front_Door"
  window_wall_name <- "Steel_Wall_14_2"
  window_type <- "Simple Door"
  window_start <- 0
  window_width <- 1000
  window_height <- 2000
  window_h1 <- 100
  window_h2 <- 100
  window_h3 <- 100
  window_w1 <- 200
  window_w2 <- 100
  window_o1 <- 0
  window_o2 <- 100

  window_names <- c(window_names, window_name)
  window_wall_names <- c(window_wall_names, window_wall_name)
  window_types <- c(window_types, window_type)
  window_starts <- c(window_starts, window_start)
  window_widths <- c(window_widths, window_width)
  window_heights <- c(window_heights, window_height)
  window_h1s <- c(window_h1s, window_h1)
  window_h2s <- c(window_h2s, window_h2)
  window_h3s <- c(window_h3s, window_h3)
  window_w1s <- c(window_w1s, window_w1)
  window_w2s <- c(window_w2s, window_w2)
  window_o1s <- c(window_o1s, window_o1)
  window_o2s <- c(window_o2s, window_o2)

  basic_window_tbl <- tibble::tibble(
    name = window_names,
    wall_name = window_wall_names,
    type = window_types,
    start = window_starts,
    width = window_widths,
    height = window_heights,
    h1 = window_h1s,
    h2 = window_h2s,
    h3 = window_h3s,
    w1 = window_w1s,
    w2 = window_w2s,
    o1 = window_o1s,
    o2 = window_o2s
  )

  created_window_tbl <- structure(
    basic_window_tbl,
    class = c("window_tbl", class(basic_window_tbl))
  )
  return(created_window_tbl)
}
