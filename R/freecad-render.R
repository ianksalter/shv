# Work around used to pass package checks
# Without this line the following is a note for the package check
# no visible binding for global variable ‘existing-pillarn', 'wall_name' and
# 'existing_holes'
utils::globalVariables(c("existing_pillars", "wall_name", "existing_holes", "name", "new_walls"))

#' Creates lines of python code to generate a set of pillars in FreeCAD
#'
#' Uses a tibble of python pillar data to generate the python code that
#' can generate the pillars in FreeCAD
#'
#' @param pillar_tbl the tibble containing the pillar data
#'
#' @return A vector of strings containing the lines of code to be generated.
#'
#' @export
#' @examples
#' pillar <-
#' tibble::tibble(
#'   name = c("Pillar_1", "Pillar_2"),
#'   location_x = c(1.1, 2.1),
#'   location_y = c(1.1, 2.1),
#'   location_z = c(1.5, 1.5),
#'   length = c(0.2, 0.2),
#'   width = c(0.2, 0.2),
#'   height = c(3, 3)
#' )
#'
#' freecad_pillar_code(pillar)
freecad_pillar_code <- function(pillar_tbl){
  # assertthat::assert_that(nrow(pillar_tbl) == 1,
  #                         msg = "pillars_tbl must have exactly 1 row")

  pillar_code <- c()
  no_rows <- nrow(pillar_tbl)
  for (i in 1:no_rows){
    tbl_row <- pillar_tbl[i,]
    x_start <- tbl_row$location_x - tbl_row$width/2
    x_end <- tbl_row$location_x + tbl_row$width/2
    z_start <- tbl_row$location_z - tbl_row$height/2
    next_pillar_code <-
      c(paste("baseline_start = FreeCAD.Vector(",
              x_start, ", ",
              tbl_row$location_y, ", ",
              z_start, ")", sep = ""),
        paste("baseline_end = FreeCAD.Vector(",
              x_end, ", ",
              tbl_row$location_y, ", ",
              z_start, ")", sep = ""),
        "baseline = Draft.makeLine(baseline_start, baseline_end)",
        paste("pillar = Arch.makeWall(baseline, length=None, width=",
              tbl_row$width, ", height=",
              tbl_row$height, ", name='",
              tbl_row$name, "')", sep = ""),
        "existing_building.addObject(pillar)",
        ""
      )
    pillar_code <- c(pillar_code, next_pillar_code)
  }
  return(pillar_code)
}

