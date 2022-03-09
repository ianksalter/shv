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

wall_1 = bpy.context.scene.objects['Wall 1']


# TODO add code for generating holes here:

hole_1_location = (hole_1_x_start + hole_1_length / 2,
                   0,
                   hole_1_z_start + hole_1_height / 2)
                   
hole_1_scale = (hole_1_length / 2, 0.1, hole_1_height / 2)                   

# holes

bpy.ops.mesh.primitive_cube_add(
    enter_editmode=False,
    align='WORLD',   
    location=hole_1_location,
    scale=hole_1_scale)
    
bpy.context.object.name = "Hole 1"

hole_1 = bpy.context.scene.objects['Hole 1']

bpy.context.object.display_type = 'WIRE'
bpy.context.object.hide_render = True

#bpy.ops.outliner.item_activate(deselect_all=True)
#bpy.context.view_layer.objects.active = bpy.data.objects['Wall 1']
#bpy.data.objects['Wall 1'].select_set(True)

#Save the generated file
# bpy.ops.wm.save_as_mainfile(filepath="blender/create-hole-example.blend")


