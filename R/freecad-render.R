# Work around used to pass package checks
# Without this line the following is a note for the package check
# no visible binding for global variable ‘existing-pillarn'
utils::globalVariables(c("existing_pillars"))

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
#' can generate the walls in FreeCAD.
#'
#' @param wall_tbl the tibble containing the wall data
#'
#' @return A vector of strings containing the lines of code to be generated.
#'
#' @export
#' @examples
#' wall <-
#' tibble::tibble(
#'   name = c("Wall_1", "Wall_2"),
#'   location_x = c(1.1, 2.1),
#'   location_y = c(1.1, 2.1),
#'   location_z = c(1.5, 1.5),
#'   length = c(0.2, 0.2),
#'   width = c(0.2, 0.2),
#'   height = c(3, 3),
#'   rotation_z = c(0, 90)
#' )
#'
#' freecad_wall_code(wall)
freecad_wall_code <- function(wall_tbl){
  # assertthat::assert_that(nrow(wall_tbl) == 1,
  #                         msg = "walls_tbl must have exactly 1 row")

  wall_code <- c()
  no_rows <- nrow(wall_tbl)
  for (i in 1:no_rows){
    tbl_row <- wall_tbl[i,]
    rotation_rad = tbl_row$rotation_z * pi / 180
    delta_x = round(cos(rotation_rad), digits = 15) * tbl_row$length / 2
    delta_y = round(sin(rotation_rad), digits = 15) * tbl_row$length / 2
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
  }
  return(wall_code)
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
  # shell.blend
  utils::data("existing_pillars", envir = environment())
  pillar_code <- freecad_pillar_code(existing_pillars)
  utils::data("existing_walls", envir = environment())
  wall_code <- freecad_wall_code(existing_walls)
  body <- c(pillar_code, wall_code)

  footer <-
    c("Gui.SendMsgToActiveView('ViewFit')",
      "FreeCAD.ActiveDocument.recompute()",
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