#' Creates lines of python code to generate a set of walls in FreeCAD
#'
#' Uses a tibble of python wall data to generate the python code that
#' can generate the walls in FreeCAD. Any specified holes are removed from the
#' wall
#'
#' @param wall_tbl the tibble containing the wall data
#' @param hole_tbl the tibble containing the hole data for the walls
#' @param window_tbl the tibble containing the window data for the walls
#' @param building_name the name of the building to which the walls will be added.
#'
#' @return A vector of strings containing the lines of code to be generated.
#'
#' @export
#' @examples
#' walls <-
#' tibble::tibble(
#'   name = c("Wall_1", "Wall_2"),
#'   location_x = c(1.1, 2.1),
#'   location_y = c(1.1, 2.1),
#'   location_z = c(1.5, 1.5),
#'   length = c(2, 2),
#'   width = c(0.2, 0.2),
#'   height = c(3, 3),
#'   rotation_z = c(0, 90)
#' )
#' holes <-
#' tibble::tibble(
#'   name = c("Hole_1", "Hole_2"),
#'   wall_name = c("Wall_1", "Wall_2"),
#'   start = c(0.5, 0.25),
#'   start_z = c(0, 1),
#'   length = c(0.9, 1.5),
#'   height = c(2, 1)
#' )
#'
#' freecad_wall_code(walls, holes, building_name = "existing_building")
freecad_wall_code <- function(wall_tbl,
                              hole_tbl = NULL,
                              window_tbl = NULL,
                              building_name){
  # assertthat::assert_that(nrow(wall_tbl) == 1,
  #                         msg = "walls_tbl must have exactly 1 row")

  wall_code <- c()
  no_rows <- nrow(wall_tbl)
  for (i in 1:no_rows){
    tbl_row <- wall_tbl[i,]
    rotation_rad = tbl_row$rotation_z * pi / 180
    x_angular_factor <- round(cos(rotation_rad), digits = 15)
    y_angular_factor <- round(sin(rotation_rad), digits = 15)
    delta_x = x_angular_factor * tbl_row$length / 2
    delta_y = y_angular_factor * tbl_row$length / 2
    x_start <- tbl_row$location_x - delta_x
    x_end <- tbl_row$location_x + delta_x
    y_start <- tbl_row$location_y - delta_y
    y_end <- tbl_row$location_y + delta_y
    z_start <- tbl_row$location_z - tbl_row$height/2
    next_wall_code <-
      c(paste("baseline_start = FreeCAD.Vector(",
              x_start, ", ",
              y_start, ", ",
              z_start, ")", sep = ""),
        paste("baseline_end = FreeCAD.Vector(",
              x_end, ", ",
              y_end, ", ",
              z_start, ")", sep = ""),
        "baseline = Draft.makeLine(baseline_start, baseline_end)",
        paste("wall = Arch.makeWall(baseline, length=None, width=",
              tbl_row$width, ", height=",
              tbl_row$height, ", name='",
              tbl_row$name, "')", sep = ""),
        paste(building_name, ".addObject(wall)", sep = ""),
        ""
      )
    wall_code <- c(wall_code, next_wall_code)
    if (! is.null(hole_tbl)){
      wall_holes <- dplyr::filter(hole_tbl, wall_name == tbl_row$name)
      no_rows <- nrow(wall_holes)
      if (no_rows > 0){
        for (j in 1:no_rows){
          tbl_hole_row <- wall_holes[j,]
          hole_x_start <-
            x_start +
            x_angular_factor * tbl_hole_row$start -
            y_angular_factor * tbl_hole_row$y_start
          hole_y_start <-
            y_start +
            y_angular_factor * tbl_hole_row$start +
            x_angular_factor * tbl_hole_row$y_start
          hole_z_start <- tbl_hole_row$z_start
          hole_x_end <-
            hole_x_start +
            x_angular_factor * tbl_hole_row$length -
            y_angular_factor * tbl_hole_row$y_start
          hole_y_end <-
            hole_y_start +
            y_angular_factor * tbl_hole_row$length +
            x_angular_factor * tbl_hole_row$y_start
          hole_z_end <- tbl_hole_row$z_start
          hole_width = tbl_row$width - tbl_hole_row$y_start
          next_hole_code <-
            c(paste("baseline_start = FreeCAD.Vector(",
                    hole_x_start, ", ",
                    hole_y_start, ", ",
                    hole_z_start, ")", sep = ""),
              paste("baseline_end = FreeCAD.Vector(",
                    hole_x_end, ", ",
                    hole_y_end, ", ",
                    hole_z_end, ")", sep = ""),
              "baseline = Draft.makeLine(baseline_start, baseline_end)",
              paste("hole = Arch.makeWall(baseline, length=None, width=",
                    hole_width, ", height=",
                    tbl_hole_row$height, ", name='",
                    tbl_hole_row$name, "')", sep = ""),
              "Arch.removeComponents(hole, wall)",
              ""
            )
          wall_code <- c(wall_code, next_hole_code)
        }
      }
    }

    if (! is.null(window_tbl)){
      wall_windows <- dplyr::filter(window_tbl, wall_name == tbl_row$name)
      no_rows <- nrow(wall_windows)
      if (no_rows > 0){
        for (j in 1:no_rows){
          tbl_window_row <- wall_windows[j,]
          next_window_code <-
            c("FreeCAD.ActiveDocument.recompute()",
              "box_wall = wall.Base.Shape.BoundBox",
              "wall_width = wall.Width.Value",
              paste("door_start = ", tbl_window_row$start, sep = ""),
              paste("z_rotation =  ", tbl_row$rotation_z, sep = ""),
              "z_rotation_rad = math.pi * z_rotation / 180",
              "base_x = math.cos(z_rotation_rad) * box_wall.XMin + math.sin(z_rotation_rad) * box_wall.YMin + door_start",
              "base_y = math.cos(z_rotation_rad) * box_wall.YMin - math.sin(z_rotation_rad) * box_wall.XMin - wall_width",
              paste("base = FreeCAD.Vector(base_x, base_y, ",
                    tbl_window_row$z_start, ")", sep = ""),
              "axis = FreeCAD.Vector(1, 0, 0)",
              "doorPlace = FreeCAD.Placement(base, FreeCAD.Rotation(axis, 90))",
              paste("door = Arch.makeWindowPreset('",
                    tbl_window_row$type, "', ",
                    "width=", tbl_window_row$width, ", ",
                    "height=", tbl_window_row$height, ", ",
                    "h1=", tbl_window_row$h1, ", ",
                    "h2=", tbl_window_row$h2, ", ",
                    "h3=", tbl_window_row$h3, ", ",
                    "w1=", tbl_window_row$w1, ", ",
                    "w2=", tbl_window_row$w2, ", ",
                    "o1=", tbl_window_row$o1, ", ",
                    "o2=", tbl_window_row$o2, ", ",
                    "placement=doorPlace)",
                    sep = ""),
              "door.Placement = FreeCAD.Placement(FreeCAD.Vector(0,0,0),App.Rotation(FreeCAD.Vector(0,0,1),z_rotation))",
              paste("door.Label = '", tbl_window_row$name, "'", sep =""),
              "Arch.addComponents(door, wall)",
              ""
            )
          wall_code <- c(wall_code, next_window_code)
        }
      }
    }
  }
  return(wall_code)
}

