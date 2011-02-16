extends Node2D
var xp = 0
@onready var quest_box: CanvasLayer = $QuestBox
var trees=0
@onready var quest_title: RichTextLabel = $QuestBox/QuestTitle
@onready var questdiscription: RichTextLabel = $QuestBox/Questdiscription

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
