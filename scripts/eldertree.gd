extends StaticBody3D
@onready var progress_bar_3: ProgressBar = %ProgressBar3
@onready var xpvalue_3: RichTextLabel = %xpvalue3
var a = true
@onready var talk_to_tree: Quest = %"Talk-to tree"
var questdone=false
var questdone2=false
var questdone3=false

@onready var trees_planted: Label = $"../ui stuff more/trees planted"

@onready var forest_cover: Quest = $"../forest cover"


@onready var talk_to_tree_for_planting_one: Quest = $"../npc/fisher/talk to tree for planting one"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.signal_event.connect(_on_dialogic_signal)
@onready var factoy_quest: Quest = $"Factoy-quest"

@onready var fishquest: Quest = $fishquest
@onready var talk_after_factory: Quest = $"talk after factory"

# Called every frame. 'delta' is the elapsed time since the previous frame.
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_released("skip"):
		talk_to_tree.finished_goal()

		if questdone==false:
			xpvalue_3.text=str(int(int(xpvalue_3.text) + 1))
			questdone=true
	
		factoy_quest.start_quest()
		
func interact():
	get_node("/root/" + get_tree().current_scene.name + "/the_hero").velocity.x = 0
	get_node("/root/" + get_tree().current_scene.name + "/the_hero").velocity.z = 0
	get_node("/root/" + get_tree().current_scene.name + "/the_hero").canmove = false
	
	if talk_after_factory.ifstarted()==true and  questdone2==false:
		Dialogic.start("talkafter")
	elif talk_to_tree.ifstarted()==true  and questdone==false: 
		
		Dialogic.start("elder tree")
	elif talk_to_tree_for_planting_one.ifstarted()==true  and questdone3==false: 
		print("yes1")
		Dialogic.start("planter")
	elif GameManager.q5==true:
		print("yes2")
		Dialogic.start("planter")
		
	else:
		print("yes")
		Dialogic.start("planter")
	

func _on_dialogic_signal(argument: String):
	if argument =="planter1":
		talk_to_tree_for_planting_one.finished_goal()
		forest_cover.start_quest()
		trees_planted.visible=true
		if questdone3==false:
			xpvalue_3.text=str(5)
			

			questdone3=true
		get_node("/root/" + get_tree().current_scene.name + "/the_hero").canmove = true

			
	if argument == "talked_after":
		
		talk_after_factory.finished_goal()
		if questdone2==false:
			xpvalue_3.text=str(4)

			fishquest.start_quest()
			$"../quest camera/Camera3D".current = true
			$"../quest camera/AnimationPlayer".play("fish quest")
			await get_tree().create_timer(6.0).timeout
			$"../the_hero/head/Camera3D".current = true
			questdone2=true
		get_node("/root/" + get_tree().current_scene.name + "/the_hero").canmove = true
	if argument == "tree":
		talk_to_tree.finished_goal()

		if questdone==false:
			xpvalue_3.text=str(2)
			questdone=true
	
		factoy_quest.start_quest()
		print("yayyaya")
		get_node("/root/" + get_tree().current_scene.name + "/the_hero").canmove = true
		
	
