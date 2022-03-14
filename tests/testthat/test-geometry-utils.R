test_that("Dummy test to get R Studio Run Tests button", {
  expect_true(TRUE)
})

describe("z_rotate_x", {

  it("Calculate the x_value of a vector of point vectors rotated around the z_axis.",
     {

       point_x <- c(1, 2, 1, 1)
       point_y <- c(0.1, 0.2, 0.1, -0.1)
       rotation_z <- c(0, 90, 45, -60)

       rotaion_z_rad <- pi * rotation_z / 180

       expected_rotated_point_x <-
         c(
           point_x[1],
           - point_y[2],
           point_x[3] *cos(rotaion_z_rad[3])  -
             point_y[3] * sin(rotaion_z_rad[3]),
           point_x[4] * cos(rotaion_z_rad[4])  -
             point_y[4] * sin(rotaion_z_rad[4])
         )
       actual_rotated_point_x <- z_rotate_x(point_x, point_y, rotation_z)

       expect_equal(actual_rotated_point_x, expected_rotated_point_x)
     }
  )

})


describe("z_rotate_y", {

  it("Calculate the y value of a vector of point vectors rotated around the z_axis.",
     {

       point_x <- c(1, 2, 1, 1)
       point_y <- c(0.1, 0.2, 0.1, -0.1)
       rotation_z <- c(0, 90, 45, -60)

       rotaion_z_rad <- pi * rotation_z / 180

       expected_rotated_point_y <-
         c(
           point_y[1],
           point_x[2],
           point_x[3] * sin(rotaion_z_rad[3]) +
             point_y[3] * cos(rotaion_z_rad[3]) ,
           point_x[4] * sin(rotaion_z_rad[4]) +
             point_y[4] * cos(rotaion_z_rad[4])
         )
       actual_rotated_point_y <- z_rotate_y(point_x, point_y, rotation_z)

       expect_equal(actual_rotated_point_y, expected_rotated_point_y)
     }
  )

})
