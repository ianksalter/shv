test_that("Dummy test to get R Studio Run Tests button", {
  expect_true(TRUE)
})

describe("generate_existing_pillars", {

  it("Returns a tibble of existing pillars",
     {
       pillars <- generate_existing_pillars()

       expected_no_rows <- 10
       actual_no_rows <- nrow(pillars)
       expect_equal(actual_no_rows, expected_no_rows)

       # expected_columns <-
       #   c("name", "location_x", "location_y", "location_z",
       #     "length", "width", "height", "x_start", "y_start", "z_start")
       # actual_columns <- names(pillars)
       # expect_setequal(actual_columns, expected_columns)

       expected_class <- c("pillar_tbl", "tbl_df", "tbl", "data.frame")
       actual_class <- class(pillars)
       expect_equal(actual_class, expected_class)

     }
  )

})

describe("generate_existing_walls", {

  it("Returns a tibble of existing walls",
     {
       walls <- generate_existing_walls()

       expected_no_rows <- 14
       actual_no_rows <- nrow(walls)
       expect_equal(actual_no_rows, expected_no_rows)

       # expected_columns <-
       #   c("name", "location_x", "location_y", "location_z",
       #     "length", "width", "height",
       #     "z_rotation", "x_start", "y_start", "z_start")
       # actual_columns <- names(pillars)
       # expect_setequal(actual_columns, expected_columns)

       expected_class <- c("wall_tbl", "tbl_df", "tbl", "data.frame")
       actual_class <- class(walls)
       expect_equal(actual_class, expected_class)

     }
  )

})


describe("wall_loc_x", {

  it("A vector giving the corresponding x locations for the walls.",
     {

       start_x <- c(0, 1, 0, 1)
       wall_length <- c(1, 2, 1, 1)
       wall_width <- c(0.1, 0.2, 0.1, 0.1)
       rotation_z <- c(0, 90, 45, -60)

       rotaion_z_rad <- pi * rotation_z / 180
       expected_wall_loc_x <-
         c(
           start_x[1] + wall_length[1] / 2,
           start_x[2] + wall_width[2] / 2,
           start_x[3] +
             cos(rotaion_z_rad[3]) * wall_length[3] / 2 +
             sin(rotaion_z_rad[3]) * wall_width[3] /2,
           start_x[4] +
             cos(rotaion_z_rad[4]) * wall_length[4] / 2 +
             sin(rotaion_z_rad[4]) * wall_width[4] /2
         )
       actual_wall_loc_x <-
         wall_loc_x(start_x, wall_length, wall_width, rotation_z)

       # expect_equal(actual_wall_loc_x, expected_wall_loc_x)
     }
  )

})


describe("wall_loc_y", {

  it("A vector giving the corresponding y locations for the walls.",
     {

       start_y <- c(0, 0, 1, 1)
       wall_length <- c(1, 2, 1, 1)
       wall_width <- c(0.1, 0.2, 0.1, 0.1)
       rotation_z <- c(0, 90, 45, -60)

       rotaion_z_rad <- pi * rotation_z / 180

       expected_wall_loc_y <-
         c(
           start_y[1] + wall_width[1] / 2,
           start_y[2] + wall_length[2] / 2,
           start_y[3] +
             sin(rotaion_z_rad[3]) * wall_length[3] / 2 -
             cos(rotaion_z_rad[3]) * wall_width[3] /2,
           start_y[4] -
             sin(rotaion_z_rad[4]) * wall_length[4] / 2 -
             cos(rotaion_z_rad[4]) * wall_width[4] /2
         )
       actual_wall_loc_y <-
         wall_loc_y(start_y, wall_length, wall_width, rotation_z)
       # expect_equal(actual_wall_loc_y, expected_wall_loc_y)
     }
  )

})
