extends Label
@onready var timer: Timer = $"../Timer"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float) -> void:
	text = str(snapped(timer.time_left,0.1))
	pass
