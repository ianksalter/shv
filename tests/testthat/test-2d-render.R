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
           location_x = c(1, 1),
           location_y = c(1, 1),
           location_z = c(0, 0),
           length = c(3, 2),
           width = c(0.1, 0.2),
           height = c(4.7, 3),
           rotation_z = c(90, 60)
         )

       polygon_df_1 <- data.frame(
         x_coord = c(1, 1.1, 1.1, 1),
         y_coord = c(1, 1, 4, 4)
       )

       polygon_df_2 <- data.frame(
         x_coord = c(1.0000000, 2.0000000, 1.8267949, 0.8267949),
         y_coord = c(1.000000, 2.732051, 2.832051, 1.100000)
       )

       expected_code <-
         ggplot2::geom_blank() +
         ggplot2::geom_polygon(
           data = polygon_df_1,
           color = "darkgray",
           fill = "lightgray",
           ggplot2::aes(
             x = x_coord,
             y = y_coord,
           )
         ) +
         ggplot2::geom_polygon(
           data = polygon_df_2,
           color = "darkgray",
           fill = "lightgray",
           ggplot2::aes(
             x = x_coord,
             y = y_coord,
           )
         )
       actual_code <- walls_2d(test_walls)
       expect_true(all.equal(actual_code, expected_code))
     }
  )
})
