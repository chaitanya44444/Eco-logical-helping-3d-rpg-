class_name Quest extends QuestManager


func start_quest():
	if quest_status==Quest_status.available:
		quest_status=Quest_status.started
		QuestBox.visible=true
		QuestTitle.text =quest_name
		QuestDiscription.text=quest_discription
func reached_goal():
	if quest_status==Quest_status.started:
		quest_status=Quest_status.reached_goal
		QuestDiscription.text=quest_discription
func finished_goal():
	if quest_status==Quest_status.reached_goal:
		quest_status=Quest_status.finished
		QuestBox.visible= false
		xp.text = str(int(xp.text) + rewardedhelp)
	
