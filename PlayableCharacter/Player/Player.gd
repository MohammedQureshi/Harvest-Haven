extends CharacterBody2D


const SPEED = 100.0

@onready var animated_sprite = $AnimatedSprite2D


func _physics_process(delta):

	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	velocity = direction * SPEED
	
	if velocity.x == 0 and velocity.y == 0: 
		animated_sprite.play("idle")
	elif velocity.x > 0 or velocity.x < 0:
		animated_sprite.play("run-x")
		
	if velocity.x > 0:
		animated_sprite.flip_h = false;
	elif velocity.x < 0:
		animated_sprite.flip_h = true;
		

	move_and_slide()
