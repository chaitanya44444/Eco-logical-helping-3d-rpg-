class_name QuestManager extends Node
@onready var QuestBox: CanvasLayer = GameManager.get_node("QuestBox")
@onready var QuestTitle: RichTextLabel = GameManager.get_node("QuestBox").get_node("QuestTitle")

@onready var QuestDiscription: RichTextLabel = GameManager.get_node("QuestBox").get_node("Questdiscription")

@export_group("Quest Settings")
@export var quest_name: String
@export var quest_discription: String
@export var reached_goal_text: String
enum Quest_status{
	available,
	started,
	reached_goal,
	finished,
	
	
	
}
@export var quest_status: Quest_status= Quest_status.available
@export_group("Reward")
@export var rewardedhelp: float
