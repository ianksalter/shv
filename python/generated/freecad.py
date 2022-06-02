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

baseline_start = FreeCAD.Vector(-140, 7710, 0)
baseline_end = FreeCAD.Vector(240, 7710, 0)
baseline = Draft.makeLine(baseline_start, baseline_end)
pillar = Arch.makeWall(baseline, length=None, width=380, height=4700, name='Pillar_3')
existing_building.addObject(pillar)

baseline_start = FreeCAD.Vector(-140, 12190, 0)
baseline_end = FreeCAD.Vector(240, 12190, 0)
baseline = Draft.makeLine(baseline_start, baseline_end)
pillar = Arch.makeWall(baseline, length=None, width=380, height=4700, name='Pillar_4')
existing_building.addObject(pillar)

baseline_start = FreeCAD.Vector(-140, 15910, 0)
baseline_end = FreeCAD.Vector(240, 15910, 0)
baseline = Draft.makeLine(baseline_start, baseline_end)
pillar = Arch.makeWall(baseline, length=None, width=380, height=4700, name='Pillar_5')
existing_building.addObject(pillar)

baseline_start = FreeCAD.Vector(2400, 16900, 0)
baseline_end = FreeCAD.Vector(2660, 16900, 0)
baseline = Draft.makeLine(baseline_start, baseline_end)
pillar = Arch.makeWall(baseline, length=None, width=260, height=4700, name='Pillar_6')
existing_building.addObject(pillar)

baseline_start = FreeCAD.Vector(3500, 15910, 0)
baseline_end = FreeCAD.Vector(3880, 15910, 0)
baseline = Draft.makeLine(baseline_start, baseline_end)
pillar = Arch.makeWall(baseline, length=None, width=380, height=4700, name='Pillar_7')
existing_building.addObject(pillar)

baseline_start = FreeCAD.Vector(3680, 12190, 0)
baseline_end = FreeCAD.Vector(4060, 12190, 0)
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
baseline_end = FreeCAD.Vector(50.0000000000001, 7520, 0)
baseline = Draft.makeLine(baseline_start, baseline_end)
wall = Arch.makeWall(baseline, length=None, width=100, height=4700, name='Wall_2')
existing_building.addObject(wall)

baseline_start = FreeCAD.Vector(50.0000000000001, 7900, 0)
baseline_end = FreeCAD.Vector(50.0000000000001, 12000, 0)
baseline = Draft.makeLine(baseline_start, baseline_end)
wall = Arch.makeWall(baseline, length=None, width=100, height=4700, name='Wall_3')
existing_building.addObject(wall)

baseline_start = FreeCAD.Vector(50.0000000000001, 12380, 0)
baseline_end = FreeCAD.Vector(50.0000000000001, 15720, 0)
baseline = Draft.makeLine(baseline_start, baseline_end)
wall = Arch.makeWall(baseline, length=None, width=100, height=4700, name='Wall_4')
existing_building.addObject(wall)

baseline_start = FreeCAD.Vector(50, 16100, 0)
baseline_end = FreeCAD.Vector(50, 17030, 0)
baseline = Draft.makeLine(baseline_start, baseline_end)
wall = Arch.makeWall(baseline, length=None, width=100, height=4700, name='Wall_5')
existing_building.addObject(wall)

baseline_start = FreeCAD.Vector(100, 16970, 0)
baseline_end = FreeCAD.Vector(2400, 16970, 0)
baseline = Draft.makeLine(baseline_start, baseline_end)
wall = Arch.makeWall(baseline, length=None, width=120, height=4700, name='Wall_6')
existing_building.addObject(wall)

baseline_start = FreeCAD.Vector(2660, 16970, 0)
baseline_end = FreeCAD.Vector(6200, 16970, 0)
baseline = Draft.makeLine(baseline_start, baseline_end)
wall = Arch.makeWall(baseline, length=None, width=120, height=4700, name='Wall_7')
existing_building.addObject(wall)

