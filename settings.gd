extends Control

const a =preload("res://scenes/menu.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
		


func _on_volume_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(0,value/5)




		
		


func _on_button_pressed() -> void:
	pass # Replace with function body.


func _on_button_2_button_down() -> void:
	AudioServer.set_bus_mute(2,false) # Replace with function body.


func _on_button_button_down() -> void:
	AudioServer.set_bus_mute(2,true)
