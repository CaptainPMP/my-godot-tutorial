extends Area2D

var interactable = false
var player: Node2D = null

@onready var dialog_name = get_parent().dialog_name

#signal start_dialog

#func _ready():
#	SignalBus.turn_question_mark_on.connect(_turn_on_question_mark)

func _physics_process(delta):
	# send to signal bus to know what is player
	if dialog_name == null: # do not touch
		dialog_name = get_parent().dialog_name
		
	if interactable and Input.is_action_just_pressed("interact"): # press interact
		#player.get_node("Question-mark").visible = false
		# emit _on_interact_area_start()
		DialogSignalBus._on_interact_area_start(dialog_name, player)
		
#func _turn_on_question_mark():
	#print(player)
	#player.get_node("Question-mark").visible = true

func _on_body_entered(body):
	if body is Player:
		player = body
		interactable = true
		player.get_node("Question-mark").visible = true
		print(player)


func _on_body_exited(body):
	print("exit")
	if body is Player:
		interactable = false
		player.get_node("Question-mark").visible = false
		player = null
