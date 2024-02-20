extends CharacterBody2D

@export var speed = 400

var screen_size
var current_weapon = false

func _ready():
	screen_size = get_viewport_rect().size
	
func pick(item):
	current_weapon = true
	print(current_weapon)	
	
func get_input(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("right"):
		velocity.x += 1
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	if Input.is_action_pressed("down"):
		velocity.y += 1
	if Input.is_action_pressed("up"):
		velocity.y -= 1
		
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
	
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
	if velocity.x != 0:
		if current_weapon == true:
			$AnimatedSprite2D.animation = "gun"
			$AnimatedSprite2D.flip_h = velocity.x < 0	
		else:
			$AnimatedSprite2D.animation = "walk"
			$AnimatedSprite2D.flip_h = velocity.x < 0	
		
	elif velocity.y != 0:
		if current_weapon == true:
			$AnimatedSprite2D.animation = "gun"
			$AnimatedSprite2D.flip_v = velocity.y > 0
		else:
			$AnimatedSprite2D.animation = "up"
			$AnimatedSprite2D.flip_v = velocity.y < 0
		
	
	
func _physics_process(delta):
	get_input(delta)
	move_and_slide()
