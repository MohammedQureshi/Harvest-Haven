extends Control

@onready var game = $"../../.."

func _on_resume_pressed():
	game.pause(true)

func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://MainMenu/MainMenuScene.tscn");

func _on_quit_pressed():
	get_tree().quit();
