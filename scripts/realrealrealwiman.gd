extends StaticBody3D
@onready var quest: Quest = %"Talk-to tree"

@onready var talk_to_village_chief: Quest = $"talk to village chief"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	talk_to_village_chief.start_quest()
	
	Dialogic.signal_event.connect(_on_dialogic_signal)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func interact():
	get_node("/root/" + get_tree().current_scene.name + "/the_hero").velocity.x = 0
	get_node("/root/" + get_tree().current_scene.name + "/the_hero").velocity.z = 0
	get_node("/root/" + get_tree().current_scene.name + "/the_hero").canmove = false
	talk_to_village_chief.finished_goal()
	Dialogic.start("npc1")
	
		
func _on_dialogic_signal(argument: String):
	if argument == "npc ended":
		quest.start_quest()
		
		print("yayyaya")
		get_node("/root/" + get_tree().current_scene.name + "/the_hero").canmove = true
		
	
