extends Area2D

var interactable = false

@onready var dialog_name = get_parent().dialog_name

func _physics_process(delta):
	if dialog_name == null:
		dialog_name = get_parent().dialog_name
	if interactable and Input.is_action_just_pressed("interact"):
		get_tree().paused = true
		await Dialogic.start(dialog_name)
		get_tree().paused = false		
		return

func _on_body_entered(body):
	if body.name == "player":
		interactable = true
		body.get_node("Question-mark").visible = true


func _on_body_exited(body):
	if body.name == "player":
		interactable = false
		body.get_node("Question-mark").visible = false
