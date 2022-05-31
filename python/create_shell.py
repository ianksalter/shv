import bpy

# Delete default cube
bpy.ops.object.delete(use_global=False)

# Ensure we are using the metric system
bpy.context.scene.unit_settings.system = 'METRIC'
bpy.context.scene.unit_settings.length_unit = 'MILLIMETERS'

bpy.ops.mesh.primitive_cube_add(
enter_editmode=False,
align='WORLD',
location=(50,190,2350))
bpy.context.object.name = 'Pillar_1'
bpy.context.object.dimensions = (380,380,4700)

bpy.ops.mesh.primitive_cube_add(
enter_editmode=False,
align='WORLD',
location=(50,3960,2350))
bpy.context.object.name = 'Pillar_2'
bpy.context.object.dimensions = (380,380,4700)

bpy.ops.mesh.primitive_cube_add(
enter_editmode=False,
align='WORLD',
location=(50,7710,2350))
bpy.context.object.name = 'Pillar_3'
bpy.context.object.dimensions = (380,380,4700)

bpy.ops.mesh.primitive_cube_add(
enter_editmode=False,
align='WORLD',
location=(50,12190,2350))
bpy.context.object.name = 'Pillar_4'
bpy.context.object.dimensions = (380,380,4700)

bpy.ops.mesh.primitive_cube_add(
enter_editmode=False,
align='WORLD',
location=(50,15910,2350))
bpy.context.object.name = 'Pillar_5'
bpy.context.object.dimensions = (380,380,4700)

bpy.ops.mesh.primitive_cube_add(
enter_editmode=False,
align='WORLD',
location=(2530,16900,2350))
bpy.context.object.name = 'Pillar_6'
bpy.context.object.dimensions = (260,260,4700)

bpy.ops.mesh.primitive_cube_add(
enter_editmode=False,
align='WORLD',
location=(3690,15910,2350))
bpy.context.object.name = 'Pillar_7'
bpy.context.object.dimensions = (380,380,4700)

bpy.ops.mesh.primitive_cube_add(
enter_editmode=False,
align='WORLD',
location=(3870,12190,2350))
bpy.context.object.name = 'Pillar_8'
bpy.context.object.dimensions = (380,380,4700)

bpy.ops.mesh.primitive_cube_add(
enter_editmode=False,
align='WORLD',
location=(4850,3960,2350))
bpy.context.object.name = 'Pillar_9'
bpy.context.object.dimensions = (380,380,4700)

bpy.ops.mesh.primitive_cube_add(
enter_editmode=False,
align='WORLD',
location=(4850,190,2350))
bpy.context.object.name = 'Pillar_10'
bpy.context.object.dimensions = (380,380,4700)

bpy.ops.mesh.primitive_cube_add(
size=1,
enter_editmode=False,
align='WORLD',
location=(50.0000000000001,2075,2350),
scale=(3390,100,4700),
rotation=(0,0,1.5707963267949))
bpy.context.object.name = 'Wall_1'

bpy.ops.mesh.primitive_cube_add(
size=1,
enter_editmode=False,
align='WORLD',
location=(50.0000000000001,5835,2350),
scale=(3370,100,4700),
rotation=(0,0,1.5707963267949))
bpy.context.object.name = 'Wall_2'

bpy.ops.mesh.primitive_cube_add(
size=1,
enter_editmode=False,
align='WORLD',
location=(50.0000000000001,9950,2350),
scale=(4100,100,4700),
rotation=(0,0,1.5707963267949))
bpy.context.object.name = 'Wall_3'

bpy.ops.mesh.primitive_cube_add(
size=1,
enter_editmode=False,
align='WORLD',
location=(50.0000000000001,14050,2350),
scale=(3340,100,4700),
rotation=(0,0,1.5707963267949))
bpy.context.object.name = 'Wall_4'

bpy.ops.mesh.primitive_cube_add(
size=1,
enter_editmode=False,
align='WORLD',
location=(50,16565,2350),
scale=(930,100,4700),
rotation=(0,0,1.5707963267949))
bpy.context.object.name = 'Wall_5'

bpy.ops.mesh.primitive_cube_add(
size=1,
enter_editmode=False,
align='WORLD',
location=(1250,16970,2350),
scale=(2300,120,4700),
rotation=(0,0,0))
bpy.context.object.name = 'Wall_6'

bpy.ops.mesh.primitive_cube_add(
size=1,
enter_editmode=False,
align='WORLD',
location=(4430,16970,2350),
scale=(3540,120,4700),
rotation=(0,0,0))
bpy.context.object.name = 'Wall_7'

bpy.ops.mesh.primitive_cube_add(
size=1,
enter_editmode=False,
align='WORLD',
location=(6250,14485,2350),
scale=(5090,100,4700),
rotation=(0,0,1.5707963267949))
bpy.context.object.name = 'Wall_8'

bpy.ops.mesh.primitive_cube_add(
size=1,
enter_editmode=False,
align='WORLD',
location=(5340,11990,2350),
scale=(1720,100,4700),
rotation=(0,0,0))
bpy.context.object.name = 'Wall_9'

bpy.ops.mesh.primitive_cube_add(
size=1,
enter_editmode=False,
align='WORLD',
location=(4430,9765,2350),
scale=(4550,100,4700),
rotation=(0,0,1.5707963267949))
bpy.context.object.name = 'Wall_10'

bpy.ops.mesh.primitive_cube_add(
size=1,
enter_editmode=False,
align='WORLD',
location=(4640,7540,2350),
scale=(320,100,4700),
rotation=(0,0,0))
bpy.context.object.name = 'Wall_11'

bpy.ops.mesh.primitive_cube_add(
size=1,
enter_editmode=False,
align='WORLD',
location=(4850,5855,2350),
scale=(3470,100,4700),
rotation=(0,0,1.5707963267949))
bpy.context.object.name = 'Wall_12'

bpy.ops.mesh.primitive_cube_add(
size=1,
enter_editmode=False,
align='WORLD',
location=(4990,2045,2350),
scale=(3390,100,4700),
rotation=(0,0,1.5707963267949))
bpy.context.object.name = 'Wall_13'

bpy.ops.mesh.primitive_cube_add(
size=1,
enter_editmode=False,
align='WORLD',
location=(2450,190,2350),
scale=(4420,380,4700),
rotation=(0,0,0))
bpy.context.object.name = 'Wall_14'

# Save the generated file
import os
bpy.ops.wm.save_as_mainfile(filepath= os.getcwd() + '/blender/shell.blend')

