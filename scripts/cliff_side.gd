extends Node2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	change_scenes()


func _on_aliffside_exitpoint_body_entered(body):
	if body.has_method("player"):
		global.transition_scene = true


func _on_aliffside_exitpoint_body_exited(body):
	if body.has_method("player"):
		global.transition_scene = false
		
func change_scenes():
	if global.transition_scene:
		if global.current_scene == "cliff_side":
			get_tree().change_scene_to_file("res://scenes/world.tscn")
			global.finish_changescenes()
