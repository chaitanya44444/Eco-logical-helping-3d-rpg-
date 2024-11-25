extends Node3D



# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	
	SimpleGrass.set_interactive(true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_switch_button_2_switchoff() -> void:
	
	await get_tree().create_timer(3.0).timeout
	$AnimationPlayer.play("pollutionisgone")
	$endcamera.current = true
	await get_tree().create_timer(4.0).timeout
	$AnimationPlayer.play("end camera")
	await get_tree().create_timer(30.0).timeout
	get_tree().quit()
	