#' Creates lines of python code to generate a set of dimensions in FreeCAD
#'
#' Uses a tibble of python wall data to generate the python code that
#' can generate the walls in FreeCAD. Any specified holes are removed from the
#' wall
#'
#' @param label the label the object is know by in Freecad
#' @param orientation the cardinal orientation should be one of "North",
#' "South", "East" or "West"
#'
#' @return Code for the dimension of a the object based on its label and
#' oriented to the face of cardinal face of the object
#'
#' @export
#' @examples
#' dimension_code_for_object("Pillar_1", "North")
dimension_code_for_object <- function(label, orientation){
  assertthat::assert_that(orientation %in% c("North", "South", "East", "West"),
                          msg = 'orientation must be one of "North", "South", "East" or "West"')

  dim_dist = 300

  header_code <-
    c("FreeCAD.ActiveDocument.recompute()",
      paste("object = document.getObjectsByLabel('", label, "')[0]", sep = ""),
      "object_bound_box = object.Shape.BoundBox",
      "x_min = object_bound_box.XMin",
      "x_max = object_bound_box.XMax",
      "x_mid = (x_min + x_max)/2",
      "y_min = object_bound_box.YMin",
      "y_max = object_bound_box.YMax",
      "y_mid = (y_min + y_max)/2"
    )
  if (orientation == "West"){
    point_code <-
      c("point1 = FreeCAD.Vector(x_min, y_min, 0)",
        "point2 = FreeCAD.Vector(x_min, y_max, 0)",
        paste("point3 = FreeCAD.Vector(x_min - ", dim_dist, ", y_mid, 0)", sep = "")
      )
  } else if (orientation == "East"){
    point_code <-
      c("point1 = FreeCAD.Vector(x_max, y_min, 0)",
        "point2 = FreeCAD.Vector(x_max, y_max, 0)",
        paste("point3 = FreeCAD.Vector(x_max + ", dim_dist, ", y_mid, 0)", sep = "")
      )
  } else if (orientation == "North") {
    point_code <-
      c("point1 = FreeCAD.Vector(x_min, y_max, 0)",
        "point2 = FreeCAD.Vector(x_max, y_max, 0)",
        paste("point3 = FreeCAD.Vector(x_mid, y_max + ", dim_dist, ", 0)", sep = "")
      )
  } else{ #Given the assert this must be "South"
    point_code <-
      c("point1 = FreeCAD.Vector(x_min, y_min, 0)",
        "point2 = FreeCAD.Vector(x_max, y_min, 0)",
        paste("point3 = FreeCAD.Vector(x_mid, y_min - ", dim_dist, ", 0)", sep = "")
      )
  }

  make_dimension_code <-
    c("dimension = Draft.make_linear_dimension(point1, point2, point3)",
      paste("dimension.Label = 'Dim_", orientation, "_", label, "'", sep = ""),
      "existing_dimensions.addObject(dimension)"
    )

  # All dimensions are formatted in a standard manner
  # Code below creates creates this dimension format code
  # The previous puthon code just needs to have an object called dimension.
  # Then tis code can be added after the dimension code is generated.
  dim_dist = 300
  arrow_size = 20
  arrow_type = "Arrow"
  font_size = 80
  ext_lines = 300
  ext_overshoot = 100
  format_code <-
    c("dimension_view = dimension.ViewObject",
      paste("dimension_view.ArrowSize = ", arrow_size, sep = ""),
      paste("dimension_view.ArrowType = '", arrow_type, "'", sep = ""),
      paste("dimension_view.FontSize = ", font_size, sep = ""),
      paste("dimension_view.ExtLines = ", ext_lines, sep = ""),
      paste("dimension_view.ExtOvershoot = ", ext_overshoot, sep = ""),
      "dimension_view.ShowUnit = False",
      "dimension_view.Decimals = 0",
      ""
    )

  return(c(header_code, point_code, make_dimension_code, format_code))
}

