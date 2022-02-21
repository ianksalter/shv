import bpy

# Delete default cube
bpy.ops.object.delete(use_global=False)

# Ensure we are using the metric system
bpy.context.scene.unit_settings.system = 'METRIC'

bpy.ops.mesh.primitive_cube_add(
enter_editmode=False,
align='WORLD',
location=(0.19,0.19,2.35))
bpy.context.object.name = 'Pillar_1'
bpy.context.object.dimensions = (0.38,0.38,4.7)

bpy.ops.mesh.primitive_cube_add(
enter_editmode=False,
align='WORLD',
location=(0.19,3.96,2.35))
bpy.context.object.name = 'Pillar_2'
bpy.context.object.dimensions = (0.38,0.38,4.7)

bpy.ops.mesh.primitive_cube_add(
enter_editmode=False,
align='WORLD',
location=(0.19,7.71,2.35))
bpy.context.object.name = 'Pillar_3'
bpy.context.object.dimensions = (0.38,0.38,4.7)

bpy.ops.mesh.primitive_cube_add(
enter_editmode=False,
align='WORLD',
location=(0.19,12.19,2.35))
bpy.context.object.name = 'Pillar_4'
bpy.context.object.dimensions = (0.38,0.38,4.7)

bpy.ops.mesh.primitive_cube_add(
enter_editmode=False,
align='WORLD',
location=(0.19,15.91,2.35))
bpy.context.object.name = 'Pillar_5'
bpy.context.object.dimensions = (0.38,0.38,4.7)

bpy.ops.mesh.primitive_cube_add(
enter_editmode=False,
align='WORLD',
location=(2.43,17.05,2.35))
bpy.context.object.name = 'Pillar_6'
bpy.context.object.dimensions = (0.38,0.38,4.7)

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
location=(0.05,16.55,2.35),
scale=(0.9,0.1,4.7),
rotation=(0,0,1.5707963267949))
bpy.context.object.name = 'Wall_5'

bpy.ops.mesh.primitive_cube_add(
size=1,
enter_editmode=False,
align='WORLD',
location=(1.05,17.12,2.35),
scale=(2.1,0.24,4.7),
rotation=(0,0,0))
bpy.context.object.name = 'Wall_6'

bpy.ops.mesh.primitive_cube_add(
size=1,
enter_editmode=False,
align='WORLD',
location=(4.34,17.12,2.35),
scale=(3.72,0.24,4.7),
rotation=(0,0,0))
bpy.context.object.name = 'Wall_7'

bpy.ops.mesh.primitive_cube_add(
size=1,
enter_editmode=False,
align='WORLD',
location=(6.25,14.565,2.35),
scale=(4.87,0.1,4.7),
rotation=(0,0,1.5707963267949))
bpy.context.object.name = 'Wall_8'

bpy.ops.mesh.primitive_cube_add(
size=1,
enter_editmode=False,
align='WORLD',
location=(5.34,12.18,2.35),
scale=(1.92,0.1,4.7),
rotation=(0,0,0))
bpy.context.object.name = 'Wall_9'

bpy.ops.mesh.primitive_cube_add(
size=1,
enter_editmode=False,
align='WORLD',
location=(4.43,9.955,2.35),
scale=(4.35,0.1,4.7),
rotation=(0,0,1.5707963267949))
bpy.context.object.name = 'Wall_10'

bpy.ops.mesh.primitive_cube_add(
size=1,
enter_editmode=False,
align='WORLD',
location=(4.64,7.73,2.35),
scale=(0.52,0.1,4.7),
rotation=(0,0,0))
bpy.context.object.name = 'Wall_11'

bpy.ops.mesh.primitive_cube_add(
size=1,
enter_editmode=False,
align='WORLD',
location=(4.85,5.995,2.35),
scale=(3.37,0.1,4.7),
rotation=(0,0,1.5707963267949))
bpy.context.object.name = 'Wall_12'

bpy.ops.mesh.primitive_cube_add(
size=1,
enter_editmode=False,
align='WORLD',
location=(4.85,2.235,2.35),
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

