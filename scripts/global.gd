extends Node

var player_current_attack = false

var current_scene = "world"
var transition_scene = false

var player_exit_cliffside_posx = 358
var player_exit_cliffside_posy = 18
var player_start_posx = 39
var player_start_posy = 103

var game_first_loadin = true

var can_move = true

func finish_changescenes():
	if transition_scene:
		transition_scene = false
		if current_scene == "world":
			current_scene = "cliff_side"
		else:
			current_scene = "world"
