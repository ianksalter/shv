sys.path.append('/usr/lib/freecad/lib')
import FreeCAD
import Part
import Sketcher
import Arch
import Part
import Draft
import FreeCADGui as Gui
import math
import WorkingPlane

doc_name = 'SHV'
document = App.newDocument(doc_name)
Gui.activeDocument().activeView().viewDefaultOrientation()
Gui.runCommand('Std_OrthographicCamera',1)
Gui.activateWorkbench('BIMWorkbench')

existing_building = Arch.makeBuilding([])
existing_building.Label = 'Existing Building'
existing_dimensions = document.addObject('App::DocumentObjectGroup','Dimensions')
existing_dimensions.Label = 'Existing Dimensions'

new_structure = Arch.makeBuilding([])
new_structure.Label = 'New Structure'
new_dimensions = document.addObject('App::DocumentObjectGroup','Dimensions')
new_dimensions.Label = 'New Dimensions'

baseline_start = FreeCAD.Vector(-140, 190, 0)
baseline_end = FreeCAD.Vector(240, 190, 0)
baseline = Draft.makeLine(baseline_start, baseline_end)
pillar = Arch.makeWall(baseline, length=None, width=380, height=4700, name='Pillar_1')
existing_building.addObject(pillar)

baseline_start = FreeCAD.Vector(-140, 3960, 0)
baseline_end = FreeCAD.Vector(240, 3960, 0)
baseline = Draft.makeLine(baseline_start, baseline_end)
pillar = Arch.makeWall(baseline, length=None, width=380, height=4700, name='Pillar_2')
existing_building.addObject(pillar)

baseline_start = FreeCAD.Vector(-140, 7700, 0)
baseline_end = FreeCAD.Vector(240, 7700, 0)
baseline = Draft.makeLine(baseline_start, baseline_end)
pillar = Arch.makeWall(baseline, length=None, width=380, height=4700, name='Pillar_3')
existing_building.addObject(pillar)

baseline_start = FreeCAD.Vector(-135, 12155, 0)
baseline_end = FreeCAD.Vector(235, 12155, 0)
baseline = Draft.makeLine(baseline_start, baseline_end)
pillar = Arch.makeWall(baseline, length=None, width=370, height=4700, name='Pillar_4')
existing_building.addObject(pillar)

baseline_start = FreeCAD.Vector(-135, 15885, 0)
baseline_end = FreeCAD.Vector(235, 15885, 0)
baseline = Draft.makeLine(baseline_start, baseline_end)
pillar = Arch.makeWall(baseline, length=None, width=370, height=4700, name='Pillar_5')
existing_building.addObject(pillar)

baseline_start = FreeCAD.Vector(2400, 16860, 0)
baseline_end = FreeCAD.Vector(2660, 16860, 0)
baseline = Draft.makeLine(baseline_start, baseline_end)
pillar = Arch.makeWall(baseline, length=None, width=260, height=4700, name='Pillar_6')
existing_building.addObject(pillar)

baseline_start = FreeCAD.Vector(3460, 15890, 0)
baseline_end = FreeCAD.Vector(3840, 15890, 0)
baseline = Draft.makeLine(baseline_start, baseline_end)
pillar = Arch.makeWall(baseline, length=None, width=380, height=4700, name='Pillar_7')
existing_building.addObject(pillar)

baseline_start = FreeCAD.Vector(3680, 12160, 0)
baseline_end = FreeCAD.Vector(4060, 12160, 0)
baseline = Draft.makeLine(baseline_start, baseline_end)
pillar = Arch.makeWall(baseline, length=None, width=380, height=4700, name='Pillar_8')
existing_building.addObject(pillar)

baseline_start = FreeCAD.Vector(4660, 3960, 0)
baseline_end = FreeCAD.Vector(5040, 3960, 0)
baseline = Draft.makeLine(baseline_start, baseline_end)
pillar = Arch.makeWall(baseline, length=None, width=380, height=4700, name='Pillar_9')
existing_building.addObject(pillar)

baseline_start = FreeCAD.Vector(4660, 190, 0)
baseline_end = FreeCAD.Vector(5040, 190, 0)
baseline = Draft.makeLine(baseline_start, baseline_end)
pillar = Arch.makeWall(baseline, length=None, width=380, height=4700, name='Pillar_10')
existing_building.addObject(pillar)

baseline_start = FreeCAD.Vector(50.0000000000001, 380, 0)
baseline_end = FreeCAD.Vector(50.0000000000001, 3770, 0)
baseline = Draft.makeLine(baseline_start, baseline_end)
wall = Arch.makeWall(baseline, length=None, width=100, height=4700, name='Wall_1')
existing_building.addObject(wall)

baseline_start = FreeCAD.Vector(50.0000000000001, 4150, 0)
baseline_end = FreeCAD.Vector(50.0000000000001, 7510, 0)
baseline = Draft.makeLine(baseline_start, baseline_end)
wall = Arch.makeWall(baseline, length=None, width=100, height=4700, name='Wall_2')
existing_building.addObject(wall)

baseline_start = FreeCAD.Vector(50.0000000000001, 7890, 0)
baseline_end = FreeCAD.Vector(50.0000000000001, 11970, 0)
baseline = Draft.makeLine(baseline_start, baseline_end)
wall = Arch.makeWall(baseline, length=None, width=100, height=4700, name='Wall_3')
existing_building.addObject(wall)

baseline_start = FreeCAD.Vector(50.0000000000001, 12350, 0)
baseline_end = FreeCAD.Vector(50.0000000000001, 15700, 0)
baseline = Draft.makeLine(baseline_start, baseline_end)
wall = Arch.makeWall(baseline, length=None, width=100, height=4700, name='Wall_4')
existing_building.addObject(wall)

baseline_start = FreeCAD.Vector(50, 16080, 0)
baseline_end = FreeCAD.Vector(50, 16990, 0)
baseline = Draft.makeLine(baseline_start, baseline_end)
wall = Arch.makeWall(baseline, length=None, width=100, height=4700, name='Wall_5')
existing_building.addObject(wall)

baseline_start = FreeCAD.Vector(100, 16930, 0)
baseline_end = FreeCAD.Vector(2400, 16930, 0)
baseline = Draft.makeLine(baseline_start, baseline_end)
wall = Arch.makeWall(baseline, length=None, width=120, height=4700, name='Wall_6')
existing_building.addObject(wall)

baseline_start = FreeCAD.Vector(2660, 16930, 0)
baseline_end = FreeCAD.Vector(6190, 16930, 0)
baseline = Draft.makeLine(baseline_start, baseline_end)
wall = Arch.makeWall(baseline, length=None, width=120, height=4700, name='Wall_7')
existing_building.addObject(wall)

baseline_start = FreeCAD.Vector(6240, 11990, 0)
baseline_end = FreeCAD.Vector(6240, 16990, 0)
baseline = Draft.makeLine(baseline_start, baseline_end)
wall = Arch.makeWall(baseline, length=None, width=100, height=4700, name='Wall_8')
existing_building.addObject(wall)

baseline_start = FreeCAD.Vector(4480, 12040, 0)
baseline_end = FreeCAD.Vector(6190, 12040, 0)
baseline = Draft.makeLine(baseline_start, baseline_end)
wall = Arch.makeWall(baseline, length=None, width=100, height=4700, name='Wall_9')
existing_building.addObject(wall)

baseline_start = FreeCAD.Vector(4430, 7530, 0)
baseline_end = FreeCAD.Vector(4430, 12090, 0)
baseline = Draft.makeLine(baseline_start, baseline_end)
wall = Arch.makeWall(baseline, length=None, width=100, height=4700, name='Wall_10')
existing_building.addObject(wall)

baseline_start = FreeCAD.Vector(4480, 7580, 0)
baseline_end = FreeCAD.Vector(4800, 7580, 0)
baseline = Draft.makeLine(baseline_start, baseline_end)
wall = Arch.makeWall(baseline, length=None, width=100, height=4700, name='Wall_11')
existing_building.addObject(wall)

baseline_start = FreeCAD.Vector(4850, 4150, 0)
baseline_end = FreeCAD.Vector(4850, 7630, 0)
baseline = Draft.makeLine(baseline_start, baseline_end)
wall = Arch.makeWall(baseline, length=None, width=100, height=4700, name='Wall_12')
existing_building.addObject(wall)

baseline_start = FreeCAD.Vector(4990, 380, 0)
baseline_end = FreeCAD.Vector(4990, 3770, 0)
baseline = Draft.makeLine(baseline_start, baseline_end)
wall = Arch.makeWall(baseline, length=None, width=100, height=4700, name='Wall_13')
existing_building.addObject(wall)

baseline_start = FreeCAD.Vector(240, 190, 0)
baseline_end = FreeCAD.Vector(4660, 190, 0)
baseline = Draft.makeLine(baseline_start, baseline_end)
wall = Arch.makeWall(baseline, length=None, width=380, height=4700, name='Wall_14')
existing_building.addObject(wall)

baseline_start = FreeCAD.Vector(930, 270, 0)
baseline_end = FreeCAD.Vector(3460, 350, 0)
baseline = Draft.makeLine(baseline_start, baseline_end)
hole = Arch.makeWall(baseline, length=None, width=300, height=4050, name='Hole_1')
Arch.removeComponents(hole, wall)

baseline_start = FreeCAD.Vector(930, 190, 0)
baseline_end = FreeCAD.Vector(3460, 190, 0)
baseline = Draft.makeLine(baseline_start, baseline_end)
hole = Arch.makeWall(baseline, length=None, width=380, height=3080, name='Hole_2')
Arch.removeComponents(hole, wall)

baseline_start = FreeCAD.Vector(165, 395, 250)
baseline_end = FreeCAD.Vector(165, 3755, 250)
baseline = Draft.makeLine(baseline_start, baseline_end)
wall = Arch.makeWall(baseline, length=None, width=100, height=2600, name='Steel_Wall_1')
new_structure.addObject(wall)

