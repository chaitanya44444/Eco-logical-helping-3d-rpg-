extends Node3D

var growth_duration = 10.0  # Time in seconds for seed to grow
const tree = preload("res://scenes/tree.tscn")  # Tree scene

func start_growth():
	# Create and configure the timer
	var timer = Timer.new()
	timer.wait_time = growth_duration
	timer.one_shot = true
	timer.connect("timeout", Callable(self, "_on_growth_complete"))
	add_child(timer)
	timer.start()

func _on_growth_complete():
	# Replace the seed with a tree
	var tree_instance = tree.instantiate()
	get_parent().add_child(tree_instance)
	tree_instance.global_transform.origin = global_transform.origin
	queue_free()  # Remove the seed
