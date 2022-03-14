#' hole_locations
#'
#' Calculates a tibble of absolute hole data given a tibble of walls and a
#' tibble of relative holedata
#'
#' @param wall_tbl a tibble of wall data
#' @param relative_hole_tbl tibble a of hole data relative to the walls
#'
#' @return A a tibble of absolute hole data that can be used to draw the holes
#' within the walls on blender.
#' @export
#' @examples
#' wall_tbl <-
#'   tibble::tribble(
#'   )
#'
#' hole_locations(wall_tbl, relative_hole_tbl)
hole_locations <- function(wall_tbl, relative_hole_tbl){
  #TODO write code to create absolute wall tbl
absolute_hole_tbl <- NULL
  return(absolute_hole_tbl)
}
