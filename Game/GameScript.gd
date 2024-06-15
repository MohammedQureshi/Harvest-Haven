extends Node2D

@onready var pause_menu = $Player/Camera2D/PauseMenu

var paused = false

func _process(delta):
	if Input.is_action_just_pressed("escape"):
		pause(paused)
	
func pause(state):
	if state:
		pause_menu.hide()
		get_tree().paused = false

	else:
		pause_menu.show()
		get_tree().paused = true
	
