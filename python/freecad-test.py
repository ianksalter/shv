# NOTE to get script to work had to install freecad via conda (actually 
# miniconda) following instructions here:
# https://wiki.freecadweb.org/Conda
#
# It is installed to its custom environment fcenv.
# To activate this environment, use
#
#     $ conda activate fcenv
#
# To deactivate an active environment, use
#
#     $ conda deactivate
# --------------------------------------------------------------------------- #
# FreeCAD related modules
# For 0.16 stable
# For 0.17 daily developmental
# sys.path.append('/usr/lib/freecad-daily/lib')
import FreeCAD
import Part
import Sketcher
import Arch
import Part
import Draft
import FreeCADGui as Gui
import math
import WorkingPlane

# Set Up
FreeCAD.Console.PrintMessage("Starting FreeCAD generation.\n")
doc_name = "SHV"
document = App.newDocument(doc_name)
Gui.activeDocument().activeView().viewDefaultOrientation()
Gui.runCommand('Std_OrthographicCamera',1)
Gui.activateWorkbench("BIMWorkbench")


# Building Height
building_height = 4300

# Create Pillar 1
pillar_length = 380
pillar_width = 380
baseline_y = pillar_width/2
pillar_start = FreeCAD.Vector(0, baseline_y, 0)
pillar_end = FreeCAD.Vector(pillar_length, baseline_y, 0)
baseline = Draft.makeLine(pillar_start, pillar_end)
pillar1 = Arch.makeWall(baseline, length=None, width=pillar_width, height=building_height, name="Pillar_1")

# Create Wall 1
wall_width = 100
wall_1_length = 2000
wall_1_offset = 140
baseline_x = pillar_length/2 
wall_1_start = FreeCAD.Vector(baseline_x, pillar_width, 0)
baseline = Draft.makeLine(wall_1_start, FreeCAD.Vector(baseline_x, pillar_width + wall_1_length, 0))
wall1 = Arch.makeWall(baseline, length=None, width=wall_width, height=building_height, name="Wall_1")

# Add simple door to wall 1
FreeCAD.ActiveDocument.recompute() #Note needed for all the properties of the dimension to be available !!!
door_width = 900
door_start = 600
box_wall1 = wall1.Base.Shape.BoundBox
wall_width = wall1.Width.Value
z_rotation =  math.pi/2
base_x = math.cos(z_rotation) * box_wall1.XMin + math.sin(z_rotation) * box_wall1.YMin + door_start
base_y = math.cos(z_rotation) * box_wall1.YMin - math.sin(z_rotation) * box_wall1.XMin - wall_width
base = FreeCAD.Vector(base_x, base_y, 0)
axis = FreeCAD.Vector(1, 0, 0)
doorPlace = FreeCAD.Placement(base, FreeCAD.Rotation(axis, 90)) # The final 90 is the doors z_rotation.
door = Arch.makeWindowPreset("Simple door",
                             width=door_width, height=2000,
                             h1=100, h2=100, h3=100, w1=200, w2=100, o1=0, o2=100,
                             placement=doorPlace)
door.Placement = App.Placement(App.Vector(0,0,0),App.Rotation(App.Vector(0,0,1),90))
Arch.addComponents(door, wall1)

# Create Pillar 2
baseline_y = 1.5 * pillar_width  + wall_1_length 
pillar_start = FreeCAD.Vector(0, baseline_y, 0)
baseline = Draft.makeLine(pillar_start, FreeCAD.Vector(pillar_length, baseline_y, 0))
pillar2 = Arch.makeWall(baseline, length=None, width=pillar_width, height=building_height, name="Pillar_2")

# Create Wall 2
wall_2_length = 2500
wall_2_start_x = pillar_length # baseline_y stays the same
baseline_y = 1.5 * pillar_width  + wall_1_length 
wall_2_start = FreeCAD.Vector(wall_2_start_x, baseline_y, 0)
baseline = Draft.makeLine(wall_2_start, FreeCAD.Vector(wall_2_start_x + wall_2_length, baseline_y, 0))
wall2 = Arch.makeWall(baseline, length=None, width=wall_width, height=building_height, name="Wall_2")

# Add glass door to wall 2
FreeCAD.ActiveDocument.recompute() #Note needed for all the properties of the dimension to be available !!!
door_width = 900
door_start = 300
box_wall2 = wall2.Base.Shape.BoundBox
wall_width = wall2.Width.Value
z_rotation =  0
base_x = math.cos(z_rotation) * box_wall2.XMin + math.sin(z_rotation) * box_wall2.YMin + door_start
base_y = math.cos(z_rotation) * box_wall2.YMin - math.sin(z_rotation) * box_wall2.XMin - wall_width
base = FreeCAD.Vector(base_x, base_y, 0)
axis = FreeCAD.Vector(1, 0, 0)
doorPlace = FreeCAD.Placement(base, FreeCAD.Rotation(axis, 90))
door = Arch.makeWindowPreset("Glass door",
                             width=door_width, height=2000,
                             h1=100, h2=100, h3=100, w1=200, w2=100, o1=0, o2=100,
                             placement=doorPlace)
