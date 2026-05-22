extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	prepare_world()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func prepare_world() -> void:
	%Player.position = %StartingPoint.global_position
	pass


func _on_wall_left_body_entered(body: Node2D) -> void:
	print("*")
	pass # Replace with function body.


func _on_button_up_pressed() -> void:
	%Player.move_up()
	pass # Replace with function body.


func _on_button_left_pressed() -> void:
	%Player.move_left()
	pass # Replace with function body.


func _on_button_down_pressed() -> void:
	%Player.move_down()
	pass # Replace with function body.


func _on_button_right_pressed() -> void:
	%Player.move_right()
	pass # Replace with function body.
