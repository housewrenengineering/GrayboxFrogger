extends Area2D

@onready var bad_path: Area2D = %BadPath
var player : Player 
var activePath : Path2D

func _physics_process(delta: float) -> void:
	if (player):
		player.position.x += delta * activePath.speed_multiplier * activePath.speed_direction
	#print(bad_path.monitoring)
	pass
	

func _on_body_entered(_body: Node2D) -> void:	
	player = _body
	_body.on_good_path = true
	print("good path enetered")
	bad_path.set_deferred("monitoring", false)
	bad_path.monitoring = false
	activePath = get_parent().get_parent()
	pass 


func _on_body_exited(_body: Node2D) -> void:	
	if (_body == player) :
		#print("good path exited by player")		
		player = null
		#bad_path.set_deferred("monitoring", true)
		_body.on_good_path = false
		bad_path.monitoring = true
		activePath = null
	pass 