baseline_start = FreeCAD.Vector(165, 4165, 250)
baseline_end = FreeCAD.Vector(165, 7495, 250)
baseline = Draft.makeLine(baseline_start, baseline_end)
wall = Arch.makeWall(baseline, length=None, width=100, height=2600, name='Steel_Wall_2')
new_structure.addObject(wall)

baseline_start = FreeCAD.Vector(165, 7905, 250)
baseline_end = FreeCAD.Vector(165, 9595, 250)
baseline = Draft.makeLine(baseline_start, baseline_end)
wall = Arch.makeWall(baseline, length=None, width=100, height=2600, name='Steel_Wall_3_1')
new_structure.addObject(wall)

baseline_start = FreeCAD.Vector(165, 9595, 250)
baseline_end = FreeCAD.Vector(165, 11955, 250)
baseline = Draft.makeLine(baseline_start, baseline_end)
wall = Arch.makeWall(baseline, length=None, width=100, height=3300, name='Steel_Wall_3_2')
new_structure.addObject(wall)

baseline_start = FreeCAD.Vector(165, 12365, 250)
baseline_end = FreeCAD.Vector(165, 15685, 250)
baseline = Draft.makeLine(baseline_start, baseline_end)
wall = Arch.makeWall(baseline, length=None, width=100, height=3300, name='Steel_Wall_4')
new_structure.addObject(wall)

baseline_start = FreeCAD.Vector(165, 16095, 250)
baseline_end = FreeCAD.Vector(165, 16755, 250)
baseline = Draft.makeLine(baseline_start, baseline_end)
wall = Arch.makeWall(baseline, length=None, width=100, height=3300, name='Steel_Wall_5')
new_structure.addObject(wall)

baseline_start = FreeCAD.Vector(115, 16805, 250)
baseline_end = FreeCAD.Vector(2385, 16805, 250)
baseline = Draft.makeLine(baseline_start, baseline_end)
wall = Arch.makeWall(baseline, length=None, width=100, height=3300, name='Steel_Wall_6')
new_structure.addObject(wall)

FreeCAD.ActiveDocument.recompute()
box_wall = wall.Base.Shape.BoundBox
wall_width = wall.Width.Value
door_start = 335
z_rotation =  0
z_rotation_rad = math.pi * z_rotation / 180
base_x = math.cos(z_rotation_rad) * box_wall.XMin + math.sin(z_rotation_rad) * box_wall.YMin + door_start
base_y = math.cos(z_rotation_rad) * box_wall.YMin - math.sin(z_rotation_rad) * box_wall.XMin - wall_width
base = FreeCAD.Vector(base_x, base_y, 250)
axis = FreeCAD.Vector(1, 0, 0)
doorPlace = FreeCAD.Placement(base, FreeCAD.Rotation(axis, 90))
door = Arch.makeWindowPreset('Open 2-pane', width=1600, height=2500, h1=100, h2=100, h3=100, w1=200, w2=100, o1=0, o2=0, placement=doorPlace)
door.Placement = FreeCAD.Placement(FreeCAD.Vector(0,0,0),App.Rotation(FreeCAD.Vector(0,0,1),z_rotation))
door.Label = 'Garden_Door_1'
Arch.addComponents(door, wall)

baseline_start = FreeCAD.Vector(2675, 16805, 250)
baseline_end = FreeCAD.Vector(6175, 16805, 250)
baseline = Draft.makeLine(baseline_start, baseline_end)
wall = Arch.makeWall(baseline, length=None, width=100, height=3300, name='Steel_Wall_7')
new_structure.addObject(wall)

FreeCAD.ActiveDocument.recompute()
box_wall = wall.Base.Shape.BoundBox
wall_width = wall.Width.Value
door_start = 335
z_rotation =  0
z_rotation_rad = math.pi * z_rotation / 180
base_x = math.cos(z_rotation_rad) * box_wall.XMin + math.sin(z_rotation_rad) * box_wall.YMin + door_start
base_y = math.cos(z_rotation_rad) * box_wall.YMin - math.sin(z_rotation_rad) * box_wall.XMin - wall_width
base = FreeCAD.Vector(base_x, base_y, 250)
axis = FreeCAD.Vector(1, 0, 0)
doorPlace = FreeCAD.Placement(base, FreeCAD.Rotation(axis, 90))
door = Arch.makeWindowPreset('Open 2-pane', width=2000, height=2500, h1=100, h2=100, h3=100, w1=200, w2=100, o1=0, o2=0, placement=doorPlace)
door.Placement = FreeCAD.Placement(FreeCAD.Vector(0,0,0),App.Rotation(FreeCAD.Vector(0,0,1),z_rotation))
door.Label = 'Garden_Door_2'
Arch.addComponents(door, wall)

baseline_start = FreeCAD.Vector(6125, 14705, 250)
baseline_end = FreeCAD.Vector(6125, 16755, 250)
baseline = Draft.makeLine(baseline_start, baseline_end)
wall = Arch.makeWall(baseline, length=None, width=100, height=3300, name='Steel_Wall_8_1')
new_structure.addObject(wall)

baseline_start = FreeCAD.Vector(6125, 12105, 250)
baseline_end = FreeCAD.Vector(6125, 14705, 250)
baseline = Draft.makeLine(baseline_start, baseline_end)
wall = Arch.makeWall(baseline, length=None, width=100, height=2600, name='Steel_Wall_8_2')
new_structure.addObject(wall)

baseline_start = FreeCAD.Vector(4075, 12155, 250)
baseline_end = FreeCAD.Vector(6075, 12155, 250)
baseline = Draft.makeLine(baseline_start, baseline_end)
wall = Arch.makeWall(baseline, length=None, width=100, height=2600, name='Steel_Wall_9')
new_structure.addObject(wall)

FreeCAD.ActiveDocument.recompute()
box_wall = wall.Base.Shape.BoundBox
wall_width = wall.Width.Value
door_start = 1000
z_rotation =  0
z_rotation_rad = math.pi * z_rotation / 180
base_x = math.cos(z_rotation_rad) * box_wall.XMin + math.sin(z_rotation_rad) * box_wall.YMin + door_start
base_y = math.cos(z_rotation_rad) * box_wall.YMin - math.sin(z_rotation_rad) * box_wall.XMin - wall_width
base = FreeCAD.Vector(base_x, base_y, 1450)
axis = FreeCAD.Vector(1, 0, 0)
doorPlace = FreeCAD.Placement(base, FreeCAD.Rotation(axis, 90))
door = Arch.makeWindowPreset('Open 1-pane', width=1000, height=1000, h1=50, h2=50, h3=100, w1=200, w2=100, o1=0, o2=0, placement=doorPlace)
door.Placement = FreeCAD.Placement(FreeCAD.Vector(0,0,0),App.Rotation(FreeCAD.Vector(0,0,1),z_rotation))
door.Label = 'Bedroom_1_Window'
Arch.addComponents(door, wall)

baseline_start = FreeCAD.Vector(4315, 9595, 250)
baseline_end = FreeCAD.Vector(4315, 12105, 250)
baseline = Draft.makeLine(baseline_start, baseline_end)
wall = Arch.makeWall(baseline, length=None, width=100, height=3300, name='Steel_Wall_10_1')
new_structure.addObject(wall)

FreeCAD.ActiveDocument.recompute()
box_wall = wall.Base.Shape.BoundBox
wall_width = wall.Width.Value
door_start = 755
z_rotation =  90
z_rotation_rad = math.pi * z_rotation / 180
base_x = math.cos(z_rotation_rad) * box_wall.XMin + math.sin(z_rotation_rad) * box_wall.YMin + door_start
base_y = math.cos(z_rotation_rad) * box_wall.YMin - math.sin(z_rotation_rad) * box_wall.XMin - wall_width
base = FreeCAD.Vector(base_x, base_y, 1450)
axis = FreeCAD.Vector(1, 0, 0)
doorPlace = FreeCAD.Placement(base, FreeCAD.Rotation(axis, 90))
door = Arch.makeWindowPreset('Open 1-pane', width=1000, height=1000, h1=50, h2=50, h3=100, w1=200, w2=100, o1=0, o2=0, placement=doorPlace)
door.Placement = FreeCAD.Placement(FreeCAD.Vector(0,0,0),App.Rotation(FreeCAD.Vector(0,0,1),z_rotation))
door.Label = 'Kitchen_Window'
Arch.addComponents(door, wall)

baseline_start = FreeCAD.Vector(4315, 7515, 250)
baseline_end = FreeCAD.Vector(4315, 9595, 250)
baseline = Draft.makeLine(baseline_start, baseline_end)
wall = Arch.makeWall(baseline, length=None, width=100, height=2600, name='Steel_Wall_10_2')
new_structure.addObject(wall)

FreeCAD.ActiveDocument.recompute()
box_wall = wall.Base.Shape.BoundBox
wall_width = wall.Width.Value
door_start = 450
z_rotation =  90
z_rotation_rad = math.pi * z_rotation / 180
base_x = math.cos(z_rotation_rad) * box_wall.XMin + math.sin(z_rotation_rad) * box_wall.YMin + door_start
base_y = math.cos(z_rotation_rad) * box_wall.YMin - math.sin(z_rotation_rad) * box_wall.XMin - wall_width
base = FreeCAD.Vector(base_x, base_y, 250)
axis = FreeCAD.Vector(1, 0, 0)
doorPlace = FreeCAD.Placement(base, FreeCAD.Rotation(axis, 90))
door = Arch.makeWindowPreset('Glass door', width=830, height=2080, h1=100, h2=100, h3=100, w1=200, w2=100, o1=0, o2=0, placement=doorPlace)
door.Placement = FreeCAD.Placement(FreeCAD.Vector(0,0,0),App.Rotation(FreeCAD.Vector(0,0,1),z_rotation))
door.Label = 'Bedroom_2__Glass_Door'
Arch.addComponents(door, wall)

baseline_start = FreeCAD.Vector(4265, 7465, 250)
baseline_end = FreeCAD.Vector(4785, 7465, 250)
baseline = Draft.makeLine(baseline_start, baseline_end)
wall = Arch.makeWall(baseline, length=None, width=100, height=2600, name='Steel_Wall_11')
new_structure.addObject(wall)

