extends Control

const GAME_SCENE_PATH = "res://Game/Game.tscn"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_host_pressed():
	MultiplayerManager.is_multiplayer = true
	MultiplayerManager.is_host = true
	get_tree().change_scene_to_file(GAME_SCENE_PATH)


func _on_join_pressed():
	MultiplayerManager.is_multiplayer = true
	MultiplayerManager.is_host = false
	get_tree().change_scene_to_file(GAME_SCENE_PATH)
