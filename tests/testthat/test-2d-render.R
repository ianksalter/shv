test_that("Dummy test to get R Studio Run Tests button", {
  expect_true(TRUE)
})

describe("pillars_2d", {

  it("Creates ggplot2 code for drawing a pillars for ultimately saving to png file",
     {
       test_pillars <-
         tibble::tibble(
           name = "Pillar",
           location_x = 1,
           location_y = 1,
           location_z = 0,
           length = 0.2,
           width = 0.2,
           height = 3
         )

       expected_code <-
         ggplot2::geom_tile(
           data = test_pillars,
           color = "darkgray",
           fill = "lightgray",
           ggplot2::aes(
             x = location_x,
             y = location_y,
             height = length,
             width = width
           )
         )
       actual_code <- pillars_2d(test_pillars)
       expect_true(all.equal(actual_code, expected_code))
     }
  )
})

describe("walls_2d", {

  it("Creates ggplot2 code for drawing a walls for ultimately saving to png file",
     {
       test_walls <-
         tibble::tibble(
           name = c("wall_a", "wall_b"),
           start_x = c(0, 1),
           start_y = c(0, 1),
           start_z = c(0, 0),
           length = c(3, 2),
           width = c(0.1, 0.2),
           height = c(4.7, 3),
           rotation_z = c(90, 60)
         )

       polygon_df_1 <- data.frame(
         x_coord = c(0, 0, 0.1, 0.1),
         y_coord = c(0, 3, 3, 0)
       )

       wall_2 <- test_walls[2,]
       angle = wall_2$rotation_z * pi / 180
       start_x <- wall_2$start_x
       start_y <- wall_2$start_y
       length <- wall_2$length
       width <- wall_2$width
       polygon_df_2 <- data.frame(
         x_coord = c(start_x,
                     start_x + length * cos(angle),
                     start_x + length * cos(angle) + width * sin(angle),
                     start_x + width * sin(angle)),
         y_coord = c(start_y,
                     start_y + length * sin(angle),
                     start_y + length * sin(angle) + width * cos(angle),
                     start_y + width * cos(angle))
       )

       expected_code <-
         list(
           ggplot2::geom_blank(),
           ggplot2::geom_polygon(
             data = polygon_df_1,
             fill = "lightgrey",
             color = "darkgrey",
             ggplot2::aes(
               x = x_coord,
               y = y_coord,
             )
           ),
           ggplot2::geom_polygon(
             data = polygon_df_2,
             fill = "lightgrey",
             color = "darkgrey",
             ggplot2::aes(
               x = x_coord,
               y = y_coord,
             )
           )
         )
       actual_code <- walls_2d(test_walls)
       #Compare elements
       expect_true(all.equal(actual_code[[1]], expected_code[[1]]))
       expect_true(all.equal(actual_code[[2]], expected_code[[2]]))
       expect_true(all.equal(actual_code[[3]]$aes_params,
                             expected_code[[3]]$aes_params))
       expect_true(all.equal(actual_code[[3]]$data,
                             expected_code[[3]]$data))

       #expect_true(all.equal(actual_code[[3]], expected_code[[3]]))
     }
  )
})
