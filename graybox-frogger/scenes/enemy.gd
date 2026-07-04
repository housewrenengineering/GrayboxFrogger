extends CharacterBody2D

func _on_area_2d_body_entered(body: Node2D) -> void:
	if (typeof(body) == 24):
		#print("hit by enemy! game over")
		body.game_over = true
	pass


func _on_area_2d_body_exited(body: Node2D) -> void:
	if (typeof(body) == 24):
		body.game_over = false
	pass # Replace with function body.
