extends StaticBody3D
var helped = false
var speed = 1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if helped == true:
		
		$Path3D/PathFollow3D.progress += speed * delta
	
func interact():
	helped == true
