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
           "pillar = Arch.makeWall(baseline, length=None, width=0.2, height=3, name='Pillar_1')",
           "existing_building.addObject(pillar)",
           "",
           "baseline_start = FreeCAD.Vector(2, 2.1, 0)",
           "baseline_end = FreeCAD.Vector(2.2, 2.1, 0)",
           "baseline = Draft.makeLine(baseline_start, baseline_end)",
           "pillar = Arch.makeWall(baseline, length=None, width=0.2, height=3, name='Pillar_2')",
           "existing_building.addObject(pillar)",
           "")
       actual_code <- freecad_pillar_code(test_pillars)
       expect_equal(actual_code, expected_code)
     }
  )

})

describe("freecad_wall_code", {

  it("Returns a vector of python code for rendering a set of walls and their associated holes in FreeCAD",
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
       test_holes <-
         tibble::tibble(
           name = c("Hole_1", "Hole_2"),
           wall_name = c("Wall_1", "Wall_2"),
           start = c(0.5, 0.25),
           y_start = c(0, 0),
           z_start = c(0, 1),
           length = c(0.9, 1.5),
           height = c(2, 1)
           )

       expected_code <-
         c("baseline_start = FreeCAD.Vector(0.1, 1.1, 0)",
           "baseline_end = FreeCAD.Vector(2.1, 1.1, 0)",
           "baseline = Draft.makeLine(baseline_start, baseline_end)",
           "wall = Arch.makeWall(baseline, length=None, width=0.2, height=3, name='Wall_1')",
           "existing_building.addObject(wall)",
           "",
           "baseline_start = FreeCAD.Vector(0.6, 1.1, 0)",
           "baseline_end = FreeCAD.Vector(1.5, 1.1, 0)",
           "baseline = Draft.makeLine(baseline_start, baseline_end)",
           "hole = Arch.makeWall(baseline, length=None, width=0.2, height=2, name='Hole_1')",
           "Arch.removeComponents(hole, wall)",
           "",
           "baseline_start = FreeCAD.Vector(2.1, 1.1, 0)",
           "baseline_end = FreeCAD.Vector(2.1, 3.1, 0)",
           "baseline = Draft.makeLine(baseline_start, baseline_end)",
           "wall = Arch.makeWall(baseline, length=None, width=0.2, height=3, name='Wall_2')",
           "existing_building.addObject(wall)",
           "",
           "baseline_start = FreeCAD.Vector(2.1, 1.35, 1)",
           "baseline_end = FreeCAD.Vector(2.1, 2.85, 1)",
           "baseline = Draft.makeLine(baseline_start, baseline_end)",
           "hole = Arch.makeWall(baseline, length=None, width=0.2, height=1, name='Hole_2')",
           "Arch.removeComponents(hole, wall)",
           ""
         )
       actual_code <- freecad_wall_code(test_walls, test_holes, "existing_building")
       expect_equal(actual_code, expected_code)
     }
  )
})

describe("dimension_code_for_object", {

  it("Returns a vector of python code for rendering a dimension for the object a given orientation",
     {
       expected_code <-
         c("FreeCAD.ActiveDocument.recompute()",
           "object = document.getObjectsByLabel('Pillar_1')[0]",
           "object_bound_box = object.Shape.BoundBox",
           "x_min = object_bound_box.XMin",
           "x_max = object_bound_box.XMax",
           "x_mid = (x_min + x_max)/2",
           "y_min = object_bound_box.YMin",
           "y_max = object_bound_box.YMax",
           "y_mid = (y_min + y_max)/2",
           "point1 = FreeCAD.Vector(x_max, y_min, 0)",
           "point2 = FreeCAD.Vector(x_max, y_max, 0)",
           "point3 = FreeCAD.Vector(x_max + 300, y_mid, 0)",
           "dimension = Draft.make_linear_dimension(point1, point2, point3)",
           "dimension.Label = 'Dim_South_Pillar_1'",
           "existing_dimensions.addObject(dimension)",
           "dimension_view = dimension.ViewObject",
           "dimension_view.ArrowSize = 20",
           "dimension_view.ArrowType = 'Arrow'",
           "dimension_view.FontSize = 80",
           "dimension_view.ExtLines = 300",
           "dimension_view.ExtOvershoot = 100",
           "dimension_view.ShowUnit = False",
           "dimension_view.Decimals = 0",
           ""
         )
       actual_code <- dimension_code_for_object("Pillar_1", "South")
       expect_equal(actual_code, expected_code)

       expected_code <-
         c(
           "point1 = FreeCAD.Vector(x_min, y_min, 0)",
           "point2 = FreeCAD.Vector(x_min, y_max, 0)",
           "point3 = FreeCAD.Vector(x_min - 300, y_mid, 0)"
         )
       actual_code <- dimension_code_for_object("Pillar_1", "North")[10:12]
       expect_equal(actual_code, expected_code)
       expected_code <-
         c(
           "point1 = FreeCAD.Vector(x_min, y_max, 0)",
           "point2 = FreeCAD.Vector(x_max, y_max, 0)",
           "point3 = FreeCAD.Vector(x_mid, y_max + 300, 0)"
         )
       actual_code <- dimension_code_for_object("Pillar_1", "East")[10:12]
       expect_equal(actual_code, expected_code)
       expected_code <-
         c(
           "point1 = FreeCAD.Vector(x_min, y_min, 0)",
           "point2 = FreeCAD.Vector(x_max, y_min, 0)",
           "point3 = FreeCAD.Vector(x_mid, y_min - 300, 0)"
         )
       actual_code <- dimension_code_for_object("Pillar_1", "West")[10:12]
       expect_equal(actual_code, expected_code)

     }
  )
})

