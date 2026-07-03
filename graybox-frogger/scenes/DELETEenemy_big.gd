extends CharacterBody2D
#NOT USED
func _physics_process(_delta: float) -> void:
	move_and_slide()#this is needed so enemies don't overlap each other 
