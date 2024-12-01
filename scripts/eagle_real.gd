extends StaticBody3D
@onready var birdhelp: Quest = $"../tree/birdhelp"
@onready var ending: Quest = $"../tree/ending"

@onready var xpvalue_3: RichTextLabel = %xpvalue3

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
	birdhelp.finished_goal()
	
	ending.start_quest()
	xpvalue_3.text=str(8)
	$"../AnimationPlayer".play("end camera")
	await get_tree().create_timer(27.0).timeout
	get_tree().quit()
