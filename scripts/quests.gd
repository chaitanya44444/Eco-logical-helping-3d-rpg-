class_name quests extends Quests_Manager

func start_quest():
	if quest_status==Quest_status.available:
		quest_status=Quest_status.started
		
		Quest_box.visible= true
		QuestTitle.text = quest_name
		Questdis.text= quest_discription
		
func reached_goal():
	if quest_status==Quest_status.started:
		quest_status=Quest_status.reached_goal
		Questdis.text = quest_reached_goal
		
func finish_goal():
	if quest_status==Quest_status.reached_goal:
		quest_status=Quest_status.finished
		Quest_box.visible = false

		xp.text = str(int(xp.text) + rewardedhelp)
		


		
	
