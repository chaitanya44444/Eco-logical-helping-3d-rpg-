extends RayCast3D
# assigning 
# variables
@onready var the_hero: CharacterBody3D = $"../../.."

@onready var trees_planted: Label = $"ui stuff more/trees planted"
const SAPLING = preload("res://scenes/sapling.tscn")
var interact: Control 
var ray_length = 1000
var space_state
var camera : Camera3D
var plant_scene = preload("res://scenes/tree.tscn") 
const SEED = preload("res://scenes/seed.tscn")


var cleanse_scene = preload("res://treesd.tres")
var a: int = 0 #pov my notebook progress
var quest_completed: bool = false  
func apply_cleanse():
	var cleanse_instance = cleanse_scene.instantiate()
	the_hero.add_child(cleanse_instance)
	cleanse_instance.transform.origin = Vector3.ZERO
	await get_tree().create_timer(4).timeout
	cleanse_instance.queue_free()
	
	
func _ready() -> void:
	interact = get_node("/root/" + get_tree().current_scene.name + "/Uiformakinscenesortoff/interacttext")

	camera = get_viewport().get_camera_3d()

	if camera == null:
		print("No active camera found!")
		return  

	space_state = get_world_3d().direct_space_state

func _process(delta: float) -> void:
	if is_colliding():
		var hit = get_collider()  
		if hit and hit.has_method("interact"):
			interact.visible = true  
			if Input.is_action_just_pressed("interact"):
				hit.interact()  
		else:
			interact.visible = false  
	else:
		interact.visible = false  
	if Input.is_action_just_pressed("plant"):
		plant()  
func plant():
	if camera == null:
		print("No active camera found!")
		return

	var mouse_pos = get_viewport().get_mouse_position()

	var origin = camera.project_ray_origin(mouse_pos)
	var direction = camera.project_ray_normal(mouse_pos) * ray_length
	var end = origin + direction


	var query = PhysicsRayQueryParameters3D.create(origin, end)
	query.collide_with_areas = true 
	var result = space_state.intersect_ray(query)

	if result:
		var hit_collider = result.collider
		if hit_collider and hit_collider is StaticBody3D:
			GameManager.tr1+=1


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

			plant_instance.global_transform.origin = result.position
			plant_instance.rotate_y(randf_range(0.0, TAU)) # 0,360 basicly(found this on forums)
			plant_instance.scale = Vector3.ONE * randf_range(0.9, 1.1)
			GameManager.trees+=1
			
			
