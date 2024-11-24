class_name Quests_Manager
extends Node
@onready var Quest_box: CanvasLayer = $"quest box"
@onready var xp: Label = $"1/Label2"

@onready var QuestTitle: RichTextLabel = $"quest box/RichTextLabel"
@onready var Questdis: RichTextLabel = $"quest box/RichTextLabel2"


@export_group("Quest Settings")

@export var quest_name: String
@export var quest_discription: String
@export var quest_reached_goal: String


enum Quest_status{
	available,
	started,
	reached_goal,
	finished,
	
	
	
}

@export var quest_status: Quest_status= Quest_status.available

@export_group("Reward")
@export var rewardedhelp: int
