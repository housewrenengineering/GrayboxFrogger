class_name Player 
extends CharacterBody2D


const TILE_SIZE = 32
var game_over : bool = false #used to trigger game over by enemy hit 
var on_good_path : bool = false

func _physics_process(_delta: float) -> void:	
	if Input.is_action_just_pressed("up"):
		move_up()
	if Input.is_action_just_pressed("down"):
		move_down()
	if Input.is_action_just_pressed("left"):
		move_left()
	if Input.is_action_just_pressed("right"):
		move_right()
	move_and_slide()
	
	
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