describe("dimension_code_between_objects", {

  it("Returns a vector of python code for rendering a dimension between objects in a given orientation",
     {
       expected_code <-
         c("FreeCAD.ActiveDocument.recompute()",
           "object1 = document.getObjectsByLabel('Pillar_1')[0]",
           "object2 = document.getObjectsByLabel('Wall_1')[0]",
           "object1_bound_box = object1.Shape.BoundBox",
           "object2_bound_box = object2.Shape.BoundBox",
           "point_1_x = object1_bound_box.XMax",
           "point_1_y = (object1_bound_box.YMin + object1_bound_box.YMax)/2",
           "point1 = FreeCAD.Vector(point_1_x, point_1_y, 0)",
           "point_2_x = object2_bound_box.XMin",
           "point_2_y = point_1_y",
           "point2 = FreeCAD.Vector(point_2_x, point_2_y, 0)",
           "x_mid = (point_1_x + point_2_x)/2",
           "point3 = FreeCAD.Vector(x_mid, point_1_y + 0, 0)",
           "dimension = Draft.make_linear_dimension(point1, point2, point3)",
           "dimension.Label = 'Dim_North-South_Pillar_1_End_Wall_1_Start'",
           "existing_dimensions.addObject(dimension)",
           "dimension_view = dimension.ViewObject",
           "dimension_view.ArrowSize = 20",
           "dimension_view.ArrowType = 'Arrow'",
           "dimension_view.FontSize = 80",
           "dimension_view.ExtLines = 300",
           "dimension_view.ExtOvershoot = 100",
           "dimension_view.ShowUnit = False",
           "dimension_view.Decimals = 0",
           ""
         )
       actual_code <- dimension_code_between_objects(
         object_1_label ="Pillar_1",
         object_2_label = "Wall_1",
         orientation = "North-South",
         object_1_start= "End",
         object_2_end = "Start",
         offset = 0)
       expect_equal(actual_code, expected_code)

       expected_code <- "point_1_x = object1_bound_box.XMin"
       actual_code <- dimension_code_between_objects(
         object_1_label ="Pillar_1",
         object_2_label = "Wall_1",
         orientation = "North-South",
         object_1_start= "Start",
         object_2_end = "Start",
         offset = 0)[6]
       expect_equal(actual_code, expected_code)

       expected_code <- "point_2_x = object2_bound_box.XMax"
       actual_code <- dimension_code_between_objects(
         object_1_label ="Pillar_1",
         object_2_label = "Wall_1",
         orientation = "North-South",
         object_1_start= "Start",
         object_2_end = "End",
         offset = 0)[9]
       expect_equal(actual_code, expected_code)


       expected_code <-
         c("FreeCAD.ActiveDocument.recompute()",
           "object1 = document.getObjectsByLabel('Pillar_1')[0]",
           "object2 = document.getObjectsByLabel('Wall_1')[0]",
           "object1_bound_box = object1.Shape.BoundBox",
           "object2_bound_box = object2.Shape.BoundBox",
           "point_1_y = object1_bound_box.YMax",
           "point_1_x = (object1_bound_box.XMin + object1_bound_box.XMax)/2",
           "point1 = FreeCAD.Vector(point_1_x, point_1_y, 0)",
           "point_2_y = object2_bound_box.YMin",
           "point_2_x = point_1_x",
           "point2 = FreeCAD.Vector(point_2_x, point_2_y, 0)",
           "y_mid = (point_1_y + point_2_y)/2",
           "point3 = FreeCAD.Vector(point_1_x + 0, y_mid, 0)",
           "dimension = Draft.make_linear_dimension(point1, point2, point3)",
           "dimension.Label = 'Dim_East-West_Pillar_1_End_Wall_1_Start'",
           "existing_dimensions.addObject(dimension)",
           "dimension_view = dimension.ViewObject",
           "dimension_view.ArrowSize = 20",
           "dimension_view.ArrowType = 'Arrow'",
           "dimension_view.FontSize = 80",
           "dimension_view.ExtLines = 300",
           "dimension_view.ExtOvershoot = 100",
           "dimension_view.ShowUnit = False",
           "dimension_view.Decimals = 0",
           ""
         )
       actual_code <- dimension_code_between_objects(
         object_1_label ="Pillar_1",
         object_2_label = "Wall_1",
         orientation = "East-West",
         object_1_start= "End",
         object_2_end = "Start",
         offset = 0)
       expect_equal(actual_code, expected_code)

       expected_code <- "point_1_y = object1_bound_box.YMin"
       actual_code <- dimension_code_between_objects(
         object_1_label ="Pillar_1",
         object_2_label = "Wall_1",
         orientation = "East-West",
         object_1_start= "Start",
         object_2_end = "Start",
         offset = 0)[6]
       expect_equal(actual_code, expected_code)

       expected_code <- "point_2_y = object2_bound_box.YMax"
       actual_code <- dimension_code_between_objects(
         object_1_label ="Pillar_1",
         object_2_label = "Wall_1",
         orientation = "East-West",
         object_1_start= "Start",
         object_2_end = "End",
         offset = 0)[9]
       expect_equal(actual_code, expected_code)

     }
  )
})
