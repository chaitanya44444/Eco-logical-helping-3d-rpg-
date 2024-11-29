extends StaticBody3D
@onready var progress_bar_3: ProgressBar = %ProgressBar3
@onready var xpvalue_3: RichTextLabel = %xpvalue3
var a = true
@onready var talk_to_tree: Quest = %"Talk-to tree"
var questdone=false
var questdone2=false
var trees=0
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
func _process(delta: float) -> void:
	if trees_planted.visible==true:
		trees_planted.text=str("You have planted" + str(trees) +"trees out of 15 needed.")
func interact():
	get_node("/root/" + get_tree().current_scene.name + "/the_hero").velocity.x = 0
	get_node("/root/" + get_tree().current_scene.name + "/the_hero").velocity.z = 0
	get_node("/root/" + get_tree().current_scene.name + "/the_hero").canmove = false
	
	if talk_after_factory.ifstarted():
		Dialogic.start("talkafter")
	elif talk_to_tree.ifstarted(): 
		
		Dialogic.start("elder tree")
	if GameManager.q5==true:
		Dialogic.start("plant")
	

func _on_dialogic_signal(argument: String):
	if argument =="plant":
		talk_to_tree_for_planting_one.finished_goal()
		forest_cover.start_quest()
		trees_planted.visible=true
		if questdone3==false:
			xpvalue_3.text=str(int(int(xpvalue_3.text) + 1))
			

			questdone3=true
			
	if argument == "talked_after":
		
		talk_after_factory.finished_goal()
		if questdone2==false:
			xpvalue_3.text=str(int(int(xpvalue_3.text) + 1))

			fishquest.start_quest()
			questdone2=true
		get_node("/root/" + get_tree().current_scene.name + "/the_hero").canmove = true
	if argument == "tree":
		talk_to_tree.finished_goal()

		if questdone==false:
			xpvalue_3.text=str(int(int(xpvalue_3.text) + 1))
			questdone=true
	
		factoy_quest.start_quest()
		print("yayyaya")
		get_node("/root/" + get_tree().current_scene.name + "/the_hero").canmove = true
		
	
