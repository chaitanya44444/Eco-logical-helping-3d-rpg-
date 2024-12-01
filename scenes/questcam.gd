extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.signal_event.connect(_on_dialogic_signal)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func _on_dialogic_signal(argument: String):
	
	if argument =="npc2 ended1":
		$Camera3D.current = true
		$AnimationPlayer.play("fish quest")
		await get_tree().create_timer(6.0).timeout
		$"../the_hero/head/Camera3D".current = true
	if argument =="tree":
		$Camera3D.current = true
		$AnimationPlayer.play("factory quest")
		await get_tree().create_timer(4.0).timeout
		$"../the_hero/head/Camera3D".current = true
