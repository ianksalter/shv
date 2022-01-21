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

       expected_class <- c("wall_tbl", "tbl_df", "tbl", "data.frame")
       actual_class <- class(walls)
       expect_equal(actual_class, expected_class)

       # expected_wall_1_location_x <-
       #   dplyr::filter(walls, name == "Wall_1")$start_x +
       #   dplyr::filter(walls, name == "Wall_1")$width / 2
       # actual_wall_1_location_x <-
       #   dplyr::filter(walls, name == "Wall_1")$location_x
       # expect_equal(actual_wall_1_location_x,
       #              expected_wall_1_location_x)
       #
       # expected_wall_1_location_y <-
       #   dplyr::filter(walls, name == "Wall_1")$start_y +
       #   dplyr::filter(walls, name == "Wall_1")$length /2
       # expected_wall_1_location_y <-
       #   dplyr::filter(walls, name == "Wall_1")$location_y
       # expect_equal(expected_wall_1_location_y,
       #              expected_wall_1_location_y)
     }
  )

})



describe("wall_loc_x", {

  it("A vector giving the corresponding x locations for the walls.",
     {
       walls <- generate_existing_walls()

       expected_no_rows <- 14
       actual_no_rows <- nrow(walls)
       expect_equal(actual_no_rows, expected_no_rows)

       expected_class <- c("wall_tbl", "tbl_df", "tbl", "data.frame")
       actual_class <- class(walls)
       expect_equal(actual_class, expected_class)

       # expected_wall_1_location_x <-
       #   dplyr::filter(walls, name == "Wall_1")$start_x +
       #   dplyr::filter(walls, name == "Wall_1")$width / 2
       # actual_wall_1_location_x <-
       #   dplyr::filter(walls, name == "Wall_1")$location_x
       # expect_equal(actual_wall_1_location_x,
       #              expected_wall_1_location_x)
       #
       # expected_wall_1_location_y <-
       #   dplyr::filter(walls, name == "Wall_1")$start_y +
       #   dplyr::filter(walls, name == "Wall_1")$length /2
       # expected_wall_1_location_y <-
       #   dplyr::filter(walls, name == "Wall_1")$location_y
       # expect_equal(expected_wall_1_location_y,
       #              expected_wall_1_location_y)
     }
  )

})