door.Placement = App.Placement(App.Vector(0,0,0),App.Rotation(App.Vector(0,0,1),0)) # The final 0 is the doors z_rotation.
Arch.addComponents(door, wall2)


# Create a building
building = Arch.makeBuilding([pillar1,pillar2,wall1,wall2], name="Apartment")
Gui.activeDocument().activeView().viewTop()
# App.ActiveDocument.recompute()
Gui.SendMsgToActiveView("ViewFit")


#Phase 2 Add dimensions

# X Dimension Wall 1
FreeCAD.ActiveDocument.recompute() #Note needed for all the properties of the dimension to be available !!!!
line_wall1 = wall1.Base
wall_1_xmin = line_wall1.Shape.BoundBox.XMin
wall_1_ymin = line_wall1.Shape.BoundBox.YMin
wall_1_ymax = line_wall1.Shape.BoundBox.YMax
wall_1_ycenter = (wall_1_ymax - wall_1_ymin)/2
dimension_point = FreeCAD.Vector(wall_1_xmin + 300, wall_1_ycenter, 0)
dim_wall1 = Draft.make_linear_dimension_obj(line_wall1, 1, 2, dimension_point)
dim_wall1.Label = "dim_wall1"
dim_wall1_view = dim_wall1.ViewObject
dim_wall1_view.ArrowSize = 20
dim_wall1_view.ArrowType = "Arrow"
dim_wall1_view.FontSize = 80
dim_wall1_view.ExtLines = 300
dim_wall1_view.ExtOvershoot = 100

# Y Dimension Pillar 2 and Wall 2
overall_bound_box = pillar2.Shape.BoundBox.united(wall2.Shape.BoundBox)
y_mid = (overall_bound_box.YMax + overall_bound_box.YMin)/2
x_mid = (overall_bound_box.XMax + overall_bound_box.XMin)/2
point1 = FreeCAD.Vector(overall_bound_box.XMin, y_mid, 0)
point2 = FreeCAD.Vector(overall_bound_box.XMax, y_mid, 0)
point3 = FreeCAD.Vector(x_mid, y_mid + 300, 0)
dimension2 = Draft.make_linear_dimension(point1, point2, point3)
dimension2.Label = "dimension2"
dimension2_view = dimension2.ViewObject
dimension2_view.ArrowSize = 20
dimension2_view.ArrowType = "Arrow"
dimension2_view.FontSize = 80
dimension2_view.ExtLines = 300
dimension2_view.ExtOvershoot = 100

dimensions = document.addObject("App::DocumentObjectGroup","Dimensions")
dimensions.Label = "dimensions"
dimensions.addObject(dim_wall1)
dimensions.addObject(dimension2)


# Create Section Plane & Shape 2d View
FreeCAD.DraftWorkingPlane.setTop()
FreeCAD.ActiveDocument.recompute()
Gui.activeDocument().activeView().viewTop()
App.activeDocument().recompute()
sectionPlane = Arch.makeSectionPlane([building, dimensions])
sectionPlane.Placement.move(FreeCAD.Vector(0, 0, -650))
shape2d = Draft.make_shape2dview(building)


# Create Tech Drawing
Gui.ActiveDocument = Gui.getDocument(doc_name)
Gui.activateWorkbench("TechDrawWorkbench")
page = App.activeDocument().addObject('TechDraw::DrawPage','Page')
template = App.activeDocument().addObject('TechDraw::DrawSVGTemplate','Template')
template.Template = '/Applications/FreeCAD.app/Contents/Resources/share/Mod/TechDraw/Templates/A3_LandscapeTD.svg'
page.Template = App.activeDocument().Template

# Create Plan in Tech Drawing
buildingPlan = FreeCAD.ActiveDocument.addObject('TechDraw::DrawViewArch','BuildingPlan')
buildingPlan.Source = sectionPlane
pageBuildingPlan = page.addView(buildingPlan)
buildingPlan.Scale = 1/25


# OLD APPROACH TO DRAWING PLAN VIEW
# Gui.Selection.clearSelection()
# building_view = Gui.Selection.addSelection(building)
# view = document.addObject('TechDraw::DrawViewPart','View')
# rc = page.addView(view)
# view.Source = [building]
# view.Direction = FreeCAD.Vector(0.000,0.000,1.000)
# view.XDirection = FreeCAD.Vector(1.000,0.000,0.000)
# view.Scale = 0.05
# view.Y = 180






# Clean Up
Gui.SendMsgToActiveView("ViewFit")
FreeCAD.ActiveDocument.recompute()
document.saveAs("freecad/SHV.FCStd")
