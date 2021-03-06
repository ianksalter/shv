# Work around used to pass package checks
# Without this line the following is a note for the package check
# no visible binding for global variable ‘existing-pillars'/'location_x'/
# 'location_y'/'width'
utils::globalVariables(c("existing_pillars", "location_x", "location_y",
                         "width", "existing_walls"))


#' Creates ggplot2 code for drawing a pillars for ultimately saving to png file
#'
#' Uses a tibble of python pillar data to generate ggplot code for pillar
#' generation
#'
#' @param pillar_tbl a object of type pillar_tbl
#' @return ggplot grammar for drawing the pillars described in pillar_tbl
#'
#' @export
#' @examples
#' pillars <-
#'   tibble::tibble(
#'     name = "Pillar",
#'     location_x = 1,
#'     location_y = 1,
#'     location_z = 0,
#'     length = 0.2,
#'     width = 0.2,
#'     height = 3
#'   )
#'
#' pillars_2d(pillars)
pillars_2d <- function(pillar_tbl){
  created_grammar <-
    ggplot2::geom_tile(
      data = pillar_tbl,
      color = "darkgray",
      fill = "lightgray",
      ggplot2::aes(
        x = location_x,
        y = location_y,
        height = length,
        width = width
      )
    )
  return(created_grammar)
}

#' Creates ggplot2 code for drawing a walls for ultimately saving to png file
#'
#' Uses a tibble of python wall data to generate ggplot code for wall
#' generation
#'
#' @param walls_tbl a object of type wall_tbl
#' @return ggplot grammar for drawing the walls described in wall_tbl
#'
#' @export
#' @examples
#' walls <-
#'   tibble::tibble(
#'     name = "wall",
#'     location_x = 1,
#'     location_y = 0.1,
#'     location_z = 1.5,
#'     length = 2,
#'     width = 0.2,
#'     height = 3,
#'     rotation_z = 0,
#'     start_x = 0,
#'     start_y = 0,
#'     start_z = 0,
#'   )
#'
#' walls_2d(walls)
walls_2d <- function(walls_tbl){

  created_geom <- ggplot2::geom_blank()
  no_rows <- nrow(walls_tbl)
  for(i in 1:no_rows){
    wall <- walls_tbl[i,]
    angle <- (pi * wall$rotation_z / 180)
    start_x <- wall$start_x
    start_y <- wall$start_y
    length <- wall$length
    width <- wall$width
    x_coord = c(start_x,
                 start_x + length * cos(angle),
                 start_x + length * cos(angle) + width * sin(angle),
                 start_x + width * sin(angle))

    y_coord = c(start_y,
                 start_y + length * sin(angle),
                 start_y + length * sin(angle) + width * cos(angle),
                 start_y + width * cos(angle))
    df <- data.frame(x_coord,
                     y_coord)
    created_geom <-
      c(created_geom,
        ggplot2::geom_polygon(
          data = df,
          ggplot2::aes(x = x_coord, y = y_coord),
          fill = "lightgrey", colour = "darkgrey")
      )
  }
  return(created_geom)
}

#' Creates a png file for the 2d representation of shell of the existing
#' structure
#'
#' Uses package data on the existing building to create a png file using ggplot2
#'
#' @importFrom dplyr %>%
#'
#' @export
#' @examples
#' # For check() which has its own working directory
#' logger::log_info("Working directory for 2d: ", getwd())
#' dir.create("png") # For check which has its own working directory.
#' create_shell_2d()
#' unlink("png", recursive = TRUE) # For check which has its own working directory.
create_shell_2d <- function(){
  utils::data("existing_pillars", envir = environment())
  utils::data("existing_walls", envir = environment())
  created_ggplot <-
    ggplot2::ggplot(data = NULL) +
    ggplot2::coord_fixed(ratio = 1) +
    pillars_2d(existing_pillars) +
    walls_2d(existing_walls) +
    ggplot2::theme(
      legend.position = "none",
      panel.grid = ggplot2::element_blank(),
      axis.title = ggplot2::element_blank(),
      axis.text = ggplot2::element_blank(),
      axis.ticks = ggplot2::element_blank(),
      panel.background = ggplot2::element_blank()
    )
  ggplot2::ggsave("png/shell.png",
                  created_ggplot, device = "png",
                  width = 10,
                  height = 20,
                  units = "cm")
}
