test_that("Dummy test to get R Studio Run Tests button", {
  expect_true(TRUE)
})

describe("create_blender_pillar_code", {

  it("Returns a vector of python code for rendering a set of pillars in blender",
     {
       test_pillars <-
         tibble::tibble(
           name = c("Pillar_1", "Pillar_2"),
           location_x = c(1.1, 2.1),
           location_y = c(1.1, 2.1),
           location_z = c(1.5, 1.5),
           length = c(0.2, 0.2),
           width = c(0.2, 0.2),
           height = c(3, 3)
         )

       expected_code <-
         c("bpy.ops.mesh.primitive_cube_add(",
           "enter_editmode=False,",
           "align='WORLD',",
           "location=(1.1,1.1,1.5))",
           "bpy.context.object.name = 'Pillar_1'",
           "bpy.context.object.dimensions = (0.2,0.2,3)",
           "",
           "bpy.ops.mesh.primitive_cube_add(",
           "enter_editmode=False,",
           "align='WORLD',",
           "location=(2.1,2.1,1.5))",
           "bpy.context.object.name = 'Pillar_2'",
           "bpy.context.object.dimensions = (0.2,0.2,3)",
           "")
       actual_code <- create_blender_pillar_code(test_pillars)
       expect_setequal(actual_code, expected_code)
     }
  )

})
