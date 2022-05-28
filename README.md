# README #

This repository contains the public documents of the Sustainable Home Valencia
project which aims to use software development technology to design and project
management of an apartment renovation to meet sustainable standards. The project
is aiming for [Passive House Certification](https://passivehouse.com/index.html) 
certification, specifically the
[EnerPHit Standard](https://passipedia.org/certification/enerphit) standard
applicable to refurbishment of existing buildings.

NOTE ABOUT DOCUMENTS All documents for the project are created using markdown
(.md) or R markdown (.Rmd) files. These files are linked together within this
github repository to enable easy browsing of the project. These relative links
will work on git hub but not in RStudio (see below). The same markdown files
are also used to generate pdf documents that can be emailed to interested
parties. For this reason there are often extra non meaningful syntax items such
as

```
\newpage
```

Please ignore these when browsing from the gihub repository. Markdown documents
in github have a drop down table of contents in the top left of the github pane.

The project is currently entering the design phase. The design is based upon
the project_requirements [rmd/requirements.md](md/requirements.md). The design
phase involves following main activities:

- Data Capture - where all relevant data is captured to the 
[projects data store](data) and described in the projects
[meta data file](R/data.R). The following data is being collected:

  - Measurements - the physical measurements of the existing structure

  - Existing Components - The walls, pillars, floors and ceilings that mark the
  boundaries of the design.

  - Applicable Standards - Data concerning requirements of the standards we wish
  to meet with this project. This will include the passive house
  [EnerPhit standards](https://passipedia.org/_media/picopen/9f_160815_phi_building_criteria_en.pdf)

  - Material Properties - the properties of the materials being used so that
  alternative designs can be evaluated against applicable standards. An example
  here would be the r value of a particular insulation material that can be used
  to calculate potential heat loss/gain of a particular design.
  
  - Component properties - the properties he properties of the components being
  used so that alternative designs can be evaluated against applicable
  standards. For example a ventilation system.
  
  - Designed Components - this captures the data concerning the alternative
  designs. This might for example capture two different insulation alternatives.
  
- Design Document Development - These documents will capture the design
alternatives and ultimately indicate the selected design from these
alternatives. Design documents are based upon the sections in requirements
capture. The following documents are being developed (at present all of these
documents are in very early stages):

  - [Spatial Design](md/spatial-design.md)

  - [Foundation Design](md/foundation-design.md)

  - [Structures Design](md/structures-design.md)

  - [Systems Design](md/systems-design.md)

  - [Finish Design](md/finish-design.md)

  - [Regulations and Certifications](md/regulations-certifications.md)
  
  - [Outline Project Plan](md/outline-project-plan.md)

- Calculation Development - The development of the key calculation functions to
ensure that alternative designs meet applicable standards.

### How do I get set up? ###

There are two ways in which you can view the repository:

- Online through a web browser. Just follow the links in this document
- Locally be cloning the repository. For more details see below.

This repository uses R statistical coding universe to capture key non-private
aspects of the design. The R code is implemented as an R package using the
tidyverse devtools package to aid development. Designs are rendered to 2d png
formats and 3d Blender models as well as stl models.

To clone the repository locally you will need a personal computer with the
following opens source software installed:

- [git 2.24.3 or above](https://git-scm.com/) - version control

- [R 4.1.2 or above](https://www.r-project.org/) = programming and document
development

- [RStudio 1.4 or above](https://www.rstudio.com/) - integrated development
environment for R

- [Blender 3.0 or above](https://www.blender.org/) - 3d modelling tools.

In addition the following packages will need to be installed using R studio 
(go to the packages pane in the bottom right corner and click install):

- tidyverse
- devtools
- rmarkdown
- tinytex

PLEASE NOTE - we have not tested that the above software is all you need. We
suspect at least that there are a few other R packages that you will need to
install. You should be prompted for these.

To begin exploring install the above software simply clone
[this repository](https://bitbucket.org/ianksalter/homedesign/src/master/)
to your local drive. The easiest way to do clone the repository is from within
R studio. Select the menu option File > New Project then Version Control, then
Git. Then enter the above repository into the repository URL field and choose
the other fields as you so require.

Written documents are created using R markdown. See the [md](md) folder for
examples of the original documents. Use the Preview (.md) or KNIT (.rmd)
option in the R studio tool bar to generate pdf files from the documents.

NOTE: As mentioned above the relative document links are designed for the git
repository and will not work when browsing rendered documents in R studio. For
this reason we have allways included the relative path for relative links
to help you navigate through the repository to these documents using the
R studio file browser. All external links will still work from rendered
documents.

The main code base is contained in the [R folder](R). The tests for this
code are contained in the the folder [tests/testthat](tests/testthat). To
run code you will need to load the project in R studio entering the following
command in the RStudio console:

```
devtools::loadall()
```

From then you can execute functions in the console. For example the following
command will (re)generate the 3d model of the building shell to
[blender/shell.blend]:

```
create_shell_blend()
```

This file can then be viewed at [blender/shell.blend](blender/shell.blend).

To see all of the objects (functions and data) available of the package use the
following command:

```
ls("package:homedesign")
```

The help command can be used to see the documentation of a particular object:

```
help("create_shell_blend")
```

```
help("measurements")
```

Data is held in the [data directory](data) with meta data described in standard
R package style in the file [R/data.r](R/data.R). Data generation code is also
located in the standard R location [data-raw/DATASET.R]. Any data file can be
opened in R studio

Additional directories include the following:

- blender - contains (mostly generated) 3d models relevant to the design

- png - contains generated 2d models of the design.

- python - contains the files generated in the python programming language that
are in turn used to generate the blender models

### Why? A History of the Project ###

It is a somewhat novel approach to apply the tools of software development
to built environment design. The approach has evolved due to the project
history.

The owner originally purchased the property to be renovated in mid 2021. At
the time he was looking at a choice of two properties, both on the ground
floor. One was renovated the other not. The renovated property would have been
an OK option but there were some things he would want to change. He engaged
an architect to get a rough estimate of the time and money it would take
to do a renovation from scratch in the un-renovated property. He was given a
time estimate of six months.

After a period of 5 months there was scarcely any advance on the project except
for a few inaccurate drawings. The architect didn't seem to have any idea about
building for sustainability and was unable to answer questions about thermal
qualities of the planned materials. The architect seemed to be expecting the
builders to do the meat of the design work. Additional doubts grew concerning
the architect's project management abilities. These doubts arose as meetings
were frequently postponed to address crises on other projects. As a result
the owner lost all confidence in the architect as well as the whole idea of
an architectural engagement where the architect was responsible for everything.
In November the original architect was dismissed and the project re-imagined as
a self build project. Since the owners expertise lay in the management of
software projects and tools used for that purpose, it seemed appropriate to
employ these tools in a different domain.

It is hoped that the project will provide some interesting crossover between
software project management and more traditional architectural practice. In
is further hoped that the exploration of the use of open source tooling for
architecture projects will also be of some use to traditional architectural
practice. It is primarily for these reasons that this project is in a
public repository with an MIT license.

### Useful Reference Information ###

[R Packages by Hadley Wickham](https://r-pkgs.org/)

[R Markdown: The Definitive Guide by Yihui Xie, J. J. Allaire, Garrett Grolemund](https://bookdown.org/yihui/rmarkdown/)

[Blender Manual](https://docs.blender.org/manual/en/latest/)
