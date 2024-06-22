extends Node

const SERVER_PORT = 8642
const SERVER_IP = "127.0.0.1"

var multiplayer_scene = preload("res://Multiplayer/MultiplayerPlayer/MultiplayerPlayerScene.tscn")
var is_multiplayer = false
var is_host = false

var _players_spawn_node

func host_game():
	print("Hosting game")
	
	_players_spawn_node = get_tree().get_current_scene().get_node("Players")

	var server_peer = ENetMultiplayerPeer.new()
	server_peer.create_server(SERVER_PORT)
	
	multiplayer.multiplayer_peer = server_peer
	multiplayer.peer_connected.connect(_add_player_to_game)
	multiplayer.peer_disconnected.connect(_del_player_from_game)
	
	_remove_single_player()
	
	_add_player_to_game(1)
	
func join_hosted_game():
	print("Joined hosted game")
	
	var client_peer = ENetMultiplayerPeer.new()
	client_peer.create_client(SERVER_IP, SERVER_PORT)
	multiplayer.multiplayer_peer = client_peer
	
	_remove_single_player()

func _add_player_to_game(id: int):
	print("Player %s joined the game!" % id)
	
	var player_to_add = multiplayer_scene.instantiate()
	player_to_add.player_id = id
	player_to_add.name = str(id)
	
	_players_spawn_node.add_child(player_to_add, true)

func _del_player_from_game(id: int):
	print("Player %s left the game" % id)
	if not _players_spawn_node.has_node(str(id)):
		return 
	_players_spawn_node.get_node(str(id)).queue_free()
	
func _remove_single_player():
	print("Remove single player")
	var player_to_remove = get_tree().get_current_scene().get_node("Player")
	player_to_remove.queue_free()
