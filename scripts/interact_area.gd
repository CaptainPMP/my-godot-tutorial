extends Area2D

var interactable = false

var dialog_name = get_parent().my_dialog

func _physics_process(delta):
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