baseline_start = FreeCAD.Vector(6250, 11940, 0)
baseline_end = FreeCAD.Vector(6250, 17030, 0)
baseline = Draft.makeLine(baseline_start, baseline_end)
wall = Arch.makeWall(baseline, length=None, width=100, height=4700, name='Wall_8')
existing_building.addObject(wall)

baseline_start = FreeCAD.Vector(4480, 11990, 0)
baseline_end = FreeCAD.Vector(6200, 11990, 0)
baseline = Draft.makeLine(baseline_start, baseline_end)
wall = Arch.makeWall(baseline, length=None, width=100, height=4700, name='Wall_9')
existing_building.addObject(wall)

baseline_start = FreeCAD.Vector(4430, 7490, 0)
baseline_end = FreeCAD.Vector(4430, 12040, 0)
baseline = Draft.makeLine(baseline_start, baseline_end)
wall = Arch.makeWall(baseline, length=None, width=100, height=4700, name='Wall_10')
existing_building.addObject(wall)

baseline_start = FreeCAD.Vector(4480, 7540, 0)
baseline_end = FreeCAD.Vector(4800, 7540, 0)
baseline = Draft.makeLine(baseline_start, baseline_end)
wall = Arch.makeWall(baseline, length=None, width=100, height=4700, name='Wall_11')
existing_building.addObject(wall)

baseline_start = FreeCAD.Vector(4850, 4120, 0)
baseline_end = FreeCAD.Vector(4850, 7590, 0)
baseline = Draft.makeLine(baseline_start, baseline_end)
wall = Arch.makeWall(baseline, length=None, width=100, height=4700, name='Wall_12')
existing_building.addObject(wall)

baseline_start = FreeCAD.Vector(4990, 350, 0)
baseline_end = FreeCAD.Vector(4990, 3740, 0)
baseline = Draft.makeLine(baseline_start, baseline_end)
wall = Arch.makeWall(baseline, length=None, width=100, height=4700, name='Wall_13')
existing_building.addObject(wall)

baseline_start = FreeCAD.Vector(240, 190, 0)
baseline_end = FreeCAD.Vector(4660, 190, 0)
baseline = Draft.makeLine(baseline_start, baseline_end)
wall = Arch.makeWall(baseline, length=None, width=380, height=4700, name='Wall_14')
existing_building.addObject(wall)

baseline_start = FreeCAD.Vector(1070, 190, 0)
baseline_end = FreeCAD.Vector(3600, 190, 0)
baseline = Draft.makeLine(baseline_start, baseline_end)
hole = Arch.makeWall(baseline, length=None, width=380, height=4050, name='Hole_1')
Arch.removeComponents(hole, wall)

Gui.runCommand('Std_SelectAll',0)
move_list = Gui.Selection.getCompleteSelection()
Draft.move(move_list, App.Vector(70,0,0))
Draft.rotate(move_list, 45)
Draft.move(move_list, App.Vector(6000,-1500,0))

