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

hole_2_x_start = 2.1
hole_2_z_start = 1
hole_2_length = 1
hole_2_height = 1

# Walls

bpy.ops.mesh.primitive_cube_add(
    enter_editmode=False,
    align='WORLD',   
    location=wall_1_location,
    scale=wall_1_scale)
    
bpy.context.object.name = "Wall 1"

# As Sam had already done "Wall_1" can be assigned to a variable.
wall_1 = bpy.context.scene.objects['Wall 1']

# Holes

# NOTE THIS CODE HAD AN ERROR (AND STILL HAS AN ERROR see below)
# As the hole start should be relative to the wall.
# So this code:
#hole_1_location = (hole_1_x_start + hole_1_length / 2,
#                   0,
#                   hole_1_z_start + hole_1_height / 2)
#                   
#hole_1_scale = (hole_1_length / 2, 0.1, hole_1_height / 2)                   
# Was replaced with
wall_1_x_start = wall_1.location[0] - wall_1.dimensions[0]/2 # How cool that python vector positions start at 0!!!
wall_1_y_start = wall_1.location[1] - wall_1.dimensions[1]/2
wall_1_z_start = wall_1.location[2] - wall_1.dimensions[2]/2
hole_1_location = (wall_1_x_start + hole_1_x_start + hole_1_length / 2,
                   wall_1.location[1],
                   wall_1_z_start + hole_1_z_start + hole_1_height / 2)
                   
hole_1_scale = (hole_1_length / 2, wall_1.dimensions[1]/2 , hole_1_height / 2)
# NOTE THERE IS STILL AN ERROR this solution currently takes no notice of rotation!!!
# Note we can access the walls rotation from wall_1.rotation_euler note. This needs an
# understanding of blender rotation modes. 
# See https://docs.blender.org/manual/en/latest/advanced/appendices/rotations.html
# An interesting point is how much of this stuff should be done in R especially
# as we know the wall start vector in with the R data.

bpy.ops.mesh.primitive_cube_add(
            enter_editmode=False,
            align='WORLD',   
            location=hole_1_location,
            scale=hole_1_scale)

bpy.context.object.name = "Hole 1"

# We can now assign that object to a variable
hole_1 = bpy.context.scene.objects['Hole 1']

# Once we have done that we can use the varaible to replace any thing in bpy.context.scene.object. So    
# bpy.context.object.display_type = 'WIRE'
# bpy.context.object.hide_render = True
# can be replaced with
hole_1.display_type = 'WIRE'
hole_1.hide_render = True

bpy.context.view_layer.objects.active = wall_1 #set the active object to wall_1 ready to add the modifier.
bpy.ops.object.modifier_add(type='BOOLEAN') #Add the modifier in this context
bpy.context.object.modifiers["Boolean"].name = "hole_1_mod" #Name the modifier
modifier_1 = bpy.context.object.modifiers["hole_1_mod"] #Assign the modifier to a variable
modifier_1.operation = 'DIFFERENCE' #Make sure the operation is difference
modifier_1.object = hole_1 #Set the other object to be hole_1
# NOTE moderfier_1 variable was used to replace the slightly longer code
# be interesting to see if the second hole creates a problem.
# bpy.context.object.modifiers["Boolean"].operation = 'DIFFERENCE'
# bpy.context.object.modifiers["Boolean"].object = hole_1

# TODO Create the second hole.

hole_2_location = (wall_1_x_start + hole_2_x_start + hole_2_length / 2,
                   wall_1.location[1],
                   wall_1_z_start + hole_2_z_start + hole_2_height / 2)

hole_2_scale = (hole_2_length / 2, wall_1.dimensions[1]/2 , hole_2_height / 2)

bpy.ops.mesh.primitive_cube_add(
            enter_editmode=False,
            align='WORLD',
            location=hole_2_location,
            scale=hole_2_scale)

bpy.context.object.name = "Hole 2"

hole_2 = bpy.context.scene.objects['Hole 2']

hole_2.display_type = 'WIRE'
hole_2.hide_render = True

bpy.context.view_layer.objects.active = wall_1
bpy.ops.object.modifier_add(type='BOOLEAN')
bpy.context.object.modifiers["Boolean"].name = "hole_2_mod"
modifier_2 = bpy.context.object.modifiers["hole_2_mod"]
modifier_2.operation = 'DIFFERENCE'
modifier_2.object = hole_2

# Sams old code
#bpy.ops.outliner.item_activate(deselect_all=True)
#bpy.context.view_layer.objects.active = bpy.data.objects['Wall 1']
#bpy.data.objects['Wall 1'].select_set(True)

#Save the generated file
# bpy.ops.wm.save_as_mainfile(filepath="blender/create-hole-example.blend")


