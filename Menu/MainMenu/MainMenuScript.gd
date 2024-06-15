extends Control

const GAME_SCENE_PATH = "res://Game/Game.tscn";

func _ready():
	get_tree().paused = false;

func _process(delta):
	pass

func _on_new_game_pressed():
	get_tree().change_scene_to_file(GAME_SCENE_PATH)
	
func _on_exit_pressed():
	get_tree().quit()
