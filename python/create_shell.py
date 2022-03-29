import bpy

# Delete default cube
bpy.ops.object.delete(use_global=False)

# Ensure we are using the metric system
bpy.context.scene.unit_settings.system = 'METRIC'

bpy.ops.mesh.primitive_cube_add(
enter_editmode=False,
align='WORLD',
location=(0.05,0.19,2.35))
bpy.context.object.name = 'Pillar_1'
bpy.context.object.dimensions = (0.38,0.38,4.7)

bpy.ops.mesh.primitive_cube_add(
enter_editmode=False,
align='WORLD',
location=(0.05,3.96,2.35))
bpy.context.object.name = 'Pillar_2'
bpy.context.object.dimensions = (0.38,0.38,4.7)

bpy.ops.mesh.primitive_cube_add(
enter_editmode=False,
align='WORLD',
location=(0.05,7.71,2.35))
bpy.context.object.name = 'Pillar_3'
bpy.context.object.dimensions = (0.38,0.38,4.7)

bpy.ops.mesh.primitive_cube_add(
enter_editmode=False,
align='WORLD',
location=(0.05,12.19,2.35))
bpy.context.object.name = 'Pillar_4'
bpy.context.object.dimensions = (0.38,0.38,4.7)

bpy.ops.mesh.primitive_cube_add(
enter_editmode=False,
align='WORLD',
location=(0.05,15.91,2.35))
bpy.context.object.name = 'Pillar_5'
bpy.context.object.dimensions = (0.38,0.38,4.7)

bpy.ops.mesh.primitive_cube_add(
enter_editmode=False,
align='WORLD',
location=(2.53,16.9,2.35))
bpy.context.object.name = 'Pillar_6'
bpy.context.object.dimensions = (0.26,0.26,4.7)

bpy.ops.mesh.primitive_cube_add(
enter_editmode=False,
align='WORLD',
location=(3.69,15.91,2.35))
bpy.context.object.name = 'Pillar_7'
bpy.context.object.dimensions = (0.38,0.38,4.7)

bpy.ops.mesh.primitive_cube_add(
enter_editmode=False,
align='WORLD',
location=(3.87,12.19,2.35))
bpy.context.object.name = 'Pillar_8'
bpy.context.object.dimensions = (0.38,0.38,4.7)

bpy.ops.mesh.primitive_cube_add(
enter_editmode=False,
align='WORLD',
location=(4.85,3.96,2.35))
bpy.context.object.name = 'Pillar_9'
bpy.context.object.dimensions = (0.38,0.38,4.7)

bpy.ops.mesh.primitive_cube_add(
enter_editmode=False,
align='WORLD',
location=(4.85,0.19,2.35))
bpy.context.object.name = 'Pillar_10'
bpy.context.object.dimensions = (0.38,0.38,4.7)

bpy.ops.mesh.primitive_cube_add(
size=1,
enter_editmode=False,
align='WORLD',
location=(0.0500000000000001,2.075,2.35),
scale=(3.39,0.1,4.7),
rotation=(0,0,1.5707963267949))
bpy.context.object.name = 'Wall_1'

bpy.ops.mesh.primitive_cube_add(
size=1,
enter_editmode=False,
align='WORLD',
location=(0.0500000000000001,5.835,2.35),
scale=(3.37,0.1,4.7),
rotation=(0,0,1.5707963267949))
bpy.context.object.name = 'Wall_2'

bpy.ops.mesh.primitive_cube_add(
size=1,
enter_editmode=False,
align='WORLD',
location=(0.0500000000000001,9.95,2.35),
scale=(4.1,0.1,4.7),
rotation=(0,0,1.5707963267949))
bpy.context.object.name = 'Wall_3'

bpy.ops.mesh.primitive_cube_add(
size=1,
enter_editmode=False,
align='WORLD',
location=(0.0500000000000001,14.05,2.35),
scale=(3.34,0.1,4.7),
rotation=(0,0,1.5707963267949))
bpy.context.object.name = 'Wall_4'

bpy.ops.mesh.primitive_cube_add(
size=1,
enter_editmode=False,
align='WORLD',
location=(0.05,16.565,2.35),
scale=(0.93,0.1,4.7),
rotation=(0,0,1.5707963267949))
bpy.context.object.name = 'Wall_5'

bpy.ops.mesh.primitive_cube_add(
size=1,
enter_editmode=False,
align='WORLD',
location=(1.25,16.97,2.35),
scale=(2.3,0.12,4.7),
rotation=(0,0,0))
bpy.context.object.name = 'Wall_6'

bpy.ops.mesh.primitive_cube_add(
size=1,
enter_editmode=False,
align='WORLD',
location=(4.43,16.97,2.35),
scale=(3.54,0.12,4.7),
rotation=(0,0,0))
bpy.context.object.name = 'Wall_7'

bpy.ops.mesh.primitive_cube_add(
size=1,
enter_editmode=False,
align='WORLD',
location=(6.25,14.485,2.35),
scale=(5.09,0.1,4.7),
rotation=(0,0,1.5707963267949))
bpy.context.object.name = 'Wall_8'

bpy.ops.mesh.primitive_cube_add(
size=1,
enter_editmode=False,
align='WORLD',
location=(5.34,11.99,2.35),
scale=(1.72,0.1,4.7),
rotation=(0,0,0))
bpy.context.object.name = 'Wall_9'

bpy.ops.mesh.primitive_cube_add(
size=1,
enter_editmode=False,
align='WORLD',
location=(4.43,9.765,2.35),
scale=(4.55,0.1,4.7),
rotation=(0,0,1.5707963267949))
bpy.context.object.name = 'Wall_10'

bpy.ops.mesh.primitive_cube_add(
size=1,
enter_editmode=False,
align='WORLD',
location=(4.64,7.54,2.35),
scale=(0.32,0.1,4.7),
rotation=(0,0,0))
bpy.context.object.name = 'Wall_11'

bpy.ops.mesh.primitive_cube_add(
size=1,
enter_editmode=False,
align='WORLD',
location=(4.85,5.855,2.35),
scale=(3.47,0.1,4.7),
rotation=(0,0,1.5707963267949))
bpy.context.object.name = 'Wall_12'

bpy.ops.mesh.primitive_cube_add(
size=1,
enter_editmode=False,
align='WORLD',
location=(4.99,2.045,2.35),
scale=(3.39,0.1,4.7),
rotation=(0,0,1.5707963267949))
bpy.context.object.name = 'Wall_13'

bpy.ops.mesh.primitive_cube_add(
size=1,
enter_editmode=False,
align='WORLD',
location=(2.45,0.19,2.35),
scale=(4.42,0.38,4.7),
rotation=(0,0,0))
bpy.context.object.name = 'Wall_14'

# Save the generated file
import os
bpy.ops.wm.save_as_mainfile(filepath= os.getcwd() + '/blender/shell.blend')

