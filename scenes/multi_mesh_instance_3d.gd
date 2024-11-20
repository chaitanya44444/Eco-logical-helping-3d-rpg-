extends MultiMeshInstance3D

@export var source_mesh: Mesh  # Mesh to generate collision shapes
@export var collision_layer: int = 1  # Collision layer
@export var collision_mask: int = 1   # Collision mask

func _ready():
	generate_collision_shapes()

# Function to generate collision shapes for all MultiMesh instances
func generate_collision_shapes():
	var multi_mesh = self.multimesh
	if multi_mesh == null or source_mesh == null:
		print("MultiMesh or source_mesh is not set.")
		return

	for i in range(multi_mesh.instance_count):
		var instance_transform = multi_mesh.get_instance_transform(i)
		
		# Create a StaticBody3D for each instance
		var static_body = StaticBody3D.new()
		static_body.transform = instance_transform
		static_body.collision_layer = collision_layer
		static_body.collision_mask = collision_mask
		add_child(static_body)

		# Create a CollisionShape3D and attach it to the StaticBody3D
		var collision_shape = CollisionShape3D.new()
		static_body.add_child(collision_shape)

		# Generate a collision shape based on the source_mesh
		var shape = create_collision_shape_from_mesh(source_mesh)
		if shape != null:
			collision_shape.shape = shape
		else:
			print("Failed to create collision shape for instance ", i)

# Helper function to create a collision shape from a mesh
func create_collision_shape_from_mesh(mesh: Mesh) -> Shape3D:
	if mesh is ArrayMesh:
		return mesh.create_convex_shape()  # Prefer convex shapes for better performance
	elif mesh is PrimitiveMesh:
		return mesh.create_trimesh_shape()  # Use trimesh shapes if convex is not viable
	return null
