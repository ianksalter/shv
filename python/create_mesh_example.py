import bpy

vertices = [(0,0,0)]
edges = []
faces = []

new_mesh = bpy.data.meshes.new("new_mesh")
new_mesh.from_pydata(vertices, edges, faces)
new_mesh.update()

#make an object from the mesh
new_object = bpy.data.objects.new("new_object", new_mesh)

view_layer = bpy.context.view_layer
view_layer.active_layer_collection.collection.objects.link(new_object)

bpy.ops.mesh.primitive_cube_add(
    enter_editmode=False,
    align='WORLD',
    location=(1.13368, 3.31886, 1.64755),
    scale=(1, 1, 1))

