extends RayCast3D
@onready var trees_planted: Label = $"ui stuff more/trees planted"
const SAPLING = preload("res://scenes/sapling.tscn")
var interact: Control  # Declare the interact UI reference
var ray_length = 1000
var space_state



var camera : Camera3D
var plant_scene = preload("res://scenes/tree.tscn")  # Preload the plant scene (seed or crop)
const SEED = preload("res://scenes/seed.tscn")
func _ready() -> void:
	# Initialize the interact UI node reference
	interact = get_node("/root/" + get_tree().current_scene.name + "/Uiformakinscenesortoff/interacttext")

	# Get the default active camera from the current viewport
	camera = get_viewport().get_camera_3d()

	if camera == null:
		print("No active camera found!")
		return  # Exit if no active camera is found

	space_state = get_world_3d().direct_space_state

func _process(delta: float) -> void:
	if is_colliding():
		var hit = get_collider()  # Get the object the raycast is colliding with
		
		# Check if the collider is valid and has the interact method
		if hit and hit.has_method("interact"):
			interact.visible = true  # Show interact text
			if Input.is_action_just_pressed("interact"):
				hit.interact()  # Call the interact method on the collider
		else:
			interact.visible = false  # Hide interact text if no interactable collider
	else:
		interact.visible = false  # Hide interact text when not colliding

	# Check if the "plant" action is triggered
	if Input.is_action_just_pressed("plant"):
		plant()  # Call the plant function when the player presses the plant action

# Function to plant a seed (or crop) 5 meters away from the player
func plant():
	if camera == null:
		print("No active camera found!")
		return

	var mouse_pos = get_viewport().get_mouse_position()

	var origin = camera.project_ray_origin(mouse_pos)
	var direction = camera.project_ray_normal(mouse_pos) * ray_length
	var end = origin + direction


	var query = PhysicsRayQueryParameters3D.create(origin, end)
	query.collide_with_areas = true  # You can change this depending on what you want to collide with

	# Perform the raycast
	var result = space_state.intersect_ray(query)

	if result:
		var hit_collider = result.collider
		if hit_collider and hit_collider is StaticBody3D:


			# Instance the plant scene and place it at the point the ray hits
			var seed_instance = SEED.instantiate()
			get_tree().get_root().add_child(seed_instance)
			seed_instance.global_transform.origin = result.position
			seed_instance.rotate_y(randf_range(0.0, TAU))
			seed_instance.scale = Vector3.ONE * randf_range(0.9, 1.1)
			await get_tree().create_timer(5.0).timeout
			seed_instance.queue_free()
			
			var sapling_instance = SAPLING.instantiate()
			get_tree().get_root().add_child(sapling_instance)
			sapling_instance.global_transform.origin = result.position
			sapling_instance.rotate_y(randf_range(0.0, TAU))
			sapling_instance.scale = Vector3.ONE * randf_range(0.9, 1.1)
			await get_tree().create_timer(5.0).timeout
			sapling_instance.queue_free()

			
			
			
			var plant_instance = plant_scene.instantiate()
			get_tree().get_root().add_child(plant_instance)

			# Position the plant at the point where the ray hit
			plant_instance.global_transform.origin = result.position
			plant_instance.rotate_y(randf_range(0.0, TAU))
			plant_instance.scale = Vector3.ONE * randf_range(0.9, 1.1)
			GameManager.trees+=1
			
			
