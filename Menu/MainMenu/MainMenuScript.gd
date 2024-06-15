extends Control

func _ready():
	get_tree().paused = false;

func _process(delta):
	pass

func _on_new_game_pressed():
	get_tree().change_scene_to_file("res://scenes/Game.tscn")
	
func _on_exit_pressed():
	get_tree().quit()