baseline_start = FreeCAD.Vector(4735, 4165, 250)
baseline_end = FreeCAD.Vector(4735, 7415, 250)
baseline = Draft.makeLine(baseline_start, baseline_end)
wall = Arch.makeWall(baseline, length=None, width=100, height=2600, name='Steel_Wall_12')
new_structure.addObject(wall)

baseline_start = FreeCAD.Vector(4875, 395, 250)
baseline_end = FreeCAD.Vector(4875, 3755, 250)
baseline = Draft.makeLine(baseline_start, baseline_end)
wall = Arch.makeWall(baseline, length=None, width=100, height=2600, name='Steel_Wall_13')
new_structure.addObject(wall)

baseline_start = FreeCAD.Vector(215, 445, 250)
baseline_end = FreeCAD.Vector(930, 445, 250)
baseline = Draft.makeLine(baseline_start, baseline_end)
wall = Arch.makeWall(baseline, length=None, width=100, height=2600, name='Steel_Wall_14_1')
new_structure.addObject(wall)

baseline_start = FreeCAD.Vector(930, 445, 250)
baseline_end = FreeCAD.Vector(3460, 445, 250)
baseline = Draft.makeLine(baseline_start, baseline_end)
wall = Arch.makeWall(baseline, length=None, width=100, height=2830, name='Steel_Wall_14_2')
new_structure.addObject(wall)

FreeCAD.ActiveDocument.recompute()
box_wall = wall.Base.Shape.BoundBox
wall_width = wall.Width.Value
door_start = 0
z_rotation =  0
z_rotation_rad = math.pi * z_rotation / 180
base_x = math.cos(z_rotation_rad) * box_wall.XMin + math.sin(z_rotation_rad) * box_wall.YMin + door_start
base_y = math.cos(z_rotation_rad) * box_wall.YMin - math.sin(z_rotation_rad) * box_wall.XMin - wall_width
base = FreeCAD.Vector(base_x, base_y, 0)
axis = FreeCAD.Vector(1, 0, 0)
doorPlace = FreeCAD.Placement(base, FreeCAD.Rotation(axis, 90))
door = Arch.makeWindowPreset('Simple door', width=1000, height=2000, h1=100, h2=100, h3=100, w1=200, w2=100, o1=0, o2=0, placement=doorPlace)
door.Placement = FreeCAD.Placement(FreeCAD.Vector(0,0,0),App.Rotation(FreeCAD.Vector(0,0,1),z_rotation))
door.Label = 'Front_Door'
Arch.addComponents(door, wall)

FreeCAD.ActiveDocument.recompute()
box_wall = wall.Base.Shape.BoundBox
wall_width = wall.Width.Value
door_start = 1120
z_rotation =  0
z_rotation_rad = math.pi * z_rotation / 180
base_x = math.cos(z_rotation_rad) * box_wall.XMin + math.sin(z_rotation_rad) * box_wall.YMin + door_start
base_y = math.cos(z_rotation_rad) * box_wall.YMin - math.sin(z_rotation_rad) * box_wall.XMin - wall_width
base = FreeCAD.Vector(base_x, base_y, 1250)
axis = FreeCAD.Vector(1, 0, 0)
doorPlace = FreeCAD.Placement(base, FreeCAD.Rotation(axis, 90))
door = Arch.makeWindowPreset('Open 1-pane', width=1000, height=1200, h1=50, h2=50, h3=100, w1=200, w2=100, o1=0, o2=0, placement=doorPlace)
door.Placement = FreeCAD.Placement(FreeCAD.Vector(0,0,0),App.Rotation(FreeCAD.Vector(0,0,1),z_rotation))
door.Label = 'Bedroom_1_Window'
Arch.addComponents(door, wall)

FreeCAD.ActiveDocument.recompute()
box_wall = wall.Base.Shape.BoundBox
wall_width = wall.Width.Value
door_start = 0
z_rotation =  0
z_rotation_rad = math.pi * z_rotation / 180
base_x = math.cos(z_rotation_rad) * box_wall.XMin + math.sin(z_rotation_rad) * box_wall.YMin + door_start
base_y = math.cos(z_rotation_rad) * box_wall.YMin - math.sin(z_rotation_rad) * box_wall.XMin - wall_width
base = FreeCAD.Vector(base_x, base_y, 2000)
axis = FreeCAD.Vector(1, 0, 0)
doorPlace = FreeCAD.Placement(base, FreeCAD.Rotation(axis, 90))
door = Arch.makeWindowPreset('Open 1-pane', width=1000, height=450, h1=50, h2=50, h3=100, w1=200, w2=100, o1=0, o2=0, placement=doorPlace)
door.Placement = FreeCAD.Placement(FreeCAD.Vector(0,0,0),App.Rotation(FreeCAD.Vector(0,0,1),z_rotation))
door.Label = 'Corridor_Window'
Arch.addComponents(door, wall)

baseline_start = FreeCAD.Vector(3460, 445, 250)
baseline_end = FreeCAD.Vector(4825, 445, 250)
baseline = Draft.makeLine(baseline_start, baseline_end)
wall = Arch.makeWall(baseline, length=None, width=100, height=2600, name='Steel_Wall_14_3')
new_structure.addObject(wall)

baseline_start = FreeCAD.Vector(2000, 495, 250)
baseline_end = FreeCAD.Vector(2000, 4595, 250)
baseline = Draft.makeLine(baseline_start, baseline_end)
wall = Arch.makeWall(baseline, length=None, width=100, height=2600, name='Steel_Wall_Bed_1_1')
new_structure.addObject(wall)

FreeCAD.ActiveDocument.recompute()
box_wall = wall.Base.Shape.BoundBox
wall_width = wall.Width.Value
door_start = 3080
z_rotation =  90
z_rotation_rad = math.pi * z_rotation / 180
base_x = math.cos(z_rotation_rad) * box_wall.XMin + math.sin(z_rotation_rad) * box_wall.YMin + door_start
base_y = math.cos(z_rotation_rad) * box_wall.YMin - math.sin(z_rotation_rad) * box_wall.XMin - wall_width
base = FreeCAD.Vector(base_x, base_y, 250)
axis = FreeCAD.Vector(1, 0, 0)
doorPlace = FreeCAD.Placement(base, FreeCAD.Rotation(axis, 90))
door = Arch.makeWindowPreset('Simple door', width=1020, height=2080, h1=100, h2=100, h3=100, w1=200, w2=100, o1=0, o2=0, placement=doorPlace)
door.Placement = FreeCAD.Placement(FreeCAD.Vector(0,0,0),App.Rotation(FreeCAD.Vector(0,0,1),z_rotation))
door.Label = 'Bedroom_1_Door'
Arch.addComponents(door, wall)

baseline_start = FreeCAD.Vector(1515, 4645, 250)
baseline_end = FreeCAD.Vector(4685, 4645, 250)
baseline = Draft.makeLine(baseline_start, baseline_end)
wall = Arch.makeWall(baseline, length=None, width=100, height=2600, name='Steel_Wall_Bed_1_2')
new_structure.addObject(wall)

baseline_start = FreeCAD.Vector(1565, 4695, 250)
baseline_end = FreeCAD.Vector(1565, 9595, 250)
baseline = Draft.makeLine(baseline_start, baseline_end)
wall = Arch.makeWall(baseline, length=None, width=100, height=2600, name='Steel_Wall_Bed_2_1')
new_structure.addObject(wall)

FreeCAD.ActiveDocument.recompute()
box_wall = wall.Base.Shape.BoundBox
wall_width = wall.Width.Value
door_start = 3080
z_rotation =  90
z_rotation_rad = math.pi * z_rotation / 180
base_x = math.cos(z_rotation_rad) * box_wall.XMin + math.sin(z_rotation_rad) * box_wall.YMin + door_start
base_y = math.cos(z_rotation_rad) * box_wall.YMin - math.sin(z_rotation_rad) * box_wall.XMin - wall_width
base = FreeCAD.Vector(base_x, base_y, 250)
axis = FreeCAD.Vector(1, 0, 0)
doorPlace = FreeCAD.Placement(base, FreeCAD.Rotation(axis, 90))
door = Arch.makeWindowPreset('Simple door', width=1020, height=2080, h1=100, h2=100, h3=100, w1=200, w2=100, o1=0, o2=0, placement=doorPlace)
door.Placement = FreeCAD.Placement(FreeCAD.Vector(0,0,0),App.Rotation(FreeCAD.Vector(0,0,1),z_rotation))
door.Label = 'Bedroom_2_Door'
Arch.addComponents(door, wall)

baseline_start = FreeCAD.Vector(1615, 8845, 250)
baseline_end = FreeCAD.Vector(4265, 8845, 250)
baseline = Draft.makeLine(baseline_start, baseline_end)
wall = Arch.makeWall(baseline, length=None, width=100, height=2600, name='Steel_Wall_Bed_2_2')
new_structure.addObject(wall)

baseline_start = FreeCAD.Vector(215, 3525, 250)
baseline_end = FreeCAD.Vector(1950, 3525, 250)
baseline = Draft.makeLine(baseline_start, baseline_end)
wall = Arch.makeWall(baseline, length=None, width=100, height=2600, name='Steel_Wall_Corridor_1')
new_structure.addObject(wall)

FreeCAD.ActiveDocument.recompute()
box_wall = wall.Base.Shape.BoundBox
wall_width = wall.Width.Value
door_start = 100
z_rotation =  0
z_rotation_rad = math.pi * z_rotation / 180
base_x = math.cos(z_rotation_rad) * box_wall.XMin + math.sin(z_rotation_rad) * box_wall.YMin + door_start
base_y = math.cos(z_rotation_rad) * box_wall.YMin - math.sin(z_rotation_rad) * box_wall.XMin - wall_width
base = FreeCAD.Vector(base_x, base_y, 250)
axis = FreeCAD.Vector(1, 0, 0)
doorPlace = FreeCAD.Placement(base, FreeCAD.Rotation(axis, 90))
door = Arch.makeWindowPreset('Glass door', width=1020, height=2080, h1=100, h2=100, h3=100, w1=200, w2=100, o1=0, o2=0, placement=doorPlace)
door.Placement = FreeCAD.Placement(FreeCAD.Vector(0,0,0),App.Rotation(FreeCAD.Vector(0,0,1),z_rotation))
door.Label = 'Corridor_Door'
Arch.addComponents(door, wall)

