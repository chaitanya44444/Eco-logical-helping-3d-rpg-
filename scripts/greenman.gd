extends StaticBody3D
#@onready var quest: Quest = %"Talk-to tree"

#@onready var talk_to_village_chief: Quest = $"talk to village chief"
#@onready var progress_bar_3: ProgressBar = %ProgressBar3
#@onready var xpvalue_3: RichTextLabel = %xpvalue3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#talk_to_village_chief.start_quest()
	
	Dialogic.signal_event.connect(_on_dialogic_signal)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func interact():
	get_node("/root/" + get_tree().current_scene.name + "/the_hero").velocity.x = 0
	get_node("/root/" + get_tree().current_scene.name + "/the_hero").velocity.z = 0
	get_node("/root/" + get_tree().current_scene.name + "/the_hero").canmove = false
	
	Dialogic.start("npc2")
	
		
func _on_dialogic_signal(argument: String):
	if argument == "npc2 ended":
#		talk_to_village_chief.finished_goal()
		
#		progress_bar_3.value+=10
#		xpvalue_3.text=str(int(int(xpvalue_3.text) + 1))
#		quest.start_quest()
		
		print("yayyaya")
	if argument == "npc2 ended":
		
		get_node("/root/" + get_tree().current_scene.name + "/the_hero").canmove = true
		
	
