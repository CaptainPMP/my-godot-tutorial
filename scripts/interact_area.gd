extends Area2D

var interactable = false
var player = null

@onready var dialog_name = get_parent().dialog_name

func _physics_process(delta):
	if dialog_name == null:
		dialog_name = get_parent().dialog_name
	if interactable and Input.is_action_just_pressed("interact"):
		global.can_move = false
		player.get_node("Question-mark").visible = false
		Dialogic.start(dialog_name)
		Dialogic.timeline_ended.connect(_on_my_timeline_ended)
		
func _on_my_timeline_ended():
	Dialogic.timeline_ended.disconnect(_on_my_timeline_ended)
	global.can_move = true
	player.get_node("Question-mark").visible = true

func _on_body_entered(body):
	if body is Player:
		player = body
		interactable = true
		player.get_node("Question-mark").visible = true


func _on_body_exited(body):
	if body is Player:
		interactable = false
		player.get_node("Question-mark").visible = false
		player = null