baseline_start = FreeCAD.Vector(215, 9545, 250)
baseline_end = FreeCAD.Vector(1515, 9545, 250)
baseline = Draft.makeLine(baseline_start, baseline_end)
wall = Arch.makeWall(baseline, length=None, width=100, height=3300, name='Steel_Wall_Corridor_2')
new_structure.addObject(wall)

FreeCAD.ActiveDocument.recompute()
box_wall = wall.Base.Shape.BoundBox
wall_width = wall.Width.Value
door_start = 0
z_rotation =  0
z_rotation_rad = math.pi * z_rotation / 180
base_x = math.cos(z_rotation_rad) * box_wall.XMin + math.sin(z_rotation_rad) * box_wall.YMin + door_start
base_y = math.cos(z_rotation_rad) * box_wall.YMin - math.sin(z_rotation_rad) * box_wall.XMin - wall_width
base = FreeCAD.Vector(base_x, base_y, 250)
axis = FreeCAD.Vector(1, 0, 0)
doorPlace = FreeCAD.Placement(base, FreeCAD.Rotation(axis, 90))
door = Arch.makeWindowPreset('Simple door', width=1020, height=2080, h1=100, h2=100, h3=100, w1=200, w2=100, o1=0, o2=0, placement=doorPlace)
door.Placement = FreeCAD.Placement(FreeCAD.Vector(0,0,0),App.Rotation(FreeCAD.Vector(0,0,1),z_rotation))
door.Label = 'Living_Room_Door'
Arch.addComponents(door, wall)

baseline_start = FreeCAD.Vector(4125, 12205, 250)
baseline_end = FreeCAD.Vector(4125, 14705, 250)
baseline = Draft.makeLine(baseline_start, baseline_end)
wall = Arch.makeWall(baseline, length=None, width=100, height=3300, name='Steel_Wall_Bath_1')
new_structure.addObject(wall)

baseline_start = FreeCAD.Vector(4075, 14755, 250)
baseline_end = FreeCAD.Vector(6075, 14755, 250)
baseline = Draft.makeLine(baseline_start, baseline_end)
wall = Arch.makeWall(baseline, length=None, width=100, height=3300, name='Steel_Wall_Bath_2')
new_structure.addObject(wall)

FreeCAD.ActiveDocument.recompute()
box_wall = wall.Base.Shape.BoundBox
wall_width = wall.Width.Value
door_start = 100
z_rotation =  0
z_rotation_rad = math.pi * z_rotation / 180
base_x = math.cos(z_rotation_rad) * box_wall.XMin + math.sin(z_rotation_rad) * box_wall.YMin + door_start
base_y = math.cos(z_rotation_rad) * box_wall.YMin - math.sin(z_rotation_rad) * box_wall.XMin - wall_width
base = FreeCAD.Vector(base_x, base_y, 250)
axis = FreeCAD.Vector(1, 0, 0)
doorPlace = FreeCAD.Placement(base, FreeCAD.Rotation(axis, 90))
door = Arch.makeWindowPreset('Simple door', width=1020, height=2080, h1=100, h2=100, h3=100, w1=200, w2=100, o1=0, o2=0, placement=doorPlace)
door.Placement = FreeCAD.Placement(FreeCAD.Vector(0,0,0),App.Rotation(FreeCAD.Vector(0,0,1),z_rotation))
door.Label = 'Bathroom_Door'
Arch.addComponents(door, wall)

baseline_start = FreeCAD.Vector(4075, 12155, 2850)
baseline_end = FreeCAD.Vector(4365, 12155, 2850)
baseline = Draft.makeLine(baseline_start, baseline_end)
wall = Arch.makeWall(baseline, length=None, width=100, height=700, name='Steel_Wall_Bath_3')
new_structure.addObject(wall)

baseline_start = FreeCAD.Vector(1515, 9545, 2850)
baseline_end = FreeCAD.Vector(4365, 9545, 2850)
baseline = Draft.makeLine(baseline_start, baseline_end)
wall = Arch.makeWall(baseline, length=None, width=100, height=700, name='Steel_Wall_Kitchen')
new_structure.addObject(wall)

FreeCAD.ActiveDocument.recompute()
object = document.getObjectsByLabel('Pillar_1')[0]
object_bound_box = object.Shape.BoundBox
x_min = object_bound_box.XMin
x_max = object_bound_box.XMax
x_mid = (x_min + x_max)/2
y_min = object_bound_box.YMin
y_max = object_bound_box.YMax
y_mid = (y_min + y_max)/2
point1 = FreeCAD.Vector(x_min, y_min, 0)
point2 = FreeCAD.Vector(x_max, y_min, 0)
point3 = FreeCAD.Vector(x_mid, y_min - 300, 0)
dimension = Draft.make_linear_dimension(point1, point2, point3)
dimension.Label = 'Dim_South_Pillar_1'
existing_dimensions.addObject(dimension)
dimension_view = dimension.ViewObject
dimension_view.ArrowSize = 20
dimension_view.ArrowType = 'Arrow'
dimension_view.FontSize = 80
dimension_view.ExtLines = 300
dimension_view.ExtOvershoot = 100
dimension_view.ShowUnit = False
dimension_view.Decimals = 0

FreeCAD.ActiveDocument.recompute()
object = document.getObjectsByLabel('Pillar_1')[0]
object_bound_box = object.Shape.BoundBox
x_min = object_bound_box.XMin
x_max = object_bound_box.XMax
x_mid = (x_min + x_max)/2
y_min = object_bound_box.YMin
y_max = object_bound_box.YMax
y_mid = (y_min + y_max)/2
point1 = FreeCAD.Vector(x_min, y_min, 0)
point2 = FreeCAD.Vector(x_min, y_max, 0)
point3 = FreeCAD.Vector(x_min - 300, y_mid, 0)
dimension = Draft.make_linear_dimension(point1, point2, point3)
dimension.Label = 'Dim_West_Pillar_1'
existing_dimensions.addObject(dimension)
dimension_view = dimension.ViewObject
dimension_view.ArrowSize = 20
dimension_view.ArrowType = 'Arrow'
dimension_view.FontSize = 80
dimension_view.ExtLines = 300
dimension_view.ExtOvershoot = 100
dimension_view.ShowUnit = False
dimension_view.Decimals = 0

FreeCAD.ActiveDocument.recompute()
object = document.getObjectsByLabel('Pillar_2')[0]
object_bound_box = object.Shape.BoundBox
x_min = object_bound_box.XMin
x_max = object_bound_box.XMax
x_mid = (x_min + x_max)/2
y_min = object_bound_box.YMin
y_max = object_bound_box.YMax
y_mid = (y_min + y_max)/2
point1 = FreeCAD.Vector(x_min, y_min, 0)
point2 = FreeCAD.Vector(x_min, y_max, 0)
point3 = FreeCAD.Vector(x_min - 300, y_mid, 0)
dimension = Draft.make_linear_dimension(point1, point2, point3)
dimension.Label = 'Dim_West_Pillar_2'
existing_dimensions.addObject(dimension)
dimension_view = dimension.ViewObject
dimension_view.ArrowSize = 20
dimension_view.ArrowType = 'Arrow'
dimension_view.FontSize = 80
dimension_view.ExtLines = 300
dimension_view.ExtOvershoot = 100
dimension_view.ShowUnit = False
dimension_view.Decimals = 0

FreeCAD.ActiveDocument.recompute()
object = document.getObjectsByLabel('Pillar_3')[0]
object_bound_box = object.Shape.BoundBox
x_min = object_bound_box.XMin
x_max = object_bound_box.XMax
x_mid = (x_min + x_max)/2
y_min = object_bound_box.YMin
y_max = object_bound_box.YMax
y_mid = (y_min + y_max)/2
point1 = FreeCAD.Vector(x_min, y_min, 0)
point2 = FreeCAD.Vector(x_min, y_max, 0)
point3 = FreeCAD.Vector(x_min - 300, y_mid, 0)
dimension = Draft.make_linear_dimension(point1, point2, point3)
dimension.Label = 'Dim_West_Pillar_3'
existing_dimensions.addObject(dimension)
dimension_view = dimension.ViewObject
dimension_view.ArrowSize = 20
dimension_view.ArrowType = 'Arrow'
dimension_view.FontSize = 80
dimension_view.ExtLines = 300
dimension_view.ExtOvershoot = 100
dimension_view.ShowUnit = False
dimension_view.Decimals = 0

FreeCAD.ActiveDocument.recompute()
object = document.getObjectsByLabel('Pillar_4')[0]
object_bound_box = object.Shape.BoundBox
x_min = object_bound_box.XMin
x_max = object_bound_box.XMax
x_mid = (x_min + x_max)/2
y_min = object_bound_box.YMin
y_max = object_bound_box.YMax
y_mid = (y_min + y_max)/2
point1 = FreeCAD.Vector(x_min, y_min, 0)
point2 = FreeCAD.Vector(x_min, y_max, 0)
point3 = FreeCAD.Vector(x_min - 300, y_mid, 0)
dimension = Draft.make_linear_dimension(point1, point2, point3)
dimension.Label = 'Dim_West_Pillar_4'
existing_dimensions.addObject(dimension)
dimension_view = dimension.ViewObject
dimension_view.ArrowSize = 20
dimension_view.ArrowType = 'Arrow'
dimension_view.FontSize = 80
dimension_view.ExtLines = 300
dimension_view.ExtOvershoot = 100
dimension_view.ShowUnit = False
dimension_view.Decimals = 0

