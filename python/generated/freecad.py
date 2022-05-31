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

baseline_start = FreeCAD.Vector(-140, 190, 0)
baseline_end = FreeCAD.Vector(240, 190, 0)
baseline = Draft.makeLine(baseline_start, baseline_end)
pillar1 = Arch.makeWall(baseline, length=None, width=380, height=4700, name='Pillar_1')

baseline_start = FreeCAD.Vector(-140, 3960, 0)
baseline_end = FreeCAD.Vector(240, 3960, 0)
baseline = Draft.makeLine(baseline_start, baseline_end)
pillar2 = Arch.makeWall(baseline, length=None, width=380, height=4700, name='Pillar_2')

baseline_start = FreeCAD.Vector(-140, 7710, 0)
baseline_end = FreeCAD.Vector(240, 7710, 0)
baseline = Draft.makeLine(baseline_start, baseline_end)
pillar3 = Arch.makeWall(baseline, length=None, width=380, height=4700, name='Pillar_3')

baseline_start = FreeCAD.Vector(-140, 12190, 0)
baseline_end = FreeCAD.Vector(240, 12190, 0)
baseline = Draft.makeLine(baseline_start, baseline_end)
pillar4 = Arch.makeWall(baseline, length=None, width=380, height=4700, name='Pillar_4')

baseline_start = FreeCAD.Vector(-140, 15910, 0)
baseline_end = FreeCAD.Vector(240, 15910, 0)
baseline = Draft.makeLine(baseline_start, baseline_end)
pillar5 = Arch.makeWall(baseline, length=None, width=380, height=4700, name='Pillar_5')

baseline_start = FreeCAD.Vector(2400, 16900, 0)
baseline_end = FreeCAD.Vector(2660, 16900, 0)
baseline = Draft.makeLine(baseline_start, baseline_end)
pillar6 = Arch.makeWall(baseline, length=None, width=260, height=4700, name='Pillar_6')

baseline_start = FreeCAD.Vector(3500, 15910, 0)
baseline_end = FreeCAD.Vector(3880, 15910, 0)
baseline = Draft.makeLine(baseline_start, baseline_end)
pillar7 = Arch.makeWall(baseline, length=None, width=380, height=4700, name='Pillar_7')

baseline_start = FreeCAD.Vector(3680, 12190, 0)
baseline_end = FreeCAD.Vector(4060, 12190, 0)
baseline = Draft.makeLine(baseline_start, baseline_end)
pillar8 = Arch.makeWall(baseline, length=None, width=380, height=4700, name='Pillar_8')

baseline_start = FreeCAD.Vector(4660, 3960, 0)
baseline_end = FreeCAD.Vector(5040, 3960, 0)
baseline = Draft.makeLine(baseline_start, baseline_end)
pillar9 = Arch.makeWall(baseline, length=None, width=380, height=4700, name='Pillar_9')

baseline_start = FreeCAD.Vector(4660, 190, 0)
baseline_end = FreeCAD.Vector(5040, 190, 0)
baseline = Draft.makeLine(baseline_start, baseline_end)
pillar10 = Arch.makeWall(baseline, length=None, width=380, height=4700, name='Pillar_10')

baseline_start = FreeCAD.Vector(50.0000000000001, 380, 0)
baseline_end = FreeCAD.Vector(50.0000000000001, 3770, 0)
baseline = Draft.makeLine(baseline_start, baseline_end)
wall1 = Arch.makeWall(baseline, length=None, width=100, height=4700, name='Wall_1')

baseline_start = FreeCAD.Vector(50.0000000000001, 4150, 0)
baseline_end = FreeCAD.Vector(50.0000000000001, 7520, 0)
baseline = Draft.makeLine(baseline_start, baseline_end)
wall2 = Arch.makeWall(baseline, length=None, width=100, height=4700, name='Wall_2')

baseline_start = FreeCAD.Vector(50.0000000000001, 7900, 0)
baseline_end = FreeCAD.Vector(50.0000000000001, 12000, 0)
baseline = Draft.makeLine(baseline_start, baseline_end)
wall3 = Arch.makeWall(baseline, length=None, width=100, height=4700, name='Wall_3')

baseline_start = FreeCAD.Vector(50.0000000000001, 12380, 0)
baseline_end = FreeCAD.Vector(50.0000000000001, 15720, 0)
baseline = Draft.makeLine(baseline_start, baseline_end)
wall4 = Arch.makeWall(baseline, length=None, width=100, height=4700, name='Wall_4')

baseline_start = FreeCAD.Vector(50, 16100, 0)
baseline_end = FreeCAD.Vector(50, 17030, 0)
baseline = Draft.makeLine(baseline_start, baseline_end)
wall5 = Arch.makeWall(baseline, length=None, width=100, height=4700, name='Wall_5')

baseline_start = FreeCAD.Vector(100, 16970, 0)
baseline_end = FreeCAD.Vector(2400, 16970, 0)
baseline = Draft.makeLine(baseline_start, baseline_end)
wall6 = Arch.makeWall(baseline, length=None, width=120, height=4700, name='Wall_6')

baseline_start = FreeCAD.Vector(2660, 16970, 0)
baseline_end = FreeCAD.Vector(6200, 16970, 0)
baseline = Draft.makeLine(baseline_start, baseline_end)
wall7 = Arch.makeWall(baseline, length=None, width=120, height=4700, name='Wall_7')

baseline_start = FreeCAD.Vector(6250, 11940, 0)
baseline_end = FreeCAD.Vector(6250, 17030, 0)
baseline = Draft.makeLine(baseline_start, baseline_end)
wall8 = Arch.makeWall(baseline, length=None, width=100, height=4700, name='Wall_8')

baseline_start = FreeCAD.Vector(4480, 11990, 0)
baseline_end = FreeCAD.Vector(6200, 11990, 0)
baseline = Draft.makeLine(baseline_start, baseline_end)
wall9 = Arch.makeWall(baseline, length=None, width=100, height=4700, name='Wall_9')

baseline_start = FreeCAD.Vector(4430, 7490, 0)
baseline_end = FreeCAD.Vector(4430, 12040, 0)
baseline = Draft.makeLine(baseline_start, baseline_end)
wall10 = Arch.makeWall(baseline, length=None, width=100, height=4700, name='Wall_10')

baseline_start = FreeCAD.Vector(4480, 7540, 0)
baseline_end = FreeCAD.Vector(4800, 7540, 0)
baseline = Draft.makeLine(baseline_start, baseline_end)
wall11 = Arch.makeWall(baseline, length=None, width=100, height=4700, name='Wall_11')

baseline_start = FreeCAD.Vector(4850, 4120, 0)
baseline_end = FreeCAD.Vector(4850, 7590, 0)
baseline = Draft.makeLine(baseline_start, baseline_end)
wall12 = Arch.makeWall(baseline, length=None, width=100, height=4700, name='Wall_12')

baseline_start = FreeCAD.Vector(4990, 350, 0)
baseline_end = FreeCAD.Vector(4990, 3740, 0)
baseline = Draft.makeLine(baseline_start, baseline_end)
wall13 = Arch.makeWall(baseline, length=None, width=100, height=4700, name='Wall_13')

baseline_start = FreeCAD.Vector(240, 190, 0)
baseline_end = FreeCAD.Vector(4660, 190, 0)
baseline = Draft.makeLine(baseline_start, baseline_end)
wall14 = Arch.makeWall(baseline, length=None, width=380, height=4700, name='Wall_14')

Gui.SendMsgToActiveView('ViewFit')
FreeCAD.ActiveDocument.recompute()

