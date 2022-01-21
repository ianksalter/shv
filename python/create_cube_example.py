import bpy

# Delete default cube
bpy.ops.object.delete(use_global=False)

# Ensure we are using the metric system
bpy.context.scene.unit_settings.system = 'METRIC'


wall_1_start = (0, 0, 0)
wall_1_dimensions = (0.1, 2, 3)
wall_2_start = (0, wall_1_dimensions[1], 0)
wall_2_dimensions = (3, 0.1, 3)

wall_1_location = (
        wall_1_start[0] + wall_1_dimensions[0]/2,
        wall_1_start[1] + wall_1_dimensions[1]/2,
        wall_1_start[2] + wall_1_dimensions[2]/2
    )
    
wall_2_location = (
        wall_2_start[0] + wall_2_dimensions[0]/2,
        wall_2_start[1] + wall_2_dimensions[1]/2,
        wall_2_start[2] + wall_2_dimensions[2]/2
    )

bpy.ops.mesh.primitive_cube_add(
    enter_editmode=False,
    align='WORLD',   
    location=wall_1_location)
    
bpy.context.object.name = "Wall 1"

bpy.context.object.dimensions = wall_1_dimensions

bpy.ops.mesh.primitive_cube_add(
    enter_editmode=False,
    align='WORLD',
    location=wall_2_location)
    
bpy.context.object.name = "Wall 2"

bpy.context.object.dimensions = wall_2_dimensions

#Save the generated file
bpy.ops.wm.save_as_mainfile(filepath="blender/create_cube_example.blend")


