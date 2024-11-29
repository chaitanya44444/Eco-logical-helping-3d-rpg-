extends StaticBody3D
@onready var talk_to_tree_for_planting_one: Quest = $"talk to tree for planting one"
@onready var number_of_cleanses: Label = $"../../ui stuff more/number of cleanses"
@onready var polluted: MeshInstance3D = $"../../Lake/polluted"

@onready var fishquest: Quest = $"../../tree/fishquest"
@onready var progress_bar_3: ProgressBar = %ProgressBar3
@onready var xpvalue_3: RichTextLabel = %xpvalue3
@onready var the_hero: CharacterBody3D = $"../../the_hero"
@onready var label: Label = $"../../ui stuff more/Label"
var b= false
func _process(delta: float) -> void:
	if Input.is_action_just_released("skip"):
		fishquest.finished_goal()
		talk_to_tree_for_planting_one.start_quest()

var cleanse_scene = preload("res://cleanse.tscn")
var a: int = 0 #pov my notebook progress
var quest_completed: bool = false  
func apply_cleanse():
	var cleanse_instance = cleanse_scene.instantiate()
	the_hero.add_child(cleanse_instance)
	cleanse_instance.transform.origin = Vector3.ZERO
	await get_tree().create_timer(4).timeout
	cleanse_instance.queue_free()

func _ready() -> void:
	Dialogic.signal_event.connect(_on_dialogic_signal)

func _input(event: InputEvent) -> void:
	
	if fishquest.ifstarted() and not quest_completed:
		if b:
			label.visible = true
			number_of_cleanses.visible=true

		if Input.is_action_just_released("Cleanse")==true and b==true:
			apply_cleanse()
			a += 1
			number_of_cleanses.text=str("You have used the magic " + str(a) + " times out of 4 times needed")
			print("Cleanse applied, count:", a)

			if a >= 4:
				polluted.visible = false
				polluted.queue_free()

				quest_completed = true
				polluted.visible = false
				fishquest.finished_goal()
				xpvalue_3.text = str(int(xpvalue_3.text) + 1)
				progress_bar_3.value = 90
				label.visible = false
				talk_to_tree_for_planting_one.start_quest()
				GameManager.q5= true
				if GameManager.q5:
					print("Fish quest completed!")
				else:
					print("idk man")

				

	else:
		label.visible = false
		number_of_cleanses.visible =false


func interact():
	var hero = get_node("/root/" + get_tree().current_scene.name + "/the_hero")
	hero.velocity.x = 0
	hero.velocity.z = 0
	hero.canmove = false
	Dialogic.start("npc2")
	b=true

func _on_dialogic_signal(argument: String):
	if argument == "npc2 ended":
		get_node("/root/" + get_tree().current_scene.name + "/the_hero").canmove = true
