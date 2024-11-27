extends Node3D


@onready var fishquest: Quest = $tree/fishquest
@onready var the_hero: CharacterBody3D = $the_hero

# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	
	SimpleGrass.set_interactive(true)

@onready var talk_after_factory: Quest = $"tree/talk after factory"
@onready var factoy_quest: Quest = $"tree/Factoy-quest"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


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
	
