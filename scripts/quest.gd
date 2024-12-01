class_name Quest extends QuestManager


func start_quest():
	if quest_status==Quest_status.available:
		
		quest_status=Quest_status.started
		GameManager.visible=true
		QuestBox.visible=true
		QuestTitle.text =str("Quest Title:" + quest_name)
		QuestDiscription.text=str("Quest information: \n " + quest_discription)
func reached_goal():
	if quest_status==Quest_status.started:
		quest_status=Quest_status.reached_goal
		QuestDiscription.text=quest_discription
func finished_goal():
	if quest_status==Quest_status.reached_goal:
		quest_status=Quest_status.finished
		QuestBox.visible= false
		GameManager.quest_box.visible = false
		GameManager.visible=false
		
func ifdone():
	if quest_status==Quest_status.reached_goal:
		return true
func ifstarted():
	if quest_status==Quest_status.started:
		return true
	
	
