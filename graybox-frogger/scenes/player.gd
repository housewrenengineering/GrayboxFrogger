extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const TILE_SIZE = 32


func _physics_process(delta: float) -> void:
	
	
	if Input.is_action_just_pressed("up"):
		move_up()
	if Input.is_action_just_pressed("down"):
		move_down()
	if Input.is_action_just_pressed("left"):
		move_left()
	if Input.is_action_just_pressed("right"):
		move_right()

	
	
	
func move_up() -> void: 
	position.y -= TILE_SIZE
	move_and_slide()
	
func move_down() -> void: 
	position.y += TILE_SIZE
	move_and_slide()
	
func move_left() -> void: 
	position.x -= TILE_SIZE
	move_and_slide()
	
func move_right() -> void: 
	position.x += TILE_SIZE
	move_and_slide()
