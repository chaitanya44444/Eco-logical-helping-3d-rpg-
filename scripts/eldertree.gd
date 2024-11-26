extends StaticBody3D
@onready var progress_bar_3: ProgressBar = %ProgressBar3
@onready var xpvalue_3: RichTextLabel = %xpvalue3

@onready var talk_to_tree: Quest = %"Talk-to tree"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.signal_event.connect(_on_dialogic_signal)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func interact():
	get_node("/root/" + get_tree().current_scene.name + "/the_hero").velocity.x = 0
	get_node("/root/" + get_tree().current_scene.name + "/the_hero").velocity.z = 0
	get_node("/root/" + get_tree().current_scene.name + "/the_hero").canmove = false
	
	
	Dialogic.start("elder tree")
	
		
func _on_dialogic_signal(argument: String):
	if argument == "tree":
		talk_to_tree.finished_goal()
		progress_bar_3.value+=10
		xpvalue_3.text=str(int(int(xpvalue_3.text) + 1))
		print("yayyaya")
		get_node("/root/" + get_tree().current_scene.name + "/the_hero").canmove = true
		
	