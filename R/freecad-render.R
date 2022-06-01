# Work around used to pass package checks
# Without this line the following is a note for the package check
# no visible binding for global variable ‘existing-pillarn', 'wall_name' and
# 'existing_holes'
utils::globalVariables(c("existing_pillars", "wall_name", "existing_holes"))

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
        paste("pillar", i, " = Arch.makeWall(baseline, length=None, width=",
              tbl_row$width, ", height=",
              tbl_row$height, ", name='",
              tbl_row$name, "')", sep = ""),
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
#' @param hole_tbl the tibble containing the hole data for the wwalls
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
#' freecad_wall_code(walls, holes)
freecad_wall_code <- function(wall_tbl, hole_tbl){
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
        paste("wall", i, " = Arch.makeWall(baseline, length=None, width=",
              tbl_row$width, ", height=",
              tbl_row$height, ", name='",
              tbl_row$name, "')", sep = ""),
        ""
      )
    wall_code <- c(wall_code, next_wall_code)
    wall_holes <- dplyr::filter(hole_tbl, wall_name == tbl_row$name)
    no_rows <- nrow(wall_holes)
    if (no_rows > 0){
      for (j in 1:no_rows){
        tbl_hole_row <- wall_holes[j,]
        hole_x_start <- x_start + x_angular_factor * tbl_hole_row$start
        hole_y_start <- y_start + y_angular_factor * tbl_hole_row$start
        hole_z_start <- tbl_hole_row$z_start
        hole_x_end <- hole_x_start + x_angular_factor * tbl_hole_row$length
        hole_y_end <- hole_y_start + y_angular_factor * tbl_hole_row$length
        hole_z_end <- tbl_hole_row$z_start
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
            paste("hole", j, " = Arch.makeWall(baseline, length=None, width=",
                  tbl_row$width, ", height=",
                  tbl_hole_row$height, ", name='",
                  tbl_hole_row$name, "')", sep = ""),
            paste("Arch.removeComponents(hole", j, ", wall", i, ")", sep = ""),
            ""
          )
        wall_code <- c(wall_code, next_hole_code)
      }
    }
  }
  return(wall_code)
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

  # Creating the python code for for generating creates the body of the code for generating
  # FreeCAD file
  utils::data("existing_pillars", envir = environment())
  pillar_code <- freecad_pillar_code(existing_pillars)
  utils::data("existing_walls", envir = environment())
  utils::data("existing_holes", envir = environment())
  wall_code <- freecad_wall_code(existing_walls, existing_holes)
  reposition_code <- freecad_reposition_code()
  body <- c(pillar_code, wall_code, reposition_code)

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
