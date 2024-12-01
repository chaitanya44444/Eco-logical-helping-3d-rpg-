extends StaticBody3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func interact():
	$eaglwdwde_fly_embedded/AnimationPlayer.play("rig|rig|fly")
	await get_tree().create_timer(7.0).timeout
	$"../endcamera".current = true
	$"../AnimationPlayer".play("end camera")
	await get_tree().create_timer(27.0).timeout
	get_tree().quit()
