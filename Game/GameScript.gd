extends Node2D

@onready var pause_menu = $Player/Camera2D/PauseMenu

var paused = false

func _ready():
	if MultiplayerManager.is_multiplayer:
		if MultiplayerManager.is_host:
			MultiplayerManager.host_game()
		else:
			MultiplayerManager.join_hosted_game();

func _process(delta):
	if not MultiplayerManager.is_multiplayer:
		if Input.is_action_just_pressed("escape"):
			pause(paused)
	
func pause(state):
	if not MultiplayerManager.is_multiplayer:
		if state:
			pause_menu.hide()
			get_tree().paused = false

		else:
			pause_menu.show()
			get_tree().paused = true
	
