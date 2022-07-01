                                                                                                                               # Work around used to pass package checks
# Without this line the following is a note for the package check
# no visible binding for global variable ‘measure’/'dimension'
utils::globalVariables(c("measure"))
utils::globalVariables(c("dimension"))

#' generate_measurements
#'
#' Function used to generate a tibbles of existing measurements This data can be
#' saved as package data in data-raw/DATASET.R. The fields of the tibbles are
#' documented in R/data.R.
#'
#'
#' @importFrom dplyr %>%
#'
#' @return A tibble of existing pillars in the structure.
#' @export
#' @examples
#' generate_measurements()
generate_measurements <- function(){

  # Ready for future asserts
  # assertthat::assert_that(structure_type %in% c("Pillars", "Walls", "Floors",
  #                                               "Doors", "Windows", "Beams"),
  #                         msg = "Invalid structure_type")

  # Common variables based upon measurement of the existing structure
  # These were taken from drawing BEA 01

  # Building heights
  heights_tbl <-
    tibble::tribble(
      ~measure,      ~dimension,    ~value, ~note,
      "space_1",    "height",      4300,   "",
      "first_step",  "height",      0150,   "Need to check", # TODO check!!!
      "garden_step", "height",      0150,   "Need to check", # TODO check!!!
      "base",        "height",      0100,   "The height before floor starts."
    )
  # structure_height <-
  #   entrance_height + first_step_height + garden_step_height + base_thickness

  # Pillar distances and dimensions
  # Note pillars are numbered clockwise from the origin (south west corner)
  pillar_tbl <-
    tibble::tribble(
      ~measure,      ~dimension,       ~value, ~note,
      "pillar",      "length",        380,    "",
      "pillar",      "width",         380,    "",
      "pillar_4_5",  "width",         370,    "",
      "pillar_6",    "length",        260,    "",
      "pillar_6",    "width",         260,    "",
      "pillar_2",    "x_obtrusion",   140,    "Amount pillar 2 sticks out from the wall",
      "pillar_9",    "x_obtrusion",   280,    "Amount pillar 9 sticks out from the wall on the south side",
      "pillar_6",    "y_obtrusion",   140,    "Amount pillar 6 sticks out from the wall",
      "pillar_4_8",  "x_distance",    3440,    "Distance between pillars 4 and 8 in x direction",
      "pillar_5_7",  "x_distance",    3220,    "Distance between pillars 5 and 7 in x direction",
      "pillar_6",    "x_distance",    2300,    "Distance between the left/west wall and pillar 6"
)

  # Wall Dimensions
  # Note walls are numbered clockwise from the origin (south west corner)
  wall_tbl <-
    tibble::tribble(
      ~measure,  ~dimension, ~value, ~note,
      "wall_1",  "length",   3390,   "",
      "wall_2",  "length",   3360,   "",
      "wall_3",  "length",   4080,   "",
      "wall_4",  "length",   3350,   "",
      "wall_5",  "length",   0790,   "",
      "wall_14", "length",   4420,   "Space 1 x_direction - 14 - 28",
      "west_wall","width", 100, "",
      "north_wall", "width", 120, "",
      "east_wall", "width", 100, "",
      "south_wall", "width", 380, "Need to check " #TODO check
  )

  #Space dimensions - distance of the 4 internal existing spaces..
  space_tbl <-
    tibble::tribble(
      ~measure,  ~dimension, ~value, ~note,
      "space_1",  "x_direction",   4840,   "",
      "space_1",  "y_direction",   3390,   "",
      "space_2",  "x_direction",   4700,   "",
      "space_2",  "y_direction",   3760,   "", # 338cm + 38cm
      "space_3",  "x_direction",   4280,   "",
      "space_3",  "y_direction",   4560,   "",
      "space_4",  "x_direction",   6090,   "",
      "space_4",  "y_direction",   4780,   ""
    )

  entrance_tbl <-
    tibble::tribble(
      ~measure,   ~dimension, ~value, ~note,
      "entrance", "x_start",  690,   "", # 83 cm - 14 cm
      "entrance", "length",   2530,   "",
      "entrance_big_hole", "height",   4050,   "",
      "entrance_big_hole", "width",   300,   "",
      "entrance_small_hole", "height", 3080, "",
      "entrance_small_hole" , "width" , 80, ""
    )

  combined_tbl <-
    heights_tbl %>%
    dplyr::bind_rows(pillar_tbl) %>%
    dplyr::bind_rows(wall_tbl) %>%
    dplyr::bind_rows(space_tbl) %>%
    dplyr::bind_rows(entrance_tbl)
  measure_tbl <-
    structure(
      combined_tbl,
      class = c("measure_tbl", class(combined_tbl))
    )
  return(measure_tbl)
}

#' Looks up values in a measure tibble.
#'
#' Returns values on a measure tibble  given parameters measure_name and
#' dimension_name.
#'
#' @param measure_tbl An object of class measure_tbl
#' @param measure_name the name in the measure column of the measure_tbl
#' @param dimension_name the name in the dimension field of the measure_tbl.
#'
#' @return Returns a the value corresponding to the measure_name and
#' dimension_name in the measure_tbl.
#'
#' @export
#' @examples
#' existing <-
#' tibble::tribble(
#'  ~measure,  ~dimension, ~value, ~note,
#'  "wall",    "length",   3.40,   "Test Note",
#'  "wall",    "width",    0.15,   "")
#' distance(existing, "wall", "length")
distance <- function(measure_tbl, measure_name, dimension_name){
  tbl_class <-
  assertthat::are_equal(class(measure_tbl),
                        c("measure_tbl", "tbl_df", "tbl", "data.frame"),
                        msg = "Class must be measure_tbl")
  value_tbl <-
    measure_tbl %>%
    dplyr::filter(measure == measure_name & dimension == dimension_name)
  created_value <- value_tbl$value
  value_length <- length(created_value)
  assertthat::assert_that(! value_length < 1,
                          msg = "measure_name or dimension_name not in measure_tbl")
  assertthat::assert_that(! value_length > 1,
                          msg = "Non unique values in measure_tbl")
  return(created_value)
}

#' Looks up notes in a measure tibble.
#'
#' Returns notes on a measure tibble  given parameters measure_name and
#' dimension_name.
#'
#' @param measure_tbl An object of class measure_tbl
#' @param measure_name the name in the measure column of the measure_tbl
#' @param dimension_name the name in the dimension field of the measure_tbl.
#'
#' @return Returns a the note corresponding to the measure_name and
#' dimension_name in the measure_tbl.
#'
#' @export
#' @examples
#' existing <-
#' tibble::tribble(
#'  ~measure,  ~dimension, ~value, ~note,
#'  "wall",    "length",   3.40,   "Test Note",
#'  "wall",    "width",    0.15,   "")
#' note_for(existing, "wall", "length")
note_for <- function(measure_tbl, measure_name, dimension_name){
  assertthat::are_equal(class(measure_tbl),
                          c("measure_tbl", "tbl_df", "tbl", "data.frame"),
                          msg = "Class must be measure_tbl")
  note_tbl <-
    measure_tbl %>%
    dplyr::filter(measure == measure_name & dimension == dimension_name)
  created_note <- note_tbl$note
  value_length <- length(created_note)
  assertthat::assert_that(! value_length < 1,
                          msg = "measure_name or dimension_name not in measure_tbl")
  assertthat::assert_that(! value_length > 1,
                          msg = "Non unique values in measure_tbl")
  return(created_note)
}
