extends CharacterBody2D


func _on_area_2d_body_entered(body: Node2D) -> void:
	#print("entered")
	#print(typeof(body)) #=24
	if (typeof(body) == 24):
		#print("hit by enemy! game over")
		#World.game_over()
		body.game_over = true
		pass
	pass # Replace with function body.