FreeCAD.ActiveDocument.recompute()
object = document.getObjectsByLabel('Pillar_5')[0]
object_bound_box = object.Shape.BoundBox
x_min = object_bound_box.XMin
x_max = object_bound_box.XMax
x_mid = (x_min + x_max)/2
y_min = object_bound_box.YMin
y_max = object_bound_box.YMax
y_mid = (y_min + y_max)/2
point1 = FreeCAD.Vector(x_min, y_min, 0)
point2 = FreeCAD.Vector(x_min, y_max, 0)
point3 = FreeCAD.Vector(x_min - 300, y_mid, 0)
dimension = Draft.make_linear_dimension(point1, point2, point3)
dimension.Label = 'Dim_West_Pillar_5'
existing_dimensions.addObject(dimension)
dimension_view = dimension.ViewObject
dimension_view.ArrowSize = 20
dimension_view.ArrowType = 'Arrow'
dimension_view.FontSize = 80
dimension_view.ExtLines = 300
dimension_view.ExtOvershoot = 100
dimension_view.ShowUnit = False
dimension_view.Decimals = 0

FreeCAD.ActiveDocument.recompute()
object = document.getObjectsByLabel('Wall_1')[0]
object_bound_box = object.Shape.BoundBox
x_min = object_bound_box.XMin
x_max = object_bound_box.XMax
x_mid = (x_min + x_max)/2
y_min = object_bound_box.YMin
y_max = object_bound_box.YMax
y_mid = (y_min + y_max)/2
point1 = FreeCAD.Vector(x_min, y_min, 0)
point2 = FreeCAD.Vector(x_min, y_max, 0)
point3 = FreeCAD.Vector(x_min - 300, y_mid, 0)
dimension = Draft.make_linear_dimension(point1, point2, point3)
dimension.Label = 'Dim_West_Wall_1'
existing_dimensions.addObject(dimension)
dimension_view = dimension.ViewObject
dimension_view.ArrowSize = 20
dimension_view.ArrowType = 'Arrow'
dimension_view.FontSize = 80
dimension_view.ExtLines = 300
dimension_view.ExtOvershoot = 100
dimension_view.ShowUnit = False
dimension_view.Decimals = 0

FreeCAD.ActiveDocument.recompute()
object = document.getObjectsByLabel('Wall_2')[0]
object_bound_box = object.Shape.BoundBox
x_min = object_bound_box.XMin
x_max = object_bound_box.XMax
x_mid = (x_min + x_max)/2
y_min = object_bound_box.YMin
y_max = object_bound_box.YMax
y_mid = (y_min + y_max)/2
point1 = FreeCAD.Vector(x_min, y_min, 0)
point2 = FreeCAD.Vector(x_min, y_max, 0)
point3 = FreeCAD.Vector(x_min - 300, y_mid, 0)
dimension = Draft.make_linear_dimension(point1, point2, point3)
dimension.Label = 'Dim_West_Wall_2'
existing_dimensions.addObject(dimension)
dimension_view = dimension.ViewObject
dimension_view.ArrowSize = 20
dimension_view.ArrowType = 'Arrow'
dimension_view.FontSize = 80
dimension_view.ExtLines = 300
dimension_view.ExtOvershoot = 100
dimension_view.ShowUnit = False
dimension_view.Decimals = 0

FreeCAD.ActiveDocument.recompute()
object = document.getObjectsByLabel('Wall_3')[0]
object_bound_box = object.Shape.BoundBox
x_min = object_bound_box.XMin
x_max = object_bound_box.XMax
x_mid = (x_min + x_max)/2
y_min = object_bound_box.YMin
y_max = object_bound_box.YMax
y_mid = (y_min + y_max)/2
point1 = FreeCAD.Vector(x_min, y_min, 0)
point2 = FreeCAD.Vector(x_min, y_max, 0)
point3 = FreeCAD.Vector(x_min - 300, y_mid, 0)
dimension = Draft.make_linear_dimension(point1, point2, point3)
dimension.Label = 'Dim_West_Wall_3'
existing_dimensions.addObject(dimension)
dimension_view = dimension.ViewObject
dimension_view.ArrowSize = 20
dimension_view.ArrowType = 'Arrow'
dimension_view.FontSize = 80
dimension_view.ExtLines = 300
dimension_view.ExtOvershoot = 100
dimension_view.ShowUnit = False
dimension_view.Decimals = 0

FreeCAD.ActiveDocument.recompute()
object = document.getObjectsByLabel('Wall_4')[0]
object_bound_box = object.Shape.BoundBox
x_min = object_bound_box.XMin
x_max = object_bound_box.XMax
x_mid = (x_min + x_max)/2
y_min = object_bound_box.YMin
y_max = object_bound_box.YMax
y_mid = (y_min + y_max)/2
point1 = FreeCAD.Vector(x_min, y_min, 0)
point2 = FreeCAD.Vector(x_min, y_max, 0)
point3 = FreeCAD.Vector(x_min - 300, y_mid, 0)
dimension = Draft.make_linear_dimension(point1, point2, point3)
dimension.Label = 'Dim_West_Wall_4'
existing_dimensions.addObject(dimension)
dimension_view = dimension.ViewObject
dimension_view.ArrowSize = 20
dimension_view.ArrowType = 'Arrow'
dimension_view.FontSize = 80
dimension_view.ExtLines = 300
dimension_view.ExtOvershoot = 100
dimension_view.ShowUnit = False
dimension_view.Decimals = 0

FreeCAD.ActiveDocument.recompute()
object1 = document.getObjectsByLabel('Pillar_5')[0]
object2 = document.getObjectsByLabel('Wall_6')[0]
object1_bound_box = object1.Shape.BoundBox
object2_bound_box = object2.Shape.BoundBox
point_1_y = object1_bound_box.YMax
point_1_x = (object1_bound_box.XMin + object1_bound_box.XMax)/2
point1 = FreeCAD.Vector(point_1_x, point_1_y, 0)
point_2_y = object2_bound_box.YMin
point_2_x = point_1_x
point2 = FreeCAD.Vector(point_2_x, point_2_y, 0)
y_mid = (point_1_y + point_2_y)/2
point3 = FreeCAD.Vector(point_1_x + -300, y_mid, 0)
dimension = Draft.make_linear_dimension(point1, point2, point3)
dimension.Label = 'Dim_North-South_Pillar_5_End_Wall_6_Start'
existing_dimensions.addObject(dimension)
dimension_view = dimension.ViewObject
dimension_view.ArrowSize = 20
dimension_view.ArrowType = 'Arrow'
dimension_view.FontSize = 80
dimension_view.ExtLines = 300
dimension_view.ExtOvershoot = 100
dimension_view.ShowUnit = False
dimension_view.Decimals = 0

FreeCAD.ActiveDocument.recompute()
object = document.getObjectsByLabel('Pillar_6')[0]
object_bound_box = object.Shape.BoundBox
x_min = object_bound_box.XMin
x_max = object_bound_box.XMax
x_mid = (x_min + x_max)/2
y_min = object_bound_box.YMin
y_max = object_bound_box.YMax
y_mid = (y_min + y_max)/2
point1 = FreeCAD.Vector(x_min, y_max, 0)
point2 = FreeCAD.Vector(x_max, y_max, 0)
point3 = FreeCAD.Vector(x_mid, y_max + 300, 0)
dimension = Draft.make_linear_dimension(point1, point2, point3)
dimension.Label = 'Dim_North_Pillar_6'
existing_dimensions.addObject(dimension)
dimension_view = dimension.ViewObject
dimension_view.ArrowSize = 20
dimension_view.ArrowType = 'Arrow'
dimension_view.FontSize = 80
dimension_view.ExtLines = 300
dimension_view.ExtOvershoot = 100
dimension_view.ShowUnit = False
dimension_view.Decimals = 0

FreeCAD.ActiveDocument.recompute()
object = document.getObjectsByLabel('Wall_6')[0]
object_bound_box = object.Shape.BoundBox
x_min = object_bound_box.XMin
x_max = object_bound_box.XMax
x_mid = (x_min + x_max)/2
y_min = object_bound_box.YMin
y_max = object_bound_box.YMax
y_mid = (y_min + y_max)/2
point1 = FreeCAD.Vector(x_min, y_max, 0)
point2 = FreeCAD.Vector(x_max, y_max, 0)
point3 = FreeCAD.Vector(x_mid, y_max + 300, 0)
dimension = Draft.make_linear_dimension(point1, point2, point3)
dimension.Label = 'Dim_North_Wall_6'
existing_dimensions.addObject(dimension)
dimension_view = dimension.ViewObject
dimension_view.ArrowSize = 20
dimension_view.ArrowType = 'Arrow'
dimension_view.FontSize = 80
dimension_view.ExtLines = 300
dimension_view.ExtOvershoot = 100
dimension_view.ShowUnit = False
dimension_view.Decimals = 0

FreeCAD.ActiveDocument.recompute()
object = document.getObjectsByLabel('Wall_7')[0]
object_bound_box = object.Shape.BoundBox
x_min = object_bound_box.XMin
x_max = object_bound_box.XMax
x_mid = (x_min + x_max)/2
y_min = object_bound_box.YMin
y_max = object_bound_box.YMax
y_mid = (y_min + y_max)/2
point1 = FreeCAD.Vector(x_min, y_max, 0)
point2 = FreeCAD.Vector(x_max, y_max, 0)
point3 = FreeCAD.Vector(x_mid, y_max + 300, 0)
dimension = Draft.make_linear_dimension(point1, point2, point3)
dimension.Label = 'Dim_North_Wall_7'
existing_dimensions.addObject(dimension)
dimension_view = dimension.ViewObject
dimension_view.ArrowSize = 20
dimension_view.ArrowType = 'Arrow'
dimension_view.FontSize = 80
dimension_view.ExtLines = 300
dimension_view.ExtOvershoot = 100
dimension_view.ShowUnit = False
dimension_view.Decimals = 0

