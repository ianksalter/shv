test_that("Dummy test to get R Studio Run Tests button", {
  expect_true(TRUE)
})

describe("hole_locations", {

  it("Returns a tibble of existing pillars",
     {
       name <- c("Wall_1", "Wall_2", "Wall_3", "Wall_4")
       start_x <- c(0, 1, 0, 1)
       start_y <- c(0, 0, 1, 1)
       start_z <- c(0, 0, 0, 0)
       wall_length <- c(2, 2, 2, 2)
       wall_width <- c(0.1, 0.2, 0.1, 0.1)
       wall_height <- c(3, 3, 3, 3)
       rotation_z <- c(0, 90, 45, -60)
       location_x <-
         start_x +
         z_rotate_x(wall_length / 2,
                    wall_width /2 *
                      - rotation_z / abs(rotation_z), # Pivot correction
                    rotation_z)
       location_y <-
         start_y +
         z_rotate_y(wall_length / 2,
                    wall_width / 2 * - rotation_z / abs(rotation_z),
                    rotation_z)
       location_z <- wall_height / 2
       wall_tbl <-
         tibble::tibble(
           name = name,
           location_x = location_x,
           location_y = location_y,
           location_z = location_z,
           length = wall_length,
           width = wall_width,
           height = wall_height,
           start_x = start_x,
           start_y = start_y,
           start_z = start_z
         )

       hole_name <- c("Hole_1", "Hole_2", "Hole_3", "Hole_4")
       hole_start_x <- c(0.5, 1, 0.5, 1)
       hole_start_z <- c(0, 1, 0, 1)
       hole_length <- c(1, 0.5, 1, 0.5)
       hole_height <- c(2, 1, 2, 1)
       wall_name <- c("Wall_1", "Wall_2", "Wall_3", "Wall_4")
       relative_hole_tbl <-
         tibble::tibble(
           name <- hole_name,
           start_x <- hole_start_x,
           start_z <- hole_start_z,
           hole_length <- hole_length,
           hole_height <- hole_height,
           wall_name <- wall_name
         )

       hole_location_x <-
         start_x + # Not generic need the x_start of the holes wall
          z_rotate_x(
            hole_start_x + hole_length / 2,
            wall_width / 2  * # Not generic need width of the holes wall
              - rotation_z / abs(rotation_z),
            rotation_z # Not generic need  rotation of the holes wall
          )
       hole_location_y <-
         start_y + # Not generic need the y_start of the holes wall
         z_rotate_y(
           hole_start_x + hole_length / 2,
           wall_width / 2 *  # Not generic need width of the holes wall
             - rotation_z / abs(rotation_z),
           rotation_z # Not generic need  rotation of the holes wall
         )
       hole_location_z <- hole_start_z + hole_height / 2 # Not generic need to add start_z of the holes wall
       expected_hole_tibble <-
         tibble::tibble(
           name = hole_name,
           location_x = hole_location_x,
           location_y = hole_location_y,
           location_z = hole_location_z,
           length = hole_length,
           width = wall_width, # Not generic need width of the holes wall
           height = hole_height,
           rotation_z = rotation_z, # Not generic need rotation of the holes wall
           wall_name = wall_name # Not generic need the name of the holes wall.
         )
       actual_hole_tbl <- hole_locations(wall_tbl, relative_hole_tbl)
       # expect_equal(actual_hole_tbl, expected_hole_tbl)

     }
  )

})
