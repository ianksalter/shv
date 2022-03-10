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
location=(3.83,15.91,2.35))
bpy.context.object.name = 'Pillar_7'
bpy.context.object.dimensions = (0.38,0.38,4.7)

bpy.ops.mesh.primitive_cube_add(
enter_editmode=False,
align='WORLD',
location=(4.01,12.19,2.35))
bpy.context.object.name = 'Pillar_8'
bpy.context.object.dimensions = (0.38,0.38,4.7)

bpy.ops.mesh.primitive_cube_add(
enter_editmode=False,
align='WORLD',
location=(4.67,3.96,2.35))
bpy.context.object.name = 'Pillar_9'
bpy.context.object.dimensions = (0.38,0.38,4.7)

bpy.ops.mesh.primitive_cube_add(
enter_editmode=False,
align='WORLD',
location=(4.67,0.19,2.35))
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
location=(6.25,14.535,2.35),
scale=(4.99,0.1,4.7),
rotation=(0,0,1.5707963267949))
bpy.context.object.name = 'Wall_8'

bpy.ops.mesh.primitive_cube_add(
size=1,
enter_editmode=False,
align='WORLD',
location=(5.39,12.09,2.35),
scale=(1.62,0.1,4.7),
rotation=(0,0,0))
bpy.context.object.name = 'Wall_9'

bpy.ops.mesh.primitive_cube_add(
size=1,
enter_editmode=False,
align='WORLD',
location=(4.63,9.865,2.35),
scale=(4.35,0.1,4.7),
rotation=(0,0,1.5707963267949))
bpy.context.object.name = 'Wall_10'

bpy.ops.mesh.primitive_cube_add(
size=1,
enter_editmode=False,
align='WORLD',
location=(4.84,7.64,2.35),
scale=(0.52,0.1,4.7),
rotation=(0,0,0))
bpy.context.object.name = 'Wall_11'

bpy.ops.mesh.primitive_cube_add(
size=1,
enter_editmode=False,
align='WORLD',
location=(5.05,5.905,2.35),
scale=(3.37,0.1,4.7),
rotation=(0,0,1.5707963267949))
bpy.context.object.name = 'Wall_12'

bpy.ops.mesh.primitive_cube_add(
size=1,
enter_editmode=False,
align='WORLD',
location=(5.05,2.145,2.35),
scale=(3.39,0.1,4.7),
rotation=(0,0,1.5707963267949))
bpy.context.object.name = 'Wall_13'

bpy.ops.mesh.primitive_cube_add(
size=1,
enter_editmode=False,
align='WORLD',
location=(2.43,0.19,2.35),
scale=(4.1,0.38,4.7),
rotation=(0,0,0))
bpy.context.object.name = 'Wall_14'

# Save the generated file
bpy.ops.wm.save_as_mainfile(filepath='blender/shell.blend')
bpy.context.space_data.params.filename = 'shell.stl'

