extends CharacterBody2D

const SPEED = 70.0
var direction = Vector2.ZERO
var do_attack = false
var current_health: int = 3

@onready var animated_sprite = $AnimatedSprite2D

@export var player_id := 1:
	set(id):
		player_id = id
		%InputSynchronizer.set_multiplayer_authority(id)

@export var custom_velocity := Vector2.ZERO:
	set(new_velocity):
		custom_velocity = new_velocity
		velocity = custom_velocity
		move_and_slide()

func _ready():
	if multiplayer.get_unique_id() == player_id:
		$Camera2D.make_current()
	else:
		$Camera2D.enabled = false
		
func _apply_animations(delta):

	if velocity.x > 0:
		animated_sprite.flip_h = false;
	elif velocity.x < 0:
		animated_sprite.flip_h = true;
		
	if do_attack:
		animated_sprite.play("attack")
		await animated_sprite.animation_finished
		do_attack = false;
	elif velocity.x == 0 and velocity.y == 0 and not do_attack: 
		animated_sprite.play("idle")
	elif velocity.x > 0 or velocity.x < 0 and not do_attack:
		animated_sprite.play("run-x")

func _apply_movement_from_input(delta):
	
	#if do_attack:
		#do_attack = false
		
	#if Input.is_action_just_pressed("escape"):
		
	
	direction = %InputSynchronizer.input_direction
	
	custom_velocity = direction * SPEED

	move_and_slide()

func _physics_process(delta):
	if multiplayer.is_server():
		_apply_movement_from_input(delta)
		
	if not multiplayer.is_server() || MultiplayerManager.is_host:
		_apply_animations(delta)
		

