extends Control

const GAME_SCENE_PATH = "res://Game/Game.tscn";
const MULTIPLAY_MENU_PATH = "res://Multiplayer/MultiplayerMenuScene.tscn"

func _ready():
	get_tree().paused = false;

func _process(delta):
	pass

func _on_new_game_pressed():
	get_tree().change_scene_to_file(GAME_SCENE_PATH)
	
func _on_multiplayer_pressed():
	get_tree().change_scene_to_file(MULTIPLAY_MENU_PATH)
	
func _on_exit_pressed():
	get_tree().quit()

