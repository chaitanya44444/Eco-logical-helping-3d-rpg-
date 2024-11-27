extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_volume_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(0,value/5)


func _on_music_off_toggled(toggled_on: bool) -> void:
	AudioServer.set_bus_mute(2,toggled_on)

		
		