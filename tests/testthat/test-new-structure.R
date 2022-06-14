test_that("Dummy test to get R Studio Run Tests button", {
  expect_true(TRUE)
})


describe("generate_new_walls", {

  it("Returns a tibble of new walls",
     {
       walls <- generate_new_walls()

       expected_no_rows <- 20
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

       # utils::data("measurements", envir = environment())
       # existing_measurements <- measurements
       # # Check distance between walls 1 and 13
       # expected_distance =
       #   distance(existing_measurements, "space_1", "x_direction")
       # wall_1 <- dplyr::filter(walls, name == "Wall_1")
       # wall_13 <- dplyr::filter(walls, name == "Wall_13")
       # actual_distance =
       #   wall_13$location_x -
       #   wall_1$location_x -
       #   wall_13$width/2 -
       #   wall_1$width/2
       # expect_equal(actual_distance, expected_distance)
       #
       # # Check distance between walls 2 and 12
       # expected_distance =
       #   distance(existing_measurements, "space_2", "x_direction")
       # wall_2 <- dplyr::filter(walls, name == "Wall_2")
       # wall_12 <- dplyr::filter(walls, name == "Wall_12")
       # actual_distance =
       #   wall_12$location_x -
       #   wall_2$location_x -
       #   wall_12$width/2 -
       #   wall_2$width/2
       # expect_equal(actual_distance, expected_distance)
       #
       # # Check distance between walls 3 and 10
       # expected_distance =
       #   distance(existing_measurements, "space_3", "x_direction")
       # wall_3 <- dplyr::filter(walls, name == "Wall_3")
       # wall_10 <- dplyr::filter(walls, name == "Wall_10")
       # actual_distance =
       #   wall_10$location_x -
       #   wall_3$location_x -
       #   wall_10$width/2 -
       #   wall_3$width/2
       # expect_equal(actual_distance, expected_distance)
       #
       # # Check distance between walls 4 and 8
       # expected_distance =
       #   distance(existing_measurements, "space_4", "x_direction")
       # wall_4 <- dplyr::filter(walls, name == "Wall_4")
       # wall_8 <- dplyr::filter(walls, name == "Wall_8")
       # actual_distance =
       #   wall_8$location_x -
       #   wall_4$location_x -
       #   wall_8$width/2 -
       #   wall_4$width/2
       # expect_equal(actual_distance, expected_distance)
       #
       #
       # # Check distance between walls 7 and 9
       # expected_distance =
       #   distance(existing_measurements, "space_4", "y_direction")
       # wall_7 <- dplyr::filter(walls, name == "Wall_7")
       # wall_9 <- dplyr::filter(walls, name == "Wall_9")
       # actual_distance =
       #   wall_7$location_y -
       #   wall_9$location_y -
       #   wall_9$width/2 -
       #   wall_7$width/2
       # expect_equal(actual_distance, expected_distance)
       #
       # # Check distance between walls 9 and 11
       # expected_distance =
       #   distance(existing_measurements, "space_3", "y_direction") -
       #   distance(existing_measurements, "east_wall", "width") * 2
       #
       # wall_9 <- dplyr::filter(walls, name == "Wall_9")
       # wall_11 <- dplyr::filter(walls, name == "Wall_11")
       # actual_distance =
       #   wall_9$location_y -
       #   wall_11$location_y -
       #   wall_11$width/2 -
       #   wall_9$width/2
       # expect_equal(actual_distance, expected_distance)



     }
  )

})


describe("generate_new_windows", {

  it("Returns a tibble of new windows and doors",
     {
       windows <- generate_new_windows()

       expected_no_rows <- 1
       actual_no_rows <- nrow(windows)
       expect_equal(actual_no_rows, expected_no_rows)

       # expected_columns <-
       #   c("name", "location_x", "location_y", "location_z",
       #     "length", "width", "height",
       #     "z_rotation", "x_start", "y_start", "z_start")
       # actual_columns <- names(pillars)
       # expect_setequal(actual_columns, expected_columns)

       expected_class <- c("window_tbl", "tbl_df", "tbl", "data.frame")
       actual_class <- class(windows)
       expect_equal(actual_class, expected_class)


     }
  )

})