FreeCAD.ActiveDocument.recompute()
object = document.getObjectsByLabel('Pillar_7')[0]
object_bound_box = object.Shape.BoundBox
x_min = object_bound_box.XMin
x_max = object_bound_box.XMax
x_mid = (x_min + x_max)/2
y_min = object_bound_box.YMin
y_max = object_bound_box.YMax
y_mid = (y_min + y_max)/2
point1 = FreeCAD.Vector(x_min, y_max, 0)
point2 = FreeCAD.Vector(x_max, y_max, 0)
point3 = FreeCAD.Vector(x_mid, y_max + 300, 0)
dimension = Draft.make_linear_dimension(point1, point2, point3)
dimension.Label = 'Dim_North_Pillar_7'
existing_dimensions.addObject(dimension)
dimension_view = dimension.ViewObject
dimension_view.ArrowSize = 20
dimension_view.ArrowType = 'Arrow'
dimension_view.FontSize = 80
dimension_view.ExtLines = 300
dimension_view.ExtOvershoot = 100
dimension_view.ShowUnit = False
dimension_view.Decimals = 0

FreeCAD.ActiveDocument.recompute()
object = document.getObjectsByLabel('Pillar_7')[0]
object_bound_box = object.Shape.BoundBox
x_min = object_bound_box.XMin
x_max = object_bound_box.XMax
x_mid = (x_min + x_max)/2
y_min = object_bound_box.YMin
y_max = object_bound_box.YMax
y_mid = (y_min + y_max)/2
point1 = FreeCAD.Vector(x_min, y_min, 0)
point2 = FreeCAD.Vector(x_min, y_max, 0)
point3 = FreeCAD.Vector(x_min - 300, y_mid, 0)
dimension = Draft.make_linear_dimension(point1, point2, point3)
dimension.Label = 'Dim_West_Pillar_7'
existing_dimensions.addObject(dimension)
dimension_view = dimension.ViewObject
dimension_view.ArrowSize = 20
dimension_view.ArrowType = 'Arrow'
dimension_view.FontSize = 80
dimension_view.ExtLines = 300
dimension_view.ExtOvershoot = 100
dimension_view.ShowUnit = False
dimension_view.Decimals = 0

FreeCAD.ActiveDocument.recompute()
object = document.getObjectsByLabel('Pillar_8')[0]
object_bound_box = object.Shape.BoundBox
x_min = object_bound_box.XMin
x_max = object_bound_box.XMax
x_mid = (x_min + x_max)/2
y_min = object_bound_box.YMin
y_max = object_bound_box.YMax
y_mid = (y_min + y_max)/2
point1 = FreeCAD.Vector(x_min, y_max, 0)
point2 = FreeCAD.Vector(x_max, y_max, 0)
point3 = FreeCAD.Vector(x_mid, y_max + 300, 0)
dimension = Draft.make_linear_dimension(point1, point2, point3)
dimension.Label = 'Dim_North_Pillar_8'
existing_dimensions.addObject(dimension)
dimension_view = dimension.ViewObject
dimension_view.ArrowSize = 20
dimension_view.ArrowType = 'Arrow'
dimension_view.FontSize = 80
dimension_view.ExtLines = 300
dimension_view.ExtOvershoot = 100
dimension_view.ShowUnit = False
dimension_view.Decimals = 0

FreeCAD.ActiveDocument.recompute()
object = document.getObjectsByLabel('Pillar_8')[0]
object_bound_box = object.Shape.BoundBox
x_min = object_bound_box.XMin
x_max = object_bound_box.XMax
x_mid = (x_min + x_max)/2
y_min = object_bound_box.YMin
y_max = object_bound_box.YMax
y_mid = (y_min + y_max)/2
point1 = FreeCAD.Vector(x_min, y_min, 0)
point2 = FreeCAD.Vector(x_min, y_max, 0)
point3 = FreeCAD.Vector(x_min - 300, y_mid, 0)
dimension = Draft.make_linear_dimension(point1, point2, point3)
dimension.Label = 'Dim_West_Pillar_8'
existing_dimensions.addObject(dimension)
dimension_view = dimension.ViewObject
dimension_view.ArrowSize = 20
dimension_view.ArrowType = 'Arrow'
dimension_view.FontSize = 80
dimension_view.ExtLines = 300
dimension_view.ExtOvershoot = 100
dimension_view.ShowUnit = False
dimension_view.Decimals = 0

FreeCAD.ActiveDocument.recompute()
object = document.getObjectsByLabel('Pillar_9')[0]
object_bound_box = object.Shape.BoundBox
x_min = object_bound_box.XMin
x_max = object_bound_box.XMax
x_mid = (x_min + x_max)/2
y_min = object_bound_box.YMin
y_max = object_bound_box.YMax
y_mid = (y_min + y_max)/2
point1 = FreeCAD.Vector(x_max, y_min, 0)
point2 = FreeCAD.Vector(x_max, y_max, 0)
point3 = FreeCAD.Vector(x_max + 300, y_mid, 0)
dimension = Draft.make_linear_dimension(point1, point2, point3)
dimension.Label = 'Dim_East_Pillar_9'
existing_dimensions.addObject(dimension)
dimension_view = dimension.ViewObject
dimension_view.ArrowSize = 20
dimension_view.ArrowType = 'Arrow'
dimension_view.FontSize = 80
dimension_view.ExtLines = 300
dimension_view.ExtOvershoot = 100
dimension_view.ShowUnit = False
dimension_view.Decimals = 0

FreeCAD.ActiveDocument.recompute()
object = document.getObjectsByLabel('Pillar_10')[0]
object_bound_box = object.Shape.BoundBox
x_min = object_bound_box.XMin
x_max = object_bound_box.XMax
x_mid = (x_min + x_max)/2
y_min = object_bound_box.YMin
y_max = object_bound_box.YMax
y_mid = (y_min + y_max)/2
point1 = FreeCAD.Vector(x_max, y_min, 0)
point2 = FreeCAD.Vector(x_max, y_max, 0)
point3 = FreeCAD.Vector(x_max + 300, y_mid, 0)
dimension = Draft.make_linear_dimension(point1, point2, point3)
dimension.Label = 'Dim_East_Pillar_10'
existing_dimensions.addObject(dimension)
dimension_view = dimension.ViewObject
dimension_view.ArrowSize = 20
dimension_view.ArrowType = 'Arrow'
dimension_view.FontSize = 80
dimension_view.ExtLines = 300
dimension_view.ExtOvershoot = 100
dimension_view.ShowUnit = False
dimension_view.Decimals = 0

FreeCAD.ActiveDocument.recompute()
object = document.getObjectsByLabel('Pillar_10')[0]
object_bound_box = object.Shape.BoundBox
x_min = object_bound_box.XMin
x_max = object_bound_box.XMax
x_mid = (x_min + x_max)/2
y_min = object_bound_box.YMin
y_max = object_bound_box.YMax
y_mid = (y_min + y_max)/2
point1 = FreeCAD.Vector(x_min, y_min, 0)
point2 = FreeCAD.Vector(x_max, y_min, 0)
point3 = FreeCAD.Vector(x_mid, y_min - 300, 0)
dimension = Draft.make_linear_dimension(point1, point2, point3)
dimension.Label = 'Dim_South_Pillar_10'
existing_dimensions.addObject(dimension)
dimension_view = dimension.ViewObject
dimension_view.ArrowSize = 20
dimension_view.ArrowType = 'Arrow'
dimension_view.FontSize = 80
dimension_view.ExtLines = 300
dimension_view.ExtOvershoot = 100
dimension_view.ShowUnit = False
dimension_view.Decimals = 0

FreeCAD.ActiveDocument.recompute()
object1 = document.getObjectsByLabel('Wall_7')[0]
object2 = document.getObjectsByLabel('Wall_9')[0]
object1_bound_box = object1.Shape.BoundBox
object2_bound_box = object2.Shape.BoundBox
point_1_y = object1_bound_box.YMin
point_1_x = (object1_bound_box.XMin + object1_bound_box.XMax)/2
point1 = FreeCAD.Vector(point_1_x, point_1_y, 0)
point_2_y = object2_bound_box.YMax
point_2_x = point_1_x
point2 = FreeCAD.Vector(point_2_x, point_2_y, 0)
y_mid = (point_1_y + point_2_y)/2
point3 = FreeCAD.Vector(point_1_x + 2200, y_mid, 0)
dimension = Draft.make_linear_dimension(point1, point2, point3)
dimension.Label = 'Dim_North-South_Wall_7_Start_Wall_9_End'
existing_dimensions.addObject(dimension)
dimension_view = dimension.ViewObject
dimension_view.ArrowSize = 20
dimension_view.ArrowType = 'Arrow'
dimension_view.FontSize = 80
dimension_view.ExtLines = 300
dimension_view.ExtOvershoot = 100
dimension_view.ShowUnit = False
dimension_view.Decimals = 0

FreeCAD.ActiveDocument.recompute()
object1 = document.getObjectsByLabel('Wall_10')[0]
object2 = document.getObjectsByLabel('Wall_9')[0]
object1_bound_box = object1.Shape.BoundBox
object2_bound_box = object2.Shape.BoundBox
point_1_x = object1_bound_box.XMin
point_1_y = (object1_bound_box.YMin + object1_bound_box.YMax)/2
point1 = FreeCAD.Vector(point_1_x, point_1_y, 0)
point_2_x = object2_bound_box.XMax
point_2_y = point_1_y
point2 = FreeCAD.Vector(point_2_x, point_2_y, 0)
x_mid = (point_1_x + point_2_x)/2
point3 = FreeCAD.Vector(x_mid, point_1_y + 2500, 0)
dimension = Draft.make_linear_dimension(point1, point2, point3)
dimension.Label = 'Dim_East-West_Wall_10_Start_Wall_9_End'
existing_dimensions.addObject(dimension)
dimension_view = dimension.ViewObject
dimension_view.ArrowSize = 20
dimension_view.ArrowType = 'Arrow'
dimension_view.FontSize = 80
dimension_view.ExtLines = 300
dimension_view.ExtOvershoot = 100
dimension_view.ShowUnit = False
dimension_view.Decimals = 0

