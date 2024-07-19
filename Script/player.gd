extends CharacterBody2D

@export var speed = 100
@export var bullet : PackedScene

var bulletTimer : Timer = Timer.new()

var screen_size
var currentWeapone



func _ready():
	screen_size = get_viewport_rect().size
	bulletTimer.wait_time = 0.5
	bulletTimer.one_shot = true
	add_child(bulletTimer)

func shoot():
	bulletTimer.start()
	var b = bullet.instantiate()
	owner.add_child(b)
	b.transform = $Node2D/Marker2D.global_transform


func get_input(delta):
	velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("right"):
		velocity.x += 1
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	if Input.is_action_pressed("down"):
		velocity.y += 1
	if Input.is_action_pressed("up"):
		velocity.y -= 1
	if Input.is_action_pressed("shift"):
		position += velocity * delta * speed
	if Input.is_action_pressed("shoot") and bulletTimer.is_stopped():
		shoot()
	if Input.is_action_pressed("interactive"):
		$AnimatedSprite2D.animation = "gun"

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.animation = "idle"
		
	position += velocity * delta
	if velocity.x != 0:
		$AnimatedSprite2D.animation = "walk"
		$AnimatedSprite2D.flip_v = false
		$AnimatedSprite2D.flip_h = velocity.x < 0
	elif velocity.y < 0:
		$AnimatedSprite2D.animation = "walkUp"
	elif velocity.y > 0:
		$AnimatedSprite2D.animation = "walkDown"	
	
func _process(delta):
	if is_multiplayer_authority():
		$Node2D.look_at(get_global_mouse_position())
		get_input(delta)
	move_and_slide()

func  _enter_tree():
	set_multiplayer_authority(name.to_int())
