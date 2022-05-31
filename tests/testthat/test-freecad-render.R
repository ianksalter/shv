test_that("Dummy test to get R Studio Run Tests button", {
  expect_true(TRUE)
})

describe("freecad_pillar_code", {

  it("Returns a vector of python code for rendering a set of pillars in FreeCad",
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
       #So baseline_start_x = c(1, 2) as baseline_start_x <- location_x - width/2
       #And baseline_end_x = c(1.2, 2.2) as baseline_end_x <- location_x + width/2

       expected_code <-
         c("baseline_start = FreeCAD.Vector(1, 1.1, 0)",
           "baseline_end = FreeCAD.Vector(1.2, 1.1, 0)",
           "baseline = Draft.makeLine(baseline_start, baseline_end)",
           "pillar1 = Arch.makeWall(baseline, length=None, width=0.2, height=3, name='Pillar_1')",
           "",
           "baseline_start = FreeCAD.Vector(2, 2.1, 0)",
           "baseline_end = FreeCAD.Vector(2.2, 2.1, 0)",
           "baseline = Draft.makeLine(baseline_start, baseline_end)",
           "pillar2 = Arch.makeWall(baseline, length=None, width=0.2, height=3, name='Pillar_2')",
           "")
       actual_code <- freecad_pillar_code(test_pillars)
       expect_equal(actual_code, expected_code)
     }
  )

})

describe("freecad_wall_code", {

  it("Returns a vector of python code for rendering a set of walls in FreeCAD",
     {
       test_walls <-
         tibble::tibble(
           name = c("Wall_1", "Wall_2"),
           location_x = c(1.1, 2.1),
           location_y = c(1.1, 2.1),
           location_z = c(1.5, 1.5),
           length = c(2, 2),
           width = c(0.2, 0.2),
           height = c(3, 3),
           rotation_z = c(0, 90)
         )

       expected_code <-
         c("baseline_start = FreeCAD.Vector(0.1, 1.1, 0)",
           "baseline_end = FreeCAD.Vector(2.1, 1.1, 0)",
           "baseline = Draft.makeLine(baseline_start, baseline_end)",
           "wall1 = Arch.makeWall(baseline, length=None, width=0.2, height=3, name='Wall_1')",
           "",
           "baseline_start = FreeCAD.Vector(2.1, 1.1, 0)",
           "baseline_end = FreeCAD.Vector(2.1, 3.1, 0)",
           "baseline = Draft.makeLine(baseline_start, baseline_end)",
           "wall2 = Arch.makeWall(baseline, length=None, width=0.2, height=3, name='Wall_2')",
           ""
         )
       actual_code <- freecad_wall_code(test_walls)
       expect_equal(actual_code, expected_code)
     }
  )

})