FreeCAD.ActiveDocument.recompute()
object = document.getObjectsByLabel('Wall_10')[0]
object_bound_box = object.Shape.BoundBox
x_min = object_bound_box.XMin
x_max = object_bound_box.XMax
x_mid = (x_min + x_max)/2
y_min = object_bound_box.YMin
y_max = object_bound_box.YMax
y_mid = (y_min + y_max)/2
point1 = FreeCAD.Vector(x_max, y_min, 0)
point2 = FreeCAD.Vector(x_max, y_max, 0)
point3 = FreeCAD.Vector(x_max + 300, y_mid, 0)
dimension = Draft.make_linear_dimension(point1, point2, point3)
dimension.Label = 'Dim_East_Wall_10'
existing_dimensions.addObject(dimension)
dimension_view = dimension.ViewObject
dimension_view.ArrowSize = 20
dimension_view.ArrowType = 'Arrow'
dimension_view.FontSize = 80
dimension_view.ExtLines = 300
dimension_view.ExtOvershoot = 100
dimension_view.ShowUnit = False
dimension_view.Decimals = 0

FreeCAD.ActiveDocument.recompute()
object = document.getObjectsByLabel('Wall_13')[0]
object_bound_box = object.Shape.BoundBox
x_min = object_bound_box.XMin
x_max = object_bound_box.XMax
x_mid = (x_min + x_max)/2
y_min = object_bound_box.YMin
y_max = object_bound_box.YMax
y_mid = (y_min + y_max)/2
point1 = FreeCAD.Vector(x_max, y_min, 0)
point2 = FreeCAD.Vector(x_max, y_max, 0)
point3 = FreeCAD.Vector(x_max + 300, y_mid, 0)
dimension = Draft.make_linear_dimension(point1, point2, point3)
dimension.Label = 'Dim_East_Wall_13'
existing_dimensions.addObject(dimension)
dimension_view = dimension.ViewObject
dimension_view.ArrowSize = 20
dimension_view.ArrowType = 'Arrow'
dimension_view.FontSize = 80
dimension_view.ExtLines = 300
dimension_view.ExtOvershoot = 100
dimension_view.ShowUnit = False
dimension_view.Decimals = 0

FreeCAD.ActiveDocument.recompute()
object1 = document.getObjectsByLabel('Wall_10')[0]
object2 = document.getObjectsByLabel('Wall_12')[0]
object1_bound_box = object1.Shape.BoundBox
object2_bound_box = object2.Shape.BoundBox
point_1_x = object1_bound_box.XMin
point_1_y = (object1_bound_box.YMin + object1_bound_box.YMax)/2
point1 = FreeCAD.Vector(point_1_x, point_1_y, 0)
point_2_x = object2_bound_box.XMin
point_2_y = point_1_y
point2 = FreeCAD.Vector(point_2_x, point_2_y, 0)
x_mid = (point_1_x + point_2_x)/2
point3 = FreeCAD.Vector(x_mid, point_1_y + -2500, 0)
dimension = Draft.make_linear_dimension(point1, point2, point3)
dimension.Label = 'Dim_East-West_Wall_10_Start_Wall_12_Start'
existing_dimensions.addObject(dimension)
dimension_view = dimension.ViewObject
dimension_view.ArrowSize = 20
dimension_view.ArrowType = 'Arrow'
dimension_view.FontSize = 80
dimension_view.ExtLines = 300
dimension_view.ExtOvershoot = 100
dimension_view.ShowUnit = False
dimension_view.Decimals = 0

FreeCAD.ActiveDocument.recompute()
object1 = document.getObjectsByLabel('Wall_11')[0]
object2 = document.getObjectsByLabel('Pillar_9')[0]
object1_bound_box = object1.Shape.BoundBox
object2_bound_box = object2.Shape.BoundBox
point_1_y = object1_bound_box.YMin
point_1_x = (object1_bound_box.XMin + object1_bound_box.XMax)/2
point1 = FreeCAD.Vector(point_1_x, point_1_y, 0)
point_2_y = object2_bound_box.YMax
point_2_x = point_1_x
point2 = FreeCAD.Vector(point_2_x, point_2_y, 0)
y_mid = (point_1_y + point_2_y)/2
point3 = FreeCAD.Vector(point_1_x + 500, y_mid, 0)
dimension = Draft.make_linear_dimension(point1, point2, point3)
dimension.Label = 'Dim_North-South_Wall_11_Start_Pillar_9_End'
existing_dimensions.addObject(dimension)
dimension_view = dimension.ViewObject
dimension_view.ArrowSize = 20
dimension_view.ArrowType = 'Arrow'
dimension_view.FontSize = 80
dimension_view.ExtLines = 300
dimension_view.ExtOvershoot = 100
dimension_view.ShowUnit = False
dimension_view.Decimals = 0

FreeCAD.ActiveDocument.recompute()
object1 = document.getObjectsByLabel('Wall_1')[0]
object2 = document.getObjectsByLabel('Wall_13')[0]
object1_bound_box = object1.Shape.BoundBox
object2_bound_box = object2.Shape.BoundBox
point_1_x = object1_bound_box.XMax
point_1_y = (object1_bound_box.YMin + object1_bound_box.YMax)/2
point1 = FreeCAD.Vector(point_1_x, point_1_y, 0)
point_2_x = object2_bound_box.XMin
point_2_y = point_1_y
point2 = FreeCAD.Vector(point_2_x, point_2_y, 0)
x_mid = (point_1_x + point_2_x)/2
point3 = FreeCAD.Vector(x_mid, point_1_y + 0, 0)
dimension = Draft.make_linear_dimension(point1, point2, point3)
dimension.Label = 'Dim_East-West_Wall_1_End_Wall_13_Start'
existing_dimensions.addObject(dimension)
dimension_view = dimension.ViewObject
dimension_view.ArrowSize = 20
dimension_view.ArrowType = 'Arrow'
dimension_view.FontSize = 80
dimension_view.ExtLines = 300
dimension_view.ExtOvershoot = 100
dimension_view.ShowUnit = False
dimension_view.Decimals = 0

FreeCAD.ActiveDocument.recompute()
object1 = document.getObjectsByLabel('Wall_2')[0]
object2 = document.getObjectsByLabel('Wall_12')[0]
object1_bound_box = object1.Shape.BoundBox
object2_bound_box = object2.Shape.BoundBox
point_1_x = object1_bound_box.XMax
point_1_y = (object1_bound_box.YMin + object1_bound_box.YMax)/2
point1 = FreeCAD.Vector(point_1_x, point_1_y, 0)
point_2_x = object2_bound_box.XMin
point_2_y = point_1_y
point2 = FreeCAD.Vector(point_2_x, point_2_y, 0)
x_mid = (point_1_x + point_2_x)/2
point3 = FreeCAD.Vector(x_mid, point_1_y + 0, 0)
dimension = Draft.make_linear_dimension(point1, point2, point3)
dimension.Label = 'Dim_East-West_Wall_2_End_Wall_12_Start'
existing_dimensions.addObject(dimension)
dimension_view = dimension.ViewObject
dimension_view.ArrowSize = 20
dimension_view.ArrowType = 'Arrow'
dimension_view.FontSize = 80
dimension_view.ExtLines = 300
dimension_view.ExtOvershoot = 100
dimension_view.ShowUnit = False
dimension_view.Decimals = 0

FreeCAD.ActiveDocument.recompute()
object1 = document.getObjectsByLabel('Wall_3')[0]
object2 = document.getObjectsByLabel('Wall_10')[0]
object1_bound_box = object1.Shape.BoundBox
object2_bound_box = object2.Shape.BoundBox
point_1_x = object1_bound_box.XMax
point_1_y = (object1_bound_box.YMin + object1_bound_box.YMax)/2
point1 = FreeCAD.Vector(point_1_x, point_1_y, 0)
point_2_x = object2_bound_box.XMin
point_2_y = point_1_y
point2 = FreeCAD.Vector(point_2_x, point_2_y, 0)
x_mid = (point_1_x + point_2_x)/2
point3 = FreeCAD.Vector(x_mid, point_1_y + 0, 0)
dimension = Draft.make_linear_dimension(point1, point2, point3)
dimension.Label = 'Dim_East-West_Wall_3_End_Wall_10_Start'
existing_dimensions.addObject(dimension)
dimension_view = dimension.ViewObject
dimension_view.ArrowSize = 20
dimension_view.ArrowType = 'Arrow'
dimension_view.FontSize = 80
dimension_view.ExtLines = 300
dimension_view.ExtOvershoot = 100
dimension_view.ShowUnit = False
dimension_view.Decimals = 0

FreeCAD.ActiveDocument.recompute()
object1 = document.getObjectsByLabel('Wall_4')[0]
object2 = document.getObjectsByLabel('Wall_8')[0]
object1_bound_box = object1.Shape.BoundBox
object2_bound_box = object2.Shape.BoundBox
point_1_x = object1_bound_box.XMax
point_1_y = (object1_bound_box.YMin + object1_bound_box.YMax)/2
point1 = FreeCAD.Vector(point_1_x, point_1_y, 0)
point_2_x = object2_bound_box.XMin
point_2_y = point_1_y
point2 = FreeCAD.Vector(point_2_x, point_2_y, 0)
x_mid = (point_1_x + point_2_x)/2
point3 = FreeCAD.Vector(x_mid, point_1_y + 0, 0)
dimension = Draft.make_linear_dimension(point1, point2, point3)
dimension.Label = 'Dim_East-West_Wall_4_End_Wall_8_Start'
existing_dimensions.addObject(dimension)
dimension_view = dimension.ViewObject
dimension_view.ArrowSize = 20
dimension_view.ArrowType = 'Arrow'
dimension_view.FontSize = 80
dimension_view.ExtLines = 300
dimension_view.ExtOvershoot = 100
dimension_view.ShowUnit = False
dimension_view.Decimals = 0

