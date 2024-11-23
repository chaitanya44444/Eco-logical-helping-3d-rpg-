extends RayCast3D
var interact
func _ready() -> void:
	interact = get_node("/root/" + get_tree().current_scene.name + "/Uiformakinscenesortoff/interacttext")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_colliding():
		var hit = get_collider()
		if hit.has_method("interact"):
			interact.visible = true
			if Input.is_action_just_pressed("interact"):
				hit.interact()
		else:
			interact.visible = false
	else:
		interact.visible = false
	