#' Creates lines of python code to generate a set of dimensions in FreeCAD
#'
#' Uses a tibble of python wall data to generate the python code that
#' can generate the walls in FreeCAD. Any specified holes are removed from the
#' wall
#'
#' @param object_1_label the label the first object 1 is known by in Freecad
#' @param object_2_label the label the first object 1 is known by in Freecad
#' @param orientation one of "North-South" or "East-West"
#' @param object_1_start where to start the dimension on the first object
#' one of "Start" or End"
#' @param object_2_end where to end the dimension on the second object
#' one of "Start" or End"
#' @param offset amount to move the dimension line in the opposite orientation.
#'
#' @return Code for the dimension of a the object based on the parameters. It is
#' assumed that in which ever orientation is being used the first object
#' comes before the second object
#'
#' @export
#' @examples
#' dimension_code_between_objects(
#'   object_1_label ="Pillar_1",
#'   object_2_label = "Wall_1",
#'   orientation = "North-South",
#'   object_1_start= "End",
#'   object_2_end = "Start",
#'   offset = 0)
dimension_code_between_objects <- function(object_1_label,
                                           object_2_label,
                                           orientation,
                                           object_1_start,
                                           object_2_end,
                                           offset = 0){
  assertthat::assert_that(orientation %in% c("North-South", "East-West"),
                          msg = 'orientation must be one of "North-South", "East-West"')
  assertthat::assert_that(object_1_start %in% c("Start", "End"),
                          msg = 'object_1_start must be one of "Start", "End"')
  assertthat::assert_that(object_2_end %in% c("Start", "End"),
                          msg = 'object_2_start must be one of "Start", "End"')

  dim_dist = offset

  header_code <-
    c("FreeCAD.ActiveDocument.recompute()",
      paste("object1 = document.getObjectsByLabel('", object_1_label,
            "')[0]", sep = ""),
      paste("object2 = document.getObjectsByLabel('", object_2_label,
            "')[0]", sep = ""),
      "object1_bound_box = object1.Shape.BoundBox",
      "object2_bound_box = object2.Shape.BoundBox"
    )

  point_code <- c()
  if (orientation == "East-West"){ #Dimension goes along the x direction
    if (object_1_start == "Start"){
      next_point_code <- c( "point_1_x = object1_bound_box.XMin")
    } else { # object_1_start = "End
      next_point_code <- c("point_1_x = object1_bound_box.XMax")
    }
    point_code <- c(point_code, next_point_code)
    next_point_code <-
      c(
        "point_1_y = (object1_bound_box.YMin + object1_bound_box.YMax)/2",
        "point1 = FreeCAD.Vector(point_1_x, point_1_y, 0)"
      )
    point_code <- c(point_code, next_point_code)
    if (object_2_end == "Start"){
      next_point_code <- c( "point_2_x = object2_bound_box.XMin")
    } else { # object_2_start = "End
      next_point_code <- c("point_2_x = object2_bound_box.XMax")
    }
    point_code <- c(point_code, next_point_code)
    next_point_code <-
      c(
        "point_2_y = point_1_y",
        "point2 = FreeCAD.Vector(point_2_x, point_2_y, 0)"
      )
    point_code <- c(point_code, next_point_code)
    next_point_code <-
      c(
        "x_mid = (point_1_x + point_2_x)/2",
        paste("point3 = FreeCAD.Vector(x_mid, point_1_y + ", dim_dist, ", 0)", sep = "")
      )
    point_code <- c(point_code, next_point_code)
  } else { # orientation is "North-South"
    if (object_1_start == "Start"){
      next_point_code <- c( "point_1_y = object1_bound_box.YMin")
    } else { # object_1_start = "End
      next_point_code <- c("point_1_y = object1_bound_box.YMax")
    }
    point_code <- c(point_code, next_point_code)
    next_point_code <-
      c(
        "point_1_x = (object1_bound_box.XMin + object1_bound_box.XMax)/2",
        "point1 = FreeCAD.Vector(point_1_x, point_1_y, 0)"
      )
    point_code <- c(point_code, next_point_code)
    if (object_2_end == "Start"){
      next_point_code <- c( "point_2_y = object2_bound_box.YMin")
    } else { # object_2_start = "End
      next_point_code <- c("point_2_y = object2_bound_box.YMax")
    }
    point_code <- c(point_code, next_point_code)
    next_point_code <-
      c(
        "point_2_x = point_1_x",
        "point2 = FreeCAD.Vector(point_2_x, point_2_y, 0)"
      )
    point_code <- c(point_code, next_point_code)
    next_point_code <-
      c(
        "y_mid = (point_1_y + point_2_y)/2",
        paste("point3 = FreeCAD.Vector(point_1_x + ", dim_dist, ", y_mid, 0)", sep = "")
      )
    point_code <- c(point_code, next_point_code)
  }

  make_dimension_code <-
    c("dimension = Draft.make_linear_dimension(point1, point2, point3)",
      paste("dimension.Label = 'Dim_",
            orientation, "_",
            object_1_label, "_",
            object_1_start, "_",
            object_2_label, "_",
            object_2_end, "'",
            sep = ""),
      "existing_dimensions.addObject(dimension)"
    )

  # All dimensions are formatted in a standard manner
  # Code below creates creates this dimension format code
  # The previous puthon code just needs to have an object called dimension.
  # Then tis code can be added after the dimension code is generated.
  arrow_size = 20
  arrow_type = "Arrow"
  font_size = 80
  ext_lines = 300
  ext_overshoot = 100
  format_code <-
    c("dimension_view = dimension.ViewObject",
      paste("dimension_view.ArrowSize = ", arrow_size, sep = ""),
      paste("dimension_view.ArrowType = '", arrow_type, "'", sep = ""),
      paste("dimension_view.FontSize = ", font_size, sep = ""),
      paste("dimension_view.ExtLines = ", ext_lines, sep = ""),
      paste("dimension_view.ExtOvershoot = ", ext_overshoot, sep = ""),
      "dimension_view.ShowUnit = False",
      "dimension_view.Decimals = 0",
      ""
    )

  return(c(header_code, point_code, make_dimension_code, format_code))
}




