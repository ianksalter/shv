# Work around used to pass package checks
# Without this line the following is a note for the package check
# no visible binding for global variable ‘measurements
utils::globalVariables(c("measurements"))

# Global design parameters
design_param <-
  tibble::tibble(
    gap = 15, # Gap in mil to allow margin of error.
    steel_width = 100, # width of the steel frame
    wall_height_low = 2600, # Height of the plaster board.
    wall_height_high = 3300, # Height of the high walls
    wall_z_start = 250, # Height at which the walls start from the base of the drawing.
    front_door_width = 1020,
    bedroom_1_length = 4150,
    bedroom_2_overlap = 380 + 1000, #How much bedroom 2 overlaps into space 3
    kitchen_unit_space = 10 + 600 + 10 + 10 + 600 + 10 + 800 + 600 + 10, #Space for all of the units on the kitchen run.
    kitchen_unit_width = 700, #Space for width of kitchen units
    bathroom_length = 2500, # The length of the bathroom
    internal_door_width = 920, # Hole left for internal doors assumes door of width 820.
    internal_door_height = 208, # Hole left for internal doors
    internal_door_overlap = 50 # The amount by which the surround sticks over the hole.
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
  front_door_width <- design_param$front_door_width
  bedroom_1_length <- design_param$bedroom_1_length
  bedroom_2_overlap <- design_param$bedroom_2_overlap
  kitchen_unit_space <- design_param$kitchen_unit_space
  kitchen_unit_width <- design_param$kitchen_unit_width
  bathroom_length <- design_param$bathroom_length
  internal_door_width <- design_param$internal_door_width
  internal_door_height <- design_param$internal_door_height
  internal_door_overlap <- design_param$internal_door_overlap

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
  # Overlap Calc for Wall 3_1 & 3_2
  existing_wall_11 <-
    existing_walls %>%
    dplyr::filter(name == "Wall_11")
  overlap_start_y <- existing_wall_11$start_y - steel_width - gap
  overlap_length <- bedroom_2_overlap + kitchen_unit_width + steel_width
  overlap_end_y <- overlap_start_y + overlap_length
  # Wall 3_1
  wall_3_1_name <- "Steel_Wall_3_1"
  wall_3_1_x_start <- wall_row$start_x + wall_row$width + gap
  wall_3_1_y_start <- wall_row$start_y + gap
  wall_3_1_width <- steel_width
  wall_3_1_length <- overlap_end_y - wall_3_1_y_start
  wall_3_1_height <- wall_height_low
  wall_3_1_z_rotation <- wall_row$rotation_z
  # Wall 3_2
  wall_3_2_name <- "Steel_Wall_3_2"
  wall_3_2_x_start <- wall_row$start_x + wall_row$width + gap
  wall_3_2_y_start <- wall_3_1_y_start + wall_3_1_length
  wall_3_2_width <- steel_width
  wall_3_2_length <- wall_row$length - gap * 2 - wall_3_1_length
  wall_3_2_height <- wall_height_high
  wall_3_2_z_rotation <- wall_row$rotation_z

  wall_row <-
    existing_walls %>%
    dplyr::filter(name == "Wall_4")
  wall_4_name <- "Steel_Wall_4"
  wall_4_x_start <- wall_row$start_x + wall_row$width + gap
  wall_4_y_start <- wall_row$start_y + gap
  wall_4_width <- steel_width
  wall_4_length <- wall_row$length - gap * 2
  wall_4_height <- wall_height_high
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
  wall_5_height <- wall_height_high
  wall_5_z_rotation <- wall_row$rotation_z


  wall_row <-
    existing_walls %>%
    dplyr::filter(name == "Wall_6")
  wall_6_name <- "Steel_Wall_6"
  wall_6_x_start <- wall_row$start_x + gap
  wall_6_y_start <- wall_row$start_y - steel_width - gap
  wall_6_width <- steel_width
  wall_6_length <- wall_row$length- gap * 2
  wall_6_height <- wall_height_high
  wall_6_z_rotation <- wall_row$rotation_z


  wall_row <-
    existing_walls %>%
    dplyr::filter(name == "Wall_7")
  wall_7_name <- "Steel_Wall_7"
  wall_7_x_start <- wall_row$start_x + gap
  wall_7_y_start <- wall_row$start_y - steel_width - gap
  wall_7_width <- steel_width
  wall_7_length <- wall_row$length - gap * 2
  wall_7_height <- wall_height_high
  wall_7_z_rotation <- wall_row$rotation_z

  # Need north wall width
  east_wall_width <-
    distance(existing, "east_wall", "width")

  wall_row <-
    existing_walls %>%
    dplyr::filter(name == "Wall_8")
  wall_8_length <-
    wall_row$length -
    gap * 2  -
    east_wall_width -
    steel_width -
    north_wall_width
  wall_8_bathroom <- bathroom_length + steel_width
  # Wall 8_1
  wall_8_1_name <- "Steel_Wall_8_1"
  wall_8_1_x_start <- wall_row$start_x - steel_width - gap
  wall_8_1_y_start <- wall_row$start_y + gap + east_wall_width + wall_8_bathroom
  wall_8_1_width <- steel_width
  wall_8_1_length <- wall_8_length - wall_8_bathroom
  wall_8_1_height <- wall_height_high
  wall_8_1_z_rotation <- wall_row$rotation_z
  # Wall 8_2
  wall_8_2_name <- "Steel_Wall_8_2"
  wall_8_2_x_start <- wall_row$start_x - steel_width - gap
  wall_8_2_y_start <- wall_row$start_y + gap + east_wall_width
  wall_8_2_width <- steel_width
  wall_8_2_length <- wall_8_bathroom
  wall_8_2_height <- wall_height_low
  wall_8_2_z_rotation <- wall_row$rotation_z

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
  wall_10_length <- wall_row$length + gap * 2
  wall_10_overlap <- bedroom_2_overlap + kitchen_unit_width
  # Wall 10_1
  wall_10_1_name <- "Steel_Wall_10_1"
  wall_10_1_x_start <- wall_row$start_x - steel_width - gap
  wall_10_1_y_start <- wall_row$start_y - gap + wall_10_overlap
  wall_10_1_width <- steel_width
  wall_10_1_length <- wall_10_length - wall_10_overlap
  wall_10_1_height <- wall_height_high
  wall_10_1_z_rotation <- wall_row$rotation_z
  # Wall 10_2
  wall_10_2_name <- "Steel_Wall_10_2"
  wall_10_2_x_start <- wall_row$start_x - steel_width - gap
  wall_10_2_y_start <- wall_row$start_y - gap
  wall_10_2_width <- steel_width
  wall_10_2_length <- wall_10_overlap
  wall_10_2_height <- wall_height_low
  wall_10_2_z_rotation <- wall_row$rotation_z

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

  wall_row <-
    existing_walls %>%
    dplyr::filter(name == "Wall_1")
  wall_bed_1_1_name <- "Steel_Wall_Bed_1_1"
  wall_bed_1_1_x_start <- wall_14_2_x_start + front_door_width
  wall_bed_1_1_y_start <- wall_row$start_y + steel_width + gap
  wall_bed_1_1_width <- steel_width
  wall_bed_1_1_length <- bedroom_1_length
  wall_bed_1_1_height <- wall_height_low
  wall_bed_1_1_z_rotation <- wall_row$rotation_z

  wall_row <-
    existing_walls %>%
    dplyr::filter(name == "Wall_11")
  wall_bed_1_2_name <- "Steel_Wall_Bed_1_2"
  wall_bed_1_2_x_start <- wall_10_1_x_start - kitchen_unit_space - steel_width
  wall_bed_1_2_y_start <- wall_bed_1_1_y_start + wall_bed_1_1_length
  wall_bed_1_2_width <- steel_width
  wall_bed_1_2_length <- wall_12_x_start - wall_bed_1_2_x_start
  wall_bed_1_2_height <- wall_height_low
  wall_bed_1_2_z_rotation <- wall_row$rotation_z



  wall_row <-
    existing_walls %>%
    dplyr::filter(name == "Wall_1")
  wall_bed_2_1_name <- "Steel_Wall_Bed_2_1"
  wall_bed_2_1_x_start <- wall_bed_1_2_x_start
  wall_bed_2_1_y_start <- wall_bed_1_2_y_start + steel_width
  # Bedroom 2 length for reuse
  bedroom_2_length <-
    wall_11_y_start +
    bedroom_2_overlap -
    wall_bed_2_1_y_start
  wall_bed_2_1_width <- steel_width
  wall_bed_2_1_length <-
    bedroom_2_length +
    steel_width +
    kitchen_unit_width
  wall_bed_2_1_height <- wall_height_low
  wall_bed_2_1_z_rotation <- wall_row$rotation_z

  wall_row <-
    existing_walls %>%
    dplyr::filter(name == "Wall_11")
  wall_bed_2_2_name <- "Steel_Wall_Bed_2_2"
  wall_bed_2_2_x_start <- wall_bed_2_1_x_start + steel_width
  wall_bed_2_2_y_start <- wall_bed_2_1_y_start + steel_width + bedroom_2_length
  wall_bed_2_2_width <- steel_width
  wall_bed_2_2_length <- kitchen_unit_space
  wall_bed_2_2_height <- wall_height_low
  wall_bed_2_2_z_rotation <- wall_row$rotation_z

  wall_corridor_1_name <- "Steel_Wall_Corridor_1"
  # Space for bedroom 1 door
  bedroom_1_door_space <- internal_door_width + 2 * internal_door_overlap
  wall_corridor_1_x_start <- wall_1_x_start + steel_width
  wall_corridor_1_y_start <-
    wall_bed_1_1_y_start +
    wall_bed_1_1_length -
    bedroom_1_door_space #TODO: Add space for the plasterboard.
  wall_corridor_1_width <- steel_width
  wall_corridor_1_length <-
    wall_bed_1_1_x_start -
    wall_1_x_start -
    steel_width
  wall_corridor_1_height <- wall_height_low
  wall_corridor_1_z_rotation <- 0

  wall_corridor_2_name <- "Steel_Wall_Corridor_2"
  wall_corridor_2_x_start <- wall_corridor_1_x_start
  wall_corridor_2_y_start <-
    wall_bed_2_1_y_start +
    wall_bed_2_1_length -
    steel_width
  wall_corridor_2_width <- steel_width
  wall_corridor_2_length <-
    wall_bed_2_1_x_start -
    wall_3_1_x_start -
    steel_width
  wall_corridor_2_height <- wall_height_high
  wall_corridor_2_z_rotation <- 0

  wall_bath_1_name <- "Steel_Wall_Bath_1"
  wall_bath_1_x_start <- wall_9_x_start
  wall_bath_1_y_start <- wall_9_y_start + steel_width
  wall_bath_1_width <- steel_width
  wall_bath_1_length <- bathroom_length
  wall_bath_1_height <- wall_height_high
  wall_bath_1_z_rotation <- 90

  wall_bath_2_name <- "Steel_Wall_Bath_2"
  wall_bath_2_x_start <- wall_bath_1_x_start
  wall_bath_2_y_start <- wall_bath_1_y_start + bathroom_length
  wall_bath_2_width <- steel_width
  wall_bath_2_length <- wall_9_length
  wall_bath_2_height <- wall_height_high
  wall_bath_2_z_rotation <- 0


  wall_bath_3_name <- "Steel_Wall_Bath_3"
  wall_bath_3_x_start <- wall_9_x_start
  wall_bath_3_y_start <- wall_9_y_start
  wall_bath_3_z_start <- wall_z_start + wall_height_low
  wall_bath_3_width <- steel_width
  wall_bath_3_length <-
    wall_10_1_x_start +
    steel_width -
    wall_bath_3_x_start
  wall_bath_3_height <- wall_height_high - wall_height_low
  wall_bath_3_z_rotation <- 0

  wall_kitchen_name <- "Steel_Wall_Kitchen"
  wall_kitchen_x_start <- wall_bed_2_1_x_start
  wall_kitchen_y_start <- wall_corridor_2_y_start
  wall_kitchen_z_start <- wall_z_start + wall_height_low
  wall_kitchen_width <- steel_width
  wall_kitchen_length <- wall_bed_2_2_length + 2 * steel_width
  wall_kitchen_height <- wall_height_high - wall_height_low
  wall_kitchen_z_rotation <- 0

 wall_names <-
   c(wall_1_name,
     wall_2_name,
     wall_3_1_name,
     wall_3_2_name,
     wall_4_name,
     wall_5_name,
     wall_6_name,
     wall_7_name,
     wall_8_1_name,
     wall_8_2_name,
     wall_9_name,
     wall_10_1_name,
     wall_10_2_name,
     wall_11_name,
     wall_12_name,
     wall_13_name,
     wall_14_1_name,
     wall_14_2_name,
     wall_14_3_name,
     wall_bed_1_1_name,
     wall_bed_1_2_name,
     wall_bed_2_1_name,
     wall_bed_2_2_name,
     wall_corridor_1_name,
     wall_corridor_2_name,
     wall_bath_1_name,
     wall_bath_2_name,
     wall_bath_3_name,
     wall_kitchen_name)

 wall_x_starts <-
   c(wall_1_x_start,
     wall_2_x_start,
     wall_3_1_x_start,
     wall_3_2_x_start,
     wall_4_x_start,
     wall_5_x_start,
     wall_6_x_start,
     wall_7_x_start,
     wall_8_1_x_start,
     wall_8_2_x_start,
     wall_9_x_start,
     wall_10_1_x_start,
     wall_10_2_x_start,
     wall_11_x_start,
     wall_12_x_start,
     wall_13_x_start,
     wall_14_1_x_start,
     wall_14_2_x_start,
     wall_14_3_x_start,
     wall_bed_1_1_x_start,
     wall_bed_1_2_x_start,
     wall_bed_2_1_x_start,
     wall_bed_2_2_x_start,
     wall_corridor_1_x_start,
     wall_corridor_2_x_start,
     wall_bath_1_x_start,
     wall_bath_2_x_start,
     wall_bath_3_x_start,
     wall_kitchen_x_start)

 wall_y_starts <-
   c(wall_1_y_start,
     wall_2_y_start,
     wall_3_1_y_start,
     wall_3_2_y_start,
     wall_4_y_start,
     wall_5_y_start,
     wall_6_y_start,
     wall_7_y_start,
     wall_8_1_y_start,
     wall_8_2_y_start,
     wall_9_y_start,
     wall_10_1_y_start,
     wall_10_2_y_start,
     wall_11_y_start,
     wall_12_y_start,
     wall_13_y_start,
     wall_14_1_y_start,
     wall_14_2_y_start,
     wall_14_3_y_start,
     wall_bed_1_1_y_start,
     wall_bed_1_2_y_start,
     wall_bed_2_1_y_start,
     wall_bed_2_2_y_start,
     wall_corridor_1_y_start,
     wall_corridor_2_y_start,
     wall_bath_1_y_start,
     wall_bath_2_y_start,
     wall_bath_3_y_start,
     wall_kitchen_y_start)


 no_of_walls <- length(wall_names)
 wall_z_starts <- c(rep(wall_z_start, times = no_of_walls - 2),
                    wall_bath_3_z_start,
                    wall_kitchen_z_start)

 wall_widths <-
   c(wall_1_width,
     wall_2_width,
     wall_3_1_width,
     wall_3_2_width,
     wall_4_width,
     wall_5_width,
     wall_6_width,
     wall_7_width,
     wall_8_1_width,
     wall_8_2_width,
     wall_9_width,
     wall_10_1_width,
     wall_10_2_width,
     wall_11_width,
     wall_12_width,
     wall_13_width,
     wall_14_1_width,
     wall_14_2_width,
     wall_14_3_width,
     wall_bed_1_1_width,
     wall_bed_1_2_width,
     wall_bed_2_1_width,
     wall_bed_2_2_width,
     wall_corridor_1_width,
     wall_corridor_2_width,
     wall_bath_1_width,
     wall_bath_2_width,
     wall_bath_3_width,
     wall_kitchen_width)

 wall_lengths <-
   c(wall_1_length,
     wall_2_length,
     wall_3_1_length,
     wall_3_2_length,
     wall_4_length,
     wall_5_length,
     wall_6_length,
     wall_7_length,
     wall_8_1_length,
     wall_8_2_length,
     wall_9_length,
     wall_10_1_length,
     wall_10_2_length,
     wall_11_length,
     wall_12_length,
     wall_13_length,
     wall_14_1_length,
     wall_14_2_length,
     wall_14_3_length,
     wall_bed_1_1_length,
     wall_bed_1_2_length,
     wall_bed_2_1_length,
     wall_bed_2_2_length,
     wall_corridor_1_length,
     wall_corridor_2_length,
     wall_bath_1_length,
     wall_bath_2_length,
     wall_bath_3_length,
     wall_kitchen_length)

 wall_heights <-
   c(wall_1_height,
     wall_2_height,
     wall_3_1_height,
     wall_3_2_height,
     wall_4_height,
     wall_5_height,
     wall_6_height,
     wall_7_height,
     wall_8_1_height,
     wall_8_2_height,
     wall_9_height,
     wall_10_1_height,
     wall_10_2_height,
     wall_11_height,
     wall_12_height,
     wall_13_height,
     wall_14_1_height,
     wall_14_2_height,
     wall_14_3_height,
     wall_bed_1_1_height,
     wall_bed_1_2_height,
     wall_bed_2_1_height,
     wall_bed_2_2_height,
     wall_corridor_1_height,
     wall_corridor_2_height,
     wall_bath_1_height,
     wall_bath_2_height,
     wall_bath_3_height,
     wall_kitchen_height)

 wall_z_rotations <-
   c(wall_1_z_rotation,
     wall_2_z_rotation,
     wall_3_1_z_rotation,
     wall_3_2_z_rotation,
     wall_4_z_rotation,
     wall_5_z_rotation,
     wall_6_z_rotation,
     wall_7_z_rotation,
     wall_8_1_z_rotation,
     wall_8_2_z_rotation,
     wall_9_z_rotation,
     wall_10_1_z_rotation,
     wall_10_2_z_rotation,
     wall_11_z_rotation,
     wall_12_z_rotation,
     wall_13_z_rotation,
     wall_14_1_z_rotation,
     wall_14_2_z_rotation,
     wall_14_3_z_rotation,
     wall_bed_1_1_z_rotation,
     wall_bed_1_2_z_rotation,
     wall_bed_2_1_z_rotation,
     wall_bed_2_2_z_rotation,
     wall_corridor_1_z_rotation,
     wall_corridor_2_z_rotation,
     wall_bath_1_z_rotation,
     wall_bath_2_z_rotation,
     wall_bath_3_z_rotation,
     wall_kitchen_z_rotation)

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
  window_type <- "Simple door"
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
