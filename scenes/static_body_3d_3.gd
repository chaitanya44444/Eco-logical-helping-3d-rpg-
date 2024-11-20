extends StaticBody3D

@export var source_mesh: Mesh

func _ready():
	generate_collision_shapes()

# Function to generate collision shapes
func generate_collision_shapes():
	#var multi_mesh = $MultiMeshInstance3D.multimesh
	var multi_mesh = $"..".multimesh

	if multi_mesh == null or source_mesh == null:
		print("MultiMesh or source_mesh is not set.")
		return

	for i in range(multi_mesh.instance_count):
		var instance_transform = multi_mesh.get_instance_transform(i)
		
		# Create a CollisionShape3D for this instance
		var collision_shape = CollisionShape3D.new()
		add_child(collision_shape)
		
		collision_shape.transform = instance_transform
		
		# Assign a collision shape based on the mesh
		var shape = create_collision_shape_from_mesh(source_mesh)
		if shape != null:
			collision_shape.shape = shape
		else:
			print("Failed to create collision shape for instance ", i)

func create_collision_shape_from_mesh(mesh: Mesh) -> Shape3D:
	if mesh is ArrayMesh:
		return mesh.create_convex_shape()
	elif mesh is PrimitiveMesh:
		return mesh.create_trimesh_shape()
	return null