#' Creates lines of python code to reposition the  model more appropriately on
#' the grid
#'
#'
#' @return A vector of strings containing the lines of code to be generated.
#'
#' @export
#' @examples

#' freecad_reposition_code ()
freecad_reposition_code <- function(){
  #TODO sort bug where move and rotates are being done twice
  #At present all move and rotate measurements are halved
  reposition_code <-
    c("Gui.runCommand('Std_SelectAll',0)",
      "move_list = Gui.Selection.getCompleteSelection()",
      "Draft.move(move_list, App.Vector(70,0,0))", #TODO Parametrise the x value for this expression
      "Draft.rotate(move_list, 45)",
      "Draft.move(move_list, App.Vector(6000,-1500,0))", #TODO Fix this it should go down and it goes up.
      ""
    )
  return(reposition_code)
}



#' Creates lines of python code to generate a set of dimensions in FreeCAD
#'
#'
#' @return A vector of strings containing the lines of code to be generated.
#'
#' @export
#' @examples
#' freecad_dimension_code()
freecad_dimension_code <- function(){

  dimension_code <- c()

  # West pillars south dimension
  next_dimension_code <- dimension_code_for_object("Pillar_1", "South")
  dimension_code <- c(dimension_code, next_dimension_code)

  # West pillars west dimensions
  pillars = c("Pillar_1", "Pillar_2", "Pillar_3", "Pillar_4", "Pillar_5")
  for (i in 1:length(pillars)){
    next_dimension_code <- dimension_code_for_object(pillars[i], "West")
    dimension_code <- c(dimension_code, next_dimension_code)
  }

  # West wall west dimensions
  walls = c("Wall_1", "Wall_2", "Wall_3", "Wall_4")
  for (i in 1:length(walls)){
    next_dimension_code <- dimension_code_for_object(walls[i], "West")
    dimension_code <- c(dimension_code, next_dimension_code)
  }
  next_dimension_code <-
    dimension_code_between_objects(
      object_1_label ="Pillar_5",
      object_2_label = "Wall_6",
      orientation = "North-South",
      object_1_start= "End",
      object_2_end = "Start",
      offset = -300)
  dimension_code <- c(dimension_code, next_dimension_code)

  # North pillar north dimension
  next_dimension_code <- dimension_code_for_object("Pillar_6", "North")
  dimension_code <- c(dimension_code, next_dimension_code)

  # North wall north dimensions
  walls = c("Wall_6", "Wall_7")
  for (i in 1:length(walls)){
    next_dimension_code <- dimension_code_for_object(walls[i], "North")
    dimension_code <- c(dimension_code, next_dimension_code)
  }

  # Central Pillars dimensions
  next_dimension_code <- dimension_code_for_object("Pillar_7", "North")
  dimension_code <- c(dimension_code, next_dimension_code)
  next_dimension_code <- dimension_code_for_object("Pillar_7", "West")
  dimension_code <- c(dimension_code, next_dimension_code)
  next_dimension_code <- dimension_code_for_object("Pillar_8", "North")
  dimension_code <- c(dimension_code, next_dimension_code)
  next_dimension_code <- dimension_code_for_object("Pillar_8", "West")
  dimension_code <- c(dimension_code, next_dimension_code)

  # East wall pillars
  next_dimension_code <- dimension_code_for_object("Pillar_9", "East")
  dimension_code <- c(dimension_code, next_dimension_code)
  next_dimension_code <- dimension_code_for_object("Pillar_10", "East")
  dimension_code <- c(dimension_code, next_dimension_code)
  next_dimension_code <- dimension_code_for_object("Pillar_10", "South")
  dimension_code <- c(dimension_code, next_dimension_code)

  # East Walls
  # Wall 8
  next_dimension_code <-
    dimension_code_between_objects(
      object_1_label ="Wall_7",
      object_2_label = "Wall_9",
      orientation = "North-South",
      object_1_start= "Start",
      object_2_end = "End",
      offset = 2200)
  dimension_code <- c(dimension_code, next_dimension_code)
  # Wall 9
  next_dimension_code <-
    dimension_code_between_objects(
      object_1_label ="Wall_10",
      object_2_label = "Wall_9",
      orientation = "East-West",
      object_1_start= "Start",
      object_2_end = "End",
      offset = 2500)
  dimension_code <- c(dimension_code, next_dimension_code)
  # Walls 10 & 13
  walls = c("Wall_10", "Wall_13")
  for (i in 1:length(walls)){
    next_dimension_code <- dimension_code_for_object(walls[i], "East")
    dimension_code <- c(dimension_code, next_dimension_code)
  }
  # Wall 11
  next_dimension_code <-
    dimension_code_between_objects(
      object_1_label ="Wall_10",
      object_2_label = "Wall_12",
      orientation = "East-West",
      object_1_start= "Start",
      object_2_end = "Start",
      offset = -2500)
  dimension_code <- c(dimension_code, next_dimension_code)
  # Wall 12
  next_dimension_code <-
    dimension_code_between_objects(
      object_1_label ="Wall_11",
      object_2_label = "Pillar_9",
      orientation = "North-South",
      object_1_start= "Start",
      object_2_end = "End",
      offset = 500)
  dimension_code <- c(dimension_code, next_dimension_code)
  # Wall 14 / Space 1
  next_dimension_code <-
    dimension_code_between_objects(
      object_1_label ="Wall_1",
      object_2_label = "Wall_13",
      orientation = "East-West",
      object_1_start= "End",
      object_2_end = "Start",
      offset = 0)
  dimension_code <- c(dimension_code, next_dimension_code)
  # Space 2
  next_dimension_code <-
    dimension_code_between_objects(
      object_1_label ="Wall_2",
      object_2_label = "Wall_12",
      orientation = "East-West",
      object_1_start= "End",
      object_2_end = "Start",
      offset = 0)
  dimension_code <- c(dimension_code, next_dimension_code)
  # Space 3
  next_dimension_code <-
    dimension_code_between_objects(
      object_1_label ="Wall_3",
      object_2_label = "Wall_10",
      orientation = "East-West",
      object_1_start= "End",
      object_2_end = "Start",
      offset = 0)
  dimension_code <- c(dimension_code, next_dimension_code)
  # Space 4
  next_dimension_code <-
    dimension_code_between_objects(
      object_1_label ="Wall_4",
      object_2_label = "Wall_8",
      orientation = "East-West",
      object_1_start= "End",
      object_2_end = "Start",
      offset = 0)
  dimension_code <- c(dimension_code, next_dimension_code)

  # Entrance
  next_dimension_code <-
    dimension_code_between_objects(
      object_1_label ="Wall_1",
      object_2_label = "Hole_1",
      orientation = "East-West",
      object_1_start= "End",
      object_2_end = "Start",
      offset = -1300)
  dimension_code <- c(dimension_code, next_dimension_code)
  next_dimension_code <- dimension_code_for_object("Hole_1", "North")
  dimension_code <- c(dimension_code, next_dimension_code)
  next_dimension_code <-
    dimension_code_between_objects(
      object_1_label ="Hole_1",
      object_2_label = "Wall_13",
      orientation = "East-West",
      object_1_start= "End",
      object_2_end = "Start",
      offset = 500)
  dimension_code <- c(dimension_code, next_dimension_code)

  # Pillars
  # Pillar 7
  next_dimension_code <-
    dimension_code_between_objects(
      object_1_label ="Wall_4",
      object_2_label = "Pillar_7",
      orientation = "East-West",
      object_1_start= "End",
      object_2_end = "Start",
      offset = 1500)
  dimension_code <- c(dimension_code, next_dimension_code)
  next_dimension_code <-
    dimension_code_between_objects(
      object_1_label ="Wall_7",
      object_2_label = "Pillar_7",
      orientation = "North-South",
      object_1_start= "Start",
      object_2_end = "End",
      offset = -1250)
  dimension_code <- c(dimension_code, next_dimension_code)
  # Pillar 8
  next_dimension_code <-
    dimension_code_between_objects(
      object_1_label ="Wall_3",
      object_2_label = "Pillar_8",
      orientation = "East-West",
      object_1_start= "End",
      object_2_end = "Start",
      offset = 1800)
  dimension_code <- c(dimension_code, next_dimension_code)
  next_dimension_code <-
    dimension_code_between_objects(
      object_1_label ="Wall_7",
      object_2_label = "Pillar_8",
      orientation = "North-South",
      object_1_start= "Start",
      object_2_end = "End",
      offset = -200)
  dimension_code <- c(dimension_code, next_dimension_code)

  return(dimension_code)
}

