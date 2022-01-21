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
