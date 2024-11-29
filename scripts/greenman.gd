extends StaticBody3D
#@onready var quest: Quest = %"Talk-to tree"
@onready var fishquest: Quest = $"../../tree/fishquest"
var a = 0
@onready var polluted: MeshInstance3D = $"../../Lake/polluted"
@onready var progress_bar_3: ProgressBar = %ProgressBar3
@onready var xpvalue_3: RichTextLabel = %xpvalue3
@onready var the_hero: CharacterBody3D = $"../../the_hero"
var cleanse_scene = preload("res://cleanse.tscn")

func apply_cleanse():

	var cleanse_instance = cleanse_scene.instantiate()
	
	the_hero.add_child(cleanse_instance)
	
	cleanse_instance.transform.origin = Vector3.ZERO  
	
	await get_tree().create_timer(4).timeout

	cleanse_instance.queue_free()


#@onready var talk_to_village_chief: Quest = $"talk to village chief"
#@onready var progress_bar_3: ProgressBar = %ProgressBar3
#@onready var xpvalue_3: RichTextLabel = %xpvalue3
@onready var label: Label = $"../../ui stuff more/Label"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#talk_to_village_chief.start_quest()
	
	Dialogic.signal_event.connect(_on_dialogic_signal)




func _input(event: InputEvent) -> void:
		#the_hero.use_magic() never mind i removed this cuz better performance vfrom above way
		
	if fishquest.ifstarted():
		label.visible=true
		if Input.is_action_pressed("Cleanse"):
			apply_cleanse()
			print("cleanse lake applied")
			
			a+=1
			if a==4:
				polluted.queue_free()
				
				
				fishquest.finished_goal()
				xpvalue_3.text=str(int(int(xpvalue_3.text) + 1))
				progress_bar_3.value=90
	else:
		label.visible=false
				
			
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
		

#		
#		quest.start_quest()
		
		print("yayyaya")
	if argument == "npc2 ended":
		
		get_node("/root/" + get_tree().current_scene.name + "/the_hero").canmove = true
		
	
