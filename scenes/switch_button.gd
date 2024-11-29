extends StaticBody3D
@onready var factoy_quest: Quest = $"../../tree/Factoy-quest"
@onready var xpvalue_3: RichTextLabel = %xpvalue3
@onready var progress_bar_3: ProgressBar = %ProgressBar3

signal switchoff
# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	#Dialogic.signal_event.connect(_on_dialogic_signal)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func interact():
	factoy_quest.finished_goal()
	progress_bar_3.value=80
	xpvalue_3.text=str(int(int(xpvalue_3.text) + 1))
	#get_node("/root/" + get_tree().current_scene.name + "/the_hero").velocity.x = 0
	#get_node("/root/" + get_tree().current_scene.name + "/the_hero").velocity.z = 0
	#get_node("/root/" + get_tree().current_scene.name + "/the_hero").canmove = false
	#Dialogic.start("elder tree")
	$Node3D/AnimationPlayer.play("off")
	emit_signal("switchoff")
	await get_tree().create_timer(3.0).timeout
	queue_free()	

	
	
		
#func _on_dialogic_signal(argument: String):
	#if argument == "tree":
	#	print("yayyaya")
	#	get_node("/root/" + get_tree().current_scene.name + "/the_hero").canmove = true
		
	
