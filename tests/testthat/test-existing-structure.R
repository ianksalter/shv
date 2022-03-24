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

       expected_columns <-
         c("name", "location_x", "location_y", "location_z",
           "length", "width", "height", "x_start", "y_start", "z_start")
       actual_columns <- names(pillars)
       expect_setequal(actual_columns, expected_columns)

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