#' Creates lines of python code to create 2d views of the existing structure
#'
#'
#' @return A vector of strings containing the lines of code to be generated.
#'
#' @export
#' @examples

#' freecad_2d_code ()
freecad_2d_code <- function(){


  # Create Section Plane & Shape 2d View
  section_plane <-
    c(
      "FreeCAD.DraftWorkingPlane.setTop()",
      "FreeCAD.ActiveDocument.recompute()",
      "Gui.activeDocument().activeView().viewTop()",
      "App.activeDocument().recompute()",
      "sectionPlane = Arch.makeSectionPlane([existing_building, existing_dimensions])",
      "sectionPlane.Placement.move(FreeCAD.Vector(0, 0, -650))",
      ""
    )

  tech_drawing <-
    c(
      "Gui.ActiveDocument = Gui.getDocument('SHV')", #Note relying on the fact that SHV is know to be the name
      "Gui.activateWorkbench('TechDrawWorkbench')",
      "page = App.activeDocument().addObject('TechDraw::DrawPage','Page')",
      "template = App.activeDocument().addObject('TechDraw::DrawSVGTemplate','Template')",
      "template.Template = '/Applications/FreeCAD.app/Contents/Resources/share/Mod/TechDraw/Templates/A4_Portrait_ISO7200Pep.svg'", # Note create my own template.
      "page.Template = App.activeDocument().Template",
      ""
    )

  # Create Plan in Tech Drawing
  plan <-
    c(
      "buildingPlan = FreeCAD.ActiveDocument.addObject('TechDraw::DrawViewArch','BuildingPlan')",
      "buildingPlan.Source = sectionPlane",
      "pageBuildingPlan = page.addView(buildingPlan)",
      "buildingPlan.Scale = 1/75",
      "buildingPlan.FontSize = 6",
      ""
    )

  view_2d_code <-
    c(section_plane, tech_drawing, plan)

  return(view_2d_code)
}



