import bpy

# Delete default cube
bpy.ops.object.delete(use_global=False)

# Ensure we are using the metric system
bpy.context.scene.unit_settings.system = 'METRIC'

wall_1_location = (0, 0, 1.5)
wall_1_scale = (2.5, 0.1, 1.5)

hole_1_x_start = 1 # x distance from the x coordinate of the least vertex
hole_1_z_start = 0 # z distance from the least vertex
hole_1_length = 1
hole_1_height = 2

hole_2_x_start = 1.1
hole_2_z_start = 1
hole_2_length = 1
hole_2_height = 1

bpy.ops.mesh.primitive_cube_add(
    enter_editmode=False,
    align='WORLD',   
    location=wall_1_location,
    scale=wall_1_scale)
    
bpy.context.object.name = "Wall 1"


# TODO add code for generating holes here:

holes



#Save the generated file
# bpy.ops.wm.save_as_mainfile(filepath="blender/create-hole-example.blend")


