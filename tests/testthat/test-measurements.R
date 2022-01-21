test_that("Dummy test to get R Studio Run Tests button", {
  expect_true(TRUE)
})

describe("generate_measurements", {

  it("Returns a tibble of existing measurements",
     {
       existing_measurements <- generate_measurements()

       expected_class <- c("measure_tbl", "tbl_df", "tbl", "data.frame")
       actual_class <- class(existing_measurements)
       expect_equal(actual_class, expected_class)

       expected_col_names <- c("measure", "dimension", "value", "note")
       actual_col_names <- names(existing_measurements)
       expect_setequal(actual_col_names, expected_col_names)

       no_of_height_measurements <- 4
       no_of_pillar_merasurements <- 10
       no_of_wall_measurements <- 6
       no_of_space_measurements <- 8
       expected_no_of_rows <-
         no_of_height_measurements +
         no_of_pillar_merasurements +
         no_of_wall_measurements +
         no_of_space_measurements
       actual_no_of_rows <- nrow(existing_measurements)
       expect_equal(actual_no_of_rows, expected_no_of_rows)
     }
  )

})

describe("distance", {

  test_tbl <-
  tibble::tribble(
   ~measure,  ~dimension, ~value, ~note,
   "wall",    "length",   3.40,   "Test Note",
   "wall",    "width",    0.15,   "")
  existing <-
    structure(
      test_tbl,
      class = c("measure_tbl", class(test_tbl))
  )

  it("Creates a function for looking up distance values in a measure tibble.",
     {
       expected_value <- 3.40
       actual_value <- distance(existing, "wall", "length")
       expect_equal(actual_value, expected_value)
     }
  )

  it("Fails if the measure is not in the distance_tibble",
     {
       expect_error(distance(existing, "bad", "length"),
                    "measure_name or dimension_name not in measure_tbl")
     }
  )

  it("Fails if the dimension is not in the distance_tibble",
     {
       expect_error(distance(existing, "wall", "bad"),
                    "measure_name or dimension_name not in measure_tbl")
     }
  )

  it("Fails if the name is not unique in the distance_tibble",
     {

       bad_test_tbl <-
         tibble::tribble(
           ~measure,  ~dimension, ~value, ~note,
           "wall",    "length",   3.40,   "Test Note",
           "wall",    "length",   0.15,   "")
       bad_measure_tbl <-
         structure(
           bad_test_tbl,
           class = c("measure_tbl", class(test_tbl))
         )
       expect_error(distance(bad_measure_tbl, "wall", "length"),
                    "Non unique values in measure_tbl")
     }
  )

})

describe("note_for", {

  test_tbl <-
    tibble::tribble(
      ~measure,  ~dimension, ~value, ~note,
      "wall",    "length",   3.40,   "Test Note",
      "wall",    "width",    0.15,   "")
  existing <-
    structure(
      test_tbl,
      class = c("measure_tbl", class(test_tbl))
    )

  it("Looks up notes in a measure tibble.",
     {
       expected_value <- "Test Note"
       actual_value <- note_for(existing, "wall", "length")
       expect_equal(actual_value, expected_value)
     }
  )

  it("Fails if the measure is not in the distance_tibble",
     {
       expect_error(note_for(existing, "bad", "length"),
                    "measure_name or dimension_name not in measure_tbl")
     }
  )

  it("Fails if the dimension is not in the distance_tibble",
     {
       expect_error(note_for(existing, "wall", "bad"),
                    "measure_name or dimension_name not in measure_tbl")
     }
  )

  it("Fails if the name is not unique in the distance_tibble",
     {

       bad_test_tbl <-
         tibble::tribble(
           ~measure,  ~dimension, ~value, ~note,
           "wall",    "length",   3.40,   "Test Note",
           "wall",    "length",   0.15,   "")
       bad_measure_tbl <-
         structure(
           bad_test_tbl,
           class = c("measure_tbl", class(test_tbl))
         )
       expect_error(note_for(bad_measure_tbl, "wall", "length"),
                    "Non unique values in measure_tbl")
     }
  )

})


