#' hole_locations
#'
#' Calculates a tibble of absolute hole data given a tibble of walls and a
#' tibble of relative hole data
#'
#' @param wall_tbl a tibble of wall data
#' @param relative_hole_tbl tibble a of hole data relative to the walls
#'
#' @return A a tibble of absolute hole data that can be used to draw the holes
#' within the walls on blender.
#' @export
#' @examples
#'
#' name <- c("Wall_1", "Wall_2", "Wall_3", "Wall_4")
#' start_x <- c(0, 1, 0, 1)
#' start_y <- c(0, 0, 1, 1)
#' start_z <- c(0, 0, 0, 0)
#' wall_length <- c(2, 2, 2, 2)
#' wall_width <- c(0.1, 0.2, 0.1, 0.1)
#' wall_height <- c(3, 3, 3, 3)
#' rotation_z <- c(0, 90, 45, -60)
#' location_before_rotation_x <- wall_length / 2
#' location_before_rotation_y <-
#'   wall_width / 2 * ifelse(rotation_z <= 0, 1, -1) # Pivot correction
#' location_x <-
#'   start_x +
#'   z_rotate_x(location_before_rotation_x,
#'              location_before_rotation_y,
#'              rotation_z)
#' location_y <-
#'   start_y +
#'   z_rotate_y(location_before_rotation_x,
#'              location_before_rotation_y,
#'              rotation_z)
#' location_z <- wall_height / 2
#' wall_tbl <-
#'   tibble::tibble(
#'     name = name,
#'     location_x = location_x,
#'     location_y = location_y,
#'     location_z = location_z,
#'     length = wall_length,
#'     width = wall_width,
#'     height = wall_height,
#'     start_x = start_x,
#'     start_y = start_y,
#'     start_z = start_z,
#'     rotation_z = rotation_z
#'   )
#'
#' hole_name <- c("Hole_1", "Hole_2", "Hole_3", "Hole_4")
#' hole_start_x <- c(0.5, 1, 0.5, 1)
#' hole_start_z <- c(0, 1, 0, 1)
#' hole_length <- c(1, 0.5, 1, 0.5)
#' hole_height <- c(2, 1, 2, 1)
#' wall_name <- c("Wall_1", "Wall_2", "Wall_3", "Wall_4")
#' relative_hole_tbl <-
#'   tibble::tibble(
#'     name = hole_name,
#'     start_x = hole_start_x,
#'     start_z = hole_start_z,
#'     hole_length = hole_length,
#'     hole_height = hole_height,
#'     wall_name = wall_name
#'   )
#'
#' hole_locations(wall_tbl, relative_hole_tbl)
hole_locations <- function(wall_tbl, relative_hole_tbl){

  whole_hole_tibble <- dplyr::left_join(relative_hole_tbl, wall_tbl, by = c("wall_name" = "name"))

  absolute_hole_tbl <-
    tibble::tibble(
      name = whole_hole_tibble$name,
      location_x =
        whole_hole_tibble$start_x.y +
        z_rotate_x(whole_hole_tibble$start_x.x + whole_hole_tibble$hole_length / 2,
                   whole_hole_tibble$width / 2* ifelse(whole_hole_tibble$rotation_z <= 0, 1, -1),
                   wall_tbl$rotation_z),
      location_y =
        whole_hole_tibble$start_y +
        z_rotate_y(whole_hole_tibble$start_x.x + whole_hole_tibble$hole_length / 2,
                   whole_hole_tibble$width / 2* ifelse(whole_hole_tibble$rotation_z <= 0, 1, -1),
                   wall_tbl$rotation_z),
      location_z =
        whole_hole_tibble$start_z.y + whole_hole_tibble$start_z.x + whole_hole_tibble$hole_height / 2,
      length = whole_hole_tibble$hole_length,
      width = whole_hole_tibble$width,
      height = whole_hole_tibble$hole_height,
      rotation_z = whole_hole_tibble$rotation_z,
      wall_name = whole_hole_tibble$wall_name
    )

  return(absolute_hole_tbl)
}