#' Creates a FreeCAD file containing architectural artifacts of the project.
#'
#' The data of the package to create a python file containing instructions for
#' generate architectural artifacts in FreeCAD This script is then run to create
#' the corresponding .FCStd files. The file names are python/freecad.py and
#' freecad/shv.FCStd.
#'
#' @importFrom dplyr %>%
#'
#' @export
#' @examples
#' logger::log_info("Working directory: ", getwd()) # For check() which has its own working directory
#' dir.create("python") # For check which has its own working directory.
#' dir.create("python/generated") # For check which has its own working directory.
#' generate_freecad_python_code()
#' unlink("python", recursive = TRUE) # For check which has its own working directory.
generate_freecad_python_code <- function(){
  header <-
    c("sys.path.append('/usr/lib/freecad/lib')",
      "import FreeCAD",
      "import Part",
      "import Sketcher",
      "import Arch",
      "import Part",
      "import Draft",
      "import FreeCADGui as Gui",
      "import math",
      "import WorkingPlane",
      "",
      "doc_name = 'SHV'",
      "document = App.newDocument(doc_name)",
      "Gui.activeDocument().activeView().viewDefaultOrientation()",
      "Gui.runCommand('Std_OrthographicCamera',1)",
      "Gui.activateWorkbench('BIMWorkbench')",
      ""
    )

  # Group Code - sets up the classes for grouping objects
  group_code <-
      c(
        "existing_building = Arch.makeBuilding([])",
        "existing_building.Label = 'Existing Building'",
        "existing_dimensions = document.addObject('App::DocumentObjectGroup','Dimensions')",
        "existing_dimensions.Label = 'Existing Dimensions'",
        "",
        "new_structure = Arch.makeBuilding([])",
        "new_structure.Label = 'New Structure'",
        "new_dimensions = document.addObject('App::DocumentObjectGroup','Dimensions')",
        "new_dimensions.Label = 'New Dimensions'",
        ""
      )

  # Creating the python code for for generating creates the body of the code for generating
  # FreeCAD file
  utils::data("existing_pillars", envir = environment())
  pillar_code <- freecad_pillar_code(existing_pillars)
  utils::data("existing_walls", envir = environment())
  utils::data("existing_holes", envir = environment())
  utils::data("new_walls", envir = environment())
  utils::data("new_windows", envir = environment())
  wall_code <- freecad_wall_code(existing_walls,
                                 hole_tbl  = existing_holes,
                                 building_name = "existing_building")
  new_wall_code <- freecad_wall_code(new_walls,
                                     window_tbl = new_windows,
                                     building_name = "new_structure")
  # reposition_code <- freecad_reposition_code()
  dimension_code <- freecad_dimension_code()
  view_2d_code <- freecad_2d_code()
  body <- c(group_code,
            pillar_code,
            wall_code,
            new_wall_code,
            # reposition_code,
            dimension_code,
            view_2d_code)

  footer <-
    c("Gui.SendMsgToActiveView('ViewFit')",
      "FreeCAD.ActiveDocument.recompute()",
      "Gui.SendMsgToActiveView('ViewFit')",
     #TODO do stuff to save file.
      # "# Save the generated file",
      # "import os",
      # "bpy.ops.wm.save_as_mainfile(filepath= os.getcwd() + '/blender/shell.blend')",
      # #      "bpy.context.space_data.params.filename = 'shell.stl'", TODO STL export not working SVH-53
      ""
    )
  freecad_code <- c(header, body, footer)


  # Save python file
  writeLines(freecad_code, "python/generated/freecad.py")

  # Run the generated freecad.py file.
  # system("python python/freecad.py")
  # TODO - see how to run the file with freecad headless or not.
  # Note there is a whole issue with views when you run headless.
  # File freecad-headless-test.py was an attempt to solve this problem
  # In the meantime using freecad manually.


}
