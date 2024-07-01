extends Control

@onready var game = $"../../.."

const MAIN_MENU_SCENE_PATH = "res://Menu/MainMenu/MainMenuScene.tscn"

func _on_resume_pressed():
	if not MultiplayerManager.is_multiplayer:
		game.pause(true)
	$".".visible = false

func _on_main_menu_pressed():
	get_tree().change_scene_to_file(MAIN_MENU_SCENE_PATH);
	if MultiplayerManager.is_multiplayer:
		MultiplayerManager.disconnect_player()

func _on_quit_pressed():
	get_tree().quit();
	
