extends Node2D

@onready var pause_menu = $"UserInterfaces/Pause Menu"

var paused = false

func _ready():
	if MultiplayerManager.is_multiplayer:
		if MultiplayerManager.is_host:
			MultiplayerManager.host_game()
		else:
			MultiplayerManager.join_hosted_game();

func _process(delta):
	if Input.is_action_just_pressed("escape"):
		pause(paused)
	
func pause(state):
		if state:
			pause_menu.hide()
			if not MultiplayerManager.is_multiplayer:
				get_tree().paused = false
		else:
			pause_menu.show()
			if not MultiplayerManager.is_multiplayer:
				get_tree().paused = true
	
