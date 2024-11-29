extends Node3D
@onready var ray_cast_3d: RayCast3D = $head/Camera3D/RayCast3D
@onready var xpvalue_3: RichTextLabel = %xpvalue3
@onready var progress_bar_3: ProgressBar = %ProgressBar3

@onready var forest_cover: Quest = $"forest cover"
@onready var trees_planted: Label = $"ui stuff more/trees planted" # label with progress of trees
@onready var birdhelp: Quest = $tree/birdhelp

@onready var fishquest: Quest = $tree/fishquest
@onready var the_hero: CharacterBody3D = $the_hero

@onready var plamnt_tree: Label = $"ui stuff more/plamnt tree" # label will text press p to plant
var lol=0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	
	SimpleGrass.set_interactive(true)

@onready var talk_after_factory: Quest = $"tree/talk after factory"
@onready var factoy_quest: Quest = $"tree/Factoy-quest"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var trees= GameManager.trees
	if	trees_planted.visible==true:
		plamnt_tree.visible=true
		var tree1=str(trees)
		trees_planted.text=str("You have planted " + str(tree1) +" trees out of 15 needed.")
		if trees>=15:
			plamnt_tree.visible = false
			trees_planted.visible=false
			progress_bar_3.value=80
			xpvalue_3.text=str(3)
			forest_cover.finished_goal()
			birdhelp.start_quest()


func _on_switch_button_2_switchoff() -> void:
	
	await get_tree().create_timer(3.0).timeout
	$AnimationPlayer.play("pollutionisgone")
	$endcamera.current = true
	await get_tree().create_timer(4.0).timeout
	$AnimationPlayer.play("end camera")
	await get_tree().create_timer(30.0).timeout	
	factoy_quest.finished_goal()
	
	#await get_tree().create_timer(9.0).timeout	

	talk_after_factory.start_quest()
	get_node("/root/" + get_tree().current_scene.name + "/the_hero").canmove = true
	get_node("/root/" + get_tree().current_scene.name + "/the_hero/head/Camera3D").current = true
	the_hero.teleport_to_start()
	
