# Work around used to pass package checks
# Without this line the following is a note for the package check
# no visible binding for global variable ‘existing-pillarn'
utils::globalVariables(c("existing_pillars"))

#' Creates lines of python code to generate a set of pillars in blender
#'
#' Uses a tibble of python pillar data to generate the python code that
#' can generate the pillars in blender.
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
#' create_blender_pillar_code(pillar)
create_blender_pillar_code <- function(pillar_tbl){
  # assertthat::assert_that(nrow(pillar_tbl) == 1,
  #                         msg = "pillars_tbl must have exactly 1 row")

  pillar_code <- c()
  no_rows <- nrow(pillar_tbl)
  for (i in 1:no_rows){
    tbl_row <- pillar_tbl[i,]
    pillar_location <-
      c(tbl_row$location_x,
        tbl_row$location_y,
        tbl_row$location_z)
    pillar_dimensions <-
      c(tbl_row$length,
        tbl_row$width,
        tbl_row$height)
    next_pillar_code <-
      c("bpy.ops.mesh.primitive_cube_add(",
        "enter_editmode=False,",
        "align='WORLD',",
        paste("location=(",
              paste(pillar_location, collapse = ","), "))", sep = ""),
        paste("bpy.context.object.name = '", pillar_tbl$name[i], "'", sep = ""),
        paste("bpy.context.object.dimensions = (",
              paste(pillar_dimensions, collapse = ","), ")", sep = ""),
        ""
      )
    pillar_code <- c(pillar_code, next_pillar_code)
  }
  return(pillar_code)
}

#' Creates lines of python code to generate a set of walls in blender
#'
#' Uses a tibble of python wall data to generate the python code that
#' can generate the walls in blender.
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
#' create_blender_wall_code(wall)
create_blender_wall_code <- function(wall_tbl){
  # assertthat::assert_that(nrow(wall_tbl) == 1,
  #                         msg = "walls_tbl must have exactly 1 row")

  wall_code <- c()
  no_rows <- nrow(wall_tbl)
  for (i in 1:no_rows){
    tbl_row <- wall_tbl[i,]
    wall_location <-
      c(tbl_row$location_x,
        tbl_row$location_y,
        tbl_row$location_z)
    wall_scale <-
      c(tbl_row$length,
        tbl_row$width,
        tbl_row$height)
    wall_rotation <-
      c(0,
        0,
        tbl_row$rotation_z * pi / 180)
    next_wall_code <-
      c("bpy.ops.mesh.primitive_cube_add(",
        "size=1,",
        "enter_editmode=False,",
        "align='WORLD',",
        paste("location=(",
              paste(wall_location, collapse = ","), "),", sep = ""),
        paste("scale=(",
              paste(wall_scale, collapse = ","), "),", sep = ""),
        paste("rotation=(",
              paste(wall_rotation, collapse = ","), "))", sep = ""),
        paste("bpy.context.object.name = '", wall_tbl$name[i], "'", sep = ""),
        ""
      )
    wall_code <- c(wall_code, next_wall_code)
  }
  return(wall_code)
}

#' Creates a blender file for the shell of the existing structure
#'
#' Uses package data on the existing building to create a python file
#' containing instructions to generate the shell in blender. This
#' script is then run to create a corresponding.bend files. The file names are
#' python/existing_shell.py and blender/existing_shell.blend.
#'
#' @importFrom dplyr %>%
#'
#' @export
#' @examples
#' logger::log_info("Working directory: ", getwd()) # For check() which has its own working directory
#' dir.create("python") # For check which has its own working directory.
#' create_shell_blend()
#' unlink("python", recursive = TRUE) # For check which has its own working directory.
create_shell_blend <- function(){
  create_shell_header <-
    c(
      "import bpy",
      "",
      "# Delete default cube",
      "bpy.ops.object.delete(use_global=False)",
      "",
      "# Ensure we are using the metric system",
      "bpy.context.scene.unit_settings.system = 'METRIC'",
      ""
    )

  # Creating the python code for for generating creates the body of the code for generating
  # shell.blend
  utils::data("existing_pillars", envir = environment())
  create_pillar_code <- create_blender_pillar_code(existing_pillars)
  utils::data("existing_walls", envir = environment())
  create_wall_code <- create_blender_wall_code(existing_walls)
  create_shell_body <- c(create_pillar_code, create_wall_code)

  create_shell_footer <-
    c(
      "# Save the generated file",
      "bpy.ops.wm.save_as_mainfile(filepath='blender/shell.blend')",
      "bpy.context.space_data.params.filename = 'shell.stl'",
      ""
    )
  create_shell <- c(create_shell_header, create_shell_body, create_shell_footer)


  # Save python file
  writeLines(create_shell, "python/create_shell.py")

  # Generate blend file using blender in headless mode
  # system("Blender -b --python python/create_shell.py")
  system("Blender -b --python python/create_shell.py")
}
