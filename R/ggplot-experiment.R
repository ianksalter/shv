library(ggplot2)

df <- data.frame(
  x = c(0, 0, 1, 1),
  y = c(0, 1, 1, 0),
  w = c(0.25, 0, 0.25, 0.75),
  z = c(0.25, 0.5, 0.75, 0.25)
  )

ggplot(df, aes(x, y)) +
  geom_tile()
ggplot(df, aes(x, y, width = w)) +
  geom_tile(aes(fill = z), colour = "grey50")
ggplot(df, aes(xmin = x - w / 2, xmax = x + w / 2, ymin = y, ymax = y + 1)) +
  geom_rect(aes(fill = z), colour = "grey50")

  ggplot2::ggplot() +
    ggplot2::geom_tile(
      data = df,
      color = "darkgray",
      fill = "lightgray",
      ggplot2::aes(
        x = x,
        y = y,
        height = 1,
        width = 1
      )
    )

  ggplot(df) +
    geom_polygon(aes(x = x, y = y), fill = "lightgrey", colour = "darkgrey") +
    geom_polygon(aes(x = w, y = z), fill = "orange", colour = "red")

#' Creates a helper function that draws a wall in 2d form
#'
#' Uses a wall vector do draw a wall using geom_polygon
#'
#' @param wall a vector? of type wall
#' @return ggplot grammar for drawing the wall
#'
#' @importFrom ggplot2 geom_polygon
#'
#' @export
#' @examples
#' wall <-
#'   tibble::tibble(
#'     name = "Pillar",
#'     location_x = 1,
#'     location_y = 0.1,
#'     location_z = 1.5,
#'     length = 2,
#'     width = 0.2,
#'     height = 3,
#'     start_x = 0,
#'     start_y = 0,
#'     start_z = 0,
#'   )
#'
#' polygon_function(wall)
polygon_walls <- function(walls_tbl){

  created_geom <- ggplot2::geom_blank()

  no_rows <- nrow(walls_tbl)
  for(i in 1:no_rows){
    wall <- walls_tbl[i,]
    angle <- (pi * wall$rotation_z / 180)
    x_one <- wall$start_x
    y_one <- wall$start_y
    l <- wall$length
    w <- wall$width

    x_coords = c(x_one,
                 x_one + l * cos(angle),
                 x_one + l * cos(angle) + w * cos(angle + pi / 2),
                 x_one +w * cos(angle + pi / 2))

    y_coords = c(x_one,
                 y_one + l * sin(angle),
                 y_one + l * sin(angle) + w * sin(angle + pi / 2),
                 y_one + w * sin(angle + pi / 2))

    df <- data.frame(x_coords,
                     y_coords)

    created_geom <- created_geom +
      geom_polygon(aes(x = x_coords, y = y_coords), fill = "lightgrey", colour = "darkgrey")
  }

  return(created_geom)
  }

walls_df <- data.frame(
  start_x = c(0, 1),
  start_y = c(0.38, 1),
  length = c(3.39, 2),
  width = c(0.10, 0.2),
  rotation_z = c(90, 60)
)

walls_df <- data.frame(
  start_x = c(0),
  start_y = c(0.38),
  length = c(3.39),
  width = c(0.1),
  rotation_z = c(90)
)

ggplot(data = NULL) +
  polygon_wall(walls_df) +
  ggplot2::coord_fixed(ratio = 1)

ggplot(df) +
  geom_polygon(aes(x = grid_x, y = grid_y), fill = "lightgrey", colour = "darkgrey") +
  geom_polygon(aes(x = x_coords, y = y_coords), fill = "black", colour = "tan") +
  ggplot2::coord_fixed(ratio = 1)