FreeCAD.ActiveDocument.recompute()
object = document.getObjectsByLabel('Pillar_1')[0]
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
point2 = FreeCAD.Vector(x_max, y_min, 0)
point3 = FreeCAD.Vector(x_mid, y_min - 300, 0)
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
point2 = FreeCAD.Vector(x_max, y_min, 0)
point3 = FreeCAD.Vector(x_mid, y_min - 300, 0)
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
point2 = FreeCAD.Vector(x_max, y_min, 0)
point3 = FreeCAD.Vector(x_mid, y_min - 300, 0)
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
point2 = FreeCAD.Vector(x_max, y_min, 0)
point3 = FreeCAD.Vector(x_mid, y_min - 300, 0)
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
point2 = FreeCAD.Vector(x_max, y_min, 0)
point3 = FreeCAD.Vector(x_mid, y_min - 300, 0)
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
point2 = FreeCAD.Vector(x_max, y_min, 0)
point3 = FreeCAD.Vector(x_mid, y_min - 300, 0)
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
point2 = FreeCAD.Vector(x_max, y_min, 0)
point3 = FreeCAD.Vector(x_mid, y_min - 300, 0)
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
point2 = FreeCAD.Vector(x_max, y_min, 0)
point3 = FreeCAD.Vector(x_mid, y_min - 300, 0)
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
point2 = FreeCAD.Vector(x_max, y_min, 0)
point3 = FreeCAD.Vector(x_mid, y_min - 300, 0)
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
object = document.getObjectsByLabel('Wall_5')[0]
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
dimension.Label = 'Dim_West_Wall_5'
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
point1 = FreeCAD.Vector(x_min, y_min, 0)
point2 = FreeCAD.Vector(x_min, y_max, 0)
point3 = FreeCAD.Vector(x_min - 300, y_mid, 0)
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
point1 = FreeCAD.Vector(x_min, y_min, 0)
point2 = FreeCAD.Vector(x_min, y_max, 0)
point3 = FreeCAD.Vector(x_min - 300, y_mid, 0)
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
point1 = FreeCAD.Vector(x_min, y_min, 0)
point2 = FreeCAD.Vector(x_min, y_max, 0)
point3 = FreeCAD.Vector(x_min - 300, y_mid, 0)
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
point1 = FreeCAD.Vector(x_min, y_min, 0)
point2 = FreeCAD.Vector(x_min, y_max, 0)
point3 = FreeCAD.Vector(x_min - 300, y_mid, 0)
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
point1 = FreeCAD.Vector(x_min, y_max, 0)
point2 = FreeCAD.Vector(x_max, y_max, 0)
point3 = FreeCAD.Vector(x_mid, y_max + 300, 0)
dimension = Draft.make_linear_dimension(point1, point2, point3)
dimension.Label = 'Dim_East_Pillar_7'
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
point1 = FreeCAD.Vector(x_min, y_max, 0)
point2 = FreeCAD.Vector(x_max, y_max, 0)
point3 = FreeCAD.Vector(x_mid, y_max + 300, 0)
dimension = Draft.make_linear_dimension(point1, point2, point3)
dimension.Label = 'Dim_East_Pillar_8'
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
point1 = FreeCAD.Vector(x_min, y_max, 0)
point2 = FreeCAD.Vector(x_max, y_max, 0)
point3 = FreeCAD.Vector(x_mid, y_max + 300, 0)
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
point1 = FreeCAD.Vector(x_min, y_max, 0)
point2 = FreeCAD.Vector(x_max, y_max, 0)
point3 = FreeCAD.Vector(x_mid, y_max + 300, 0)
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
point1 = FreeCAD.Vector(x_max, y_min, 0)
point2 = FreeCAD.Vector(x_max, y_max, 0)
point3 = FreeCAD.Vector(x_max + 300, y_mid, 0)
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
object = document.getObjectsByLabel('Wall_10')[0]
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
point1 = FreeCAD.Vector(x_min, y_max, 0)
point2 = FreeCAD.Vector(x_max, y_max, 0)
point3 = FreeCAD.Vector(x_mid, y_max + 300, 0)
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
template.Template = '/Applications/FreeCAD.app/Contents/Resources/share/Mod/TechDraw/Templates/A3_LandscapeTD.svg'
page.Template = App.activeDocument().Template

buildingPlan = FreeCAD.ActiveDocument.addObject('TechDraw::DrawViewArch','BuildingPlan')
buildingPlan.Source = sectionPlane
pageBuildingPlan = page.addView(buildingPlan)
buildingPlan.Scale = 1/50

Gui.SendMsgToActiveView('ViewFit')
FreeCAD.ActiveDocument.recompute()
Gui.SendMsgToActiveView('ViewFit')

