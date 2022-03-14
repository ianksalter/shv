#' z_rotate_x
#'
#' Calculate the x_value of a vector of point vectors rotated around the z_axis.
#'
#' @param point_x a vector of x values for the points.
#' @param point_y a vector giving the y values of the points.
#' @param rotation_z - a vector of rotations in degrees where each rotation is
#' is greater than -90 degrees and no more than 90 degrees.
#'
#' @return A vector giving the x values of the points after the rotations
#' @export
#' @examples
#' point_x <- c(0, 0, 2, 18, 20, 20)
#' point_y <- c(18, 18, 18, 18, 20, 20)
#' rotation_z <- c(0, 90, 0, 90, 60, -30)
#' z_rotate_x(point_x, point_y, rotation_z)
z_rotate_x <- function(point_x, point_y, rotation_z){
  assertthat::assert_that(
    all(rotation_z > -90),
    msg = "rotation_z must be greater than -90")
  assertthat::assert_that(
    all(rotation_z <= 90),
    msg = "rotation_z must be less than or equal to 90")
  assertthat::assert_that(
    all(point_x >= 0),
    msg = "point_x must be greater than or equal to 0")

  z_rotations_rads <- pi * rotation_z / 180


  rotated_x_points <-
    point_x * cos(z_rotations_rads) - point_y * sin(z_rotations_rads)
  return(rotated_x_points)
}

#' z_rotate_y
#'
#' Calculate the y value of a vector of point vectors rotated around the z_axis.
#'
#' @param point_x a vector of x values for the points.
#' @param point_y a vector giving the y values of the points.
#' @param rotation_z - a vector of rotations in degrees where each rotation is
#' is greater than -90 degrees and no more than 90 degrees.
#'
#' @return A vector giving the y values of the points after the rotations
#' @export
#' @examples
#' point_x <- c(0, 0, 2, 18, 20, 20)
#' point_y <- c(18, 18, 18, 18, 20, 20)
#' rotation_z <- c(0, 90, 0, 90, 60, -30)
#' z_rotate_y(point_x, point_y, rotation_z)
z_rotate_y <- function(point_x, point_y, rotation_z){
  assertthat::assert_that(
    all(rotation_z > -90),
    msg = "rotation_z must be greater than -90")
  assertthat::assert_that(
    all(rotation_z <= 90),
    msg = "rotation_z must be less than or equal to 90")
  assertthat::assert_that(
    all(point_x >= 0),
    msg = "point_x must be greater than or equal to 0")

  z_rotations_rads <- pi * rotation_z / 180

  rotated_y_points <-
    point_x * sin(z_rotations_rads) + point_y * cos(z_rotations_rads)
  return(rotated_y_points)
}
