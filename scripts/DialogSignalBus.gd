extends Node

var interactable = false
var player = null

signal turn_question_mark_on

func _ready():
	Dialogic.signal_event.connect(_on_dialogic_signal)

# get signal from interact_area
func _on_interact_area_start(dialog_name, playerNode):
	player = playerNode
	player.get_node("Question-mark").visible = false
	global.can_move = false
	Dialogic.start(dialog_name)
	Dialogic.timeline_ended.connect(_on_my_timeline_ended)
		
func _on_my_timeline_ended():
	Dialogic.timeline_ended.disconnect(_on_my_timeline_ended)
	global.can_move = true
	# emit to interact_area to player_question_mark to false -> emit to _turn_on_question_mark()
	player.get_node("Question-mark").visible = true
	#emit_signal("turn_question_mark_on")
	
func _on_dialogic_signal(argument:String):
	if argument == "activate_something":
		print("Haiya")
		player.health -= 100