FreeCAD.ActiveDocument.recompute()
object1 = document.getObjectsByLabel('Wall_1')[0]
object2 = document.getObjectsByLabel('Hole_1')[0]
object1_bound_box = object1.Shape.BoundBox
object2_bound_box = object2.Shape.BoundBox
point_1_x = object1_bound_box.XMax
point_1_y = (object1_bound_box.YMin + object1_bound_box.YMax)/2
point1 = FreeCAD.Vector(point_1_x, point_1_y, 0)
point_2_x = object2_bound_box.XMin
point_2_y = point_1_y
point2 = FreeCAD.Vector(point_2_x, point_2_y, 0)
x_mid = (point_1_x + point_2_x)/2
point3 = FreeCAD.Vector(x_mid, point_1_y + -1300, 0)
dimension = Draft.make_linear_dimension(point1, point2, point3)
dimension.Label = 'Dim_East-West_Wall_1_End_Hole_1_Start'
existing_dimensions.addObject(dimension)
dimension_view = dimension.ViewObject
dimension_view.ArrowSize = 20
dimension_view.ArrowType = 'Arrow'
dimension_view.FontSize = 80
dimension_view.ExtLines = 300
dimension_view.ExtOvershoot = 100
dimension_view.ShowUnit = False
dimension_view.Decimals = 0

FreeCAD.ActiveDocument.recompute()
object = document.getObjectsByLabel('Hole_1')[0]
object_bound_box = object.Shape.BoundBox
x_min = object_bound_box.XMin
x_max = object_bound_box.XMax
x_mid = (x_min + x_max)/2
y_min = object_bound_box.YMin
y_max = object_bound_box.YMax
y_mid = (y_min + y_max)/2
point1 = FreeCAD.Vector(x_min, y_max, 0)
point2 = FreeCAD.Vector(x_max, y_max, 0)
point3 = FreeCAD.Vector(x_mid, y_max + 300, 0)
dimension = Draft.make_linear_dimension(point1, point2, point3)
dimension.Label = 'Dim_North_Hole_1'
existing_dimensions.addObject(dimension)
dimension_view = dimension.ViewObject
dimension_view.ArrowSize = 20
dimension_view.ArrowType = 'Arrow'
dimension_view.FontSize = 80
dimension_view.ExtLines = 300
dimension_view.ExtOvershoot = 100
dimension_view.ShowUnit = False
dimension_view.Decimals = 0

FreeCAD.ActiveDocument.recompute()
object1 = document.getObjectsByLabel('Hole_1')[0]
object2 = document.getObjectsByLabel('Wall_13')[0]
object1_bound_box = object1.Shape.BoundBox
object2_bound_box = object2.Shape.BoundBox
point_1_x = object1_bound_box.XMax
point_1_y = (object1_bound_box.YMin + object1_bound_box.YMax)/2
point1 = FreeCAD.Vector(point_1_x, point_1_y, 0)
point_2_x = object2_bound_box.XMin
point_2_y = point_1_y
point2 = FreeCAD.Vector(point_2_x, point_2_y, 0)
x_mid = (point_1_x + point_2_x)/2
point3 = FreeCAD.Vector(x_mid, point_1_y + 500, 0)
dimension = Draft.make_linear_dimension(point1, point2, point3)
dimension.Label = 'Dim_East-West_Hole_1_End_Wall_13_Start'
existing_dimensions.addObject(dimension)
dimension_view = dimension.ViewObject
dimension_view.ArrowSize = 20
dimension_view.ArrowType = 'Arrow'
dimension_view.FontSize = 80
dimension_view.ExtLines = 300
dimension_view.ExtOvershoot = 100
dimension_view.ShowUnit = False
dimension_view.Decimals = 0

FreeCAD.ActiveDocument.recompute()
object1 = document.getObjectsByLabel('Wall_4')[0]
object2 = document.getObjectsByLabel('Pillar_7')[0]
object1_bound_box = object1.Shape.BoundBox
object2_bound_box = object2.Shape.BoundBox
point_1_x = object1_bound_box.XMax
point_1_y = (object1_bound_box.YMin + object1_bound_box.YMax)/2
point1 = FreeCAD.Vector(point_1_x, point_1_y, 0)
point_2_x = object2_bound_box.XMin
point_2_y = point_1_y
point2 = FreeCAD.Vector(point_2_x, point_2_y, 0)
x_mid = (point_1_x + point_2_x)/2
point3 = FreeCAD.Vector(x_mid, point_1_y + 1500, 0)
dimension = Draft.make_linear_dimension(point1, point2, point3)
dimension.Label = 'Dim_East-West_Wall_4_End_Pillar_7_Start'
existing_dimensions.addObject(dimension)
dimension_view = dimension.ViewObject
dimension_view.ArrowSize = 20
dimension_view.ArrowType = 'Arrow'
dimension_view.FontSize = 80
dimension_view.ExtLines = 300
dimension_view.ExtOvershoot = 100
dimension_view.ShowUnit = False
dimension_view.Decimals = 0

FreeCAD.ActiveDocument.recompute()
object1 = document.getObjectsByLabel('Wall_7')[0]
object2 = document.getObjectsByLabel('Pillar_7')[0]
object1_bound_box = object1.Shape.BoundBox
object2_bound_box = object2.Shape.BoundBox
point_1_y = object1_bound_box.YMin
point_1_x = (object1_bound_box.XMin + object1_bound_box.XMax)/2
point1 = FreeCAD.Vector(point_1_x, point_1_y, 0)
point_2_y = object2_bound_box.YMax
point_2_x = point_1_x
point2 = FreeCAD.Vector(point_2_x, point_2_y, 0)
y_mid = (point_1_y + point_2_y)/2
point3 = FreeCAD.Vector(point_1_x + -1250, y_mid, 0)
dimension = Draft.make_linear_dimension(point1, point2, point3)
dimension.Label = 'Dim_North-South_Wall_7_Start_Pillar_7_End'
existing_dimensions.addObject(dimension)
dimension_view = dimension.ViewObject
dimension_view.ArrowSize = 20
dimension_view.ArrowType = 'Arrow'
dimension_view.FontSize = 80
dimension_view.ExtLines = 300
dimension_view.ExtOvershoot = 100
dimension_view.ShowUnit = False
dimension_view.Decimals = 0

FreeCAD.ActiveDocument.recompute()
object1 = document.getObjectsByLabel('Wall_3')[0]
object2 = document.getObjectsByLabel('Pillar_8')[0]
object1_bound_box = object1.Shape.BoundBox
object2_bound_box = object2.Shape.BoundBox
point_1_x = object1_bound_box.XMax
point_1_y = (object1_bound_box.YMin + object1_bound_box.YMax)/2
point1 = FreeCAD.Vector(point_1_x, point_1_y, 0)
point_2_x = object2_bound_box.XMin
point_2_y = point_1_y
point2 = FreeCAD.Vector(point_2_x, point_2_y, 0)
x_mid = (point_1_x + point_2_x)/2
point3 = FreeCAD.Vector(x_mid, point_1_y + 1800, 0)
dimension = Draft.make_linear_dimension(point1, point2, point3)
dimension.Label = 'Dim_East-West_Wall_3_End_Pillar_8_Start'
existing_dimensions.addObject(dimension)
dimension_view = dimension.ViewObject
dimension_view.ArrowSize = 20
dimension_view.ArrowType = 'Arrow'
dimension_view.FontSize = 80
dimension_view.ExtLines = 300
dimension_view.ExtOvershoot = 100
dimension_view.ShowUnit = False
dimension_view.Decimals = 0

FreeCAD.ActiveDocument.recompute()
object1 = document.getObjectsByLabel('Wall_7')[0]
object2 = document.getObjectsByLabel('Pillar_8')[0]
object1_bound_box = object1.Shape.BoundBox
object2_bound_box = object2.Shape.BoundBox
point_1_y = object1_bound_box.YMin
point_1_x = (object1_bound_box.XMin + object1_bound_box.XMax)/2
point1 = FreeCAD.Vector(point_1_x, point_1_y, 0)
point_2_y = object2_bound_box.YMax
point_2_x = point_1_x
point2 = FreeCAD.Vector(point_2_x, point_2_y, 0)
y_mid = (point_1_y + point_2_y)/2
point3 = FreeCAD.Vector(point_1_x + -200, y_mid, 0)
dimension = Draft.make_linear_dimension(point1, point2, point3)
dimension.Label = 'Dim_North-South_Wall_7_Start_Pillar_8_End'
existing_dimensions.addObject(dimension)
dimension_view = dimension.ViewObject
dimension_view.ArrowSize = 20
dimension_view.ArrowType = 'Arrow'
dimension_view.FontSize = 80
dimension_view.ExtLines = 300
dimension_view.ExtOvershoot = 100
dimension_view.ShowUnit = False
dimension_view.Decimals = 0

FreeCAD.DraftWorkingPlane.setTop()
FreeCAD.ActiveDocument.recompute()
Gui.activeDocument().activeView().viewTop()
App.activeDocument().recompute()
sectionPlane = Arch.makeSectionPlane([existing_building, existing_dimensions])
sectionPlane.Placement.move(FreeCAD.Vector(0, 0, -650))

Gui.ActiveDocument = Gui.getDocument('SHV')
Gui.activateWorkbench('TechDrawWorkbench')
page = App.activeDocument().addObject('TechDraw::DrawPage','Page')
template = App.activeDocument().addObject('TechDraw::DrawSVGTemplate','Template')
template.Template = '/Applications/FreeCAD.app/Contents/Resources/share/Mod/TechDraw/Templates/A4_Portrait_ISO7200Pep.svg'
page.Template = App.activeDocument().Template

buildingPlan = FreeCAD.ActiveDocument.addObject('TechDraw::DrawViewArch','BuildingPlan')
buildingPlan.Source = sectionPlane
pageBuildingPlan = page.addView(buildingPlan)
buildingPlan.Scale = 1/75
buildingPlan.FontSize = 6

Gui.SendMsgToActiveView('ViewFit')
FreeCAD.ActiveDocument.recompute()
Gui.SendMsgToActiveView('ViewFit')

