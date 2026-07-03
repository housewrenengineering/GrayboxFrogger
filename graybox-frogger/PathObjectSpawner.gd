extends Node

const DIFF_SPACE : float = 0.30
var array_starting_positions : Array[float]
var pathControl : Control 
var tf : bool = false

func _ready() -> void:
	pass 

func _physics_process(delta: float) -> void:
	if (pathControl):
		for path : Path2D in pathControl.get_children():
			#print(path.name)
			for follow : PathFollow2D in path.get_children():
				#print(follow.name)
				follow.progress += delta * path.speed_multiplier
	pass

func inital_map_load( pathParent : Control ) -> void:
	#sets path follow objects at random spots on path to start and global PathControl
	#update to get total number of children per row, 
	#get all three random numbers and sort by order,
	#ensure correct spacing between objects 
	if (pathParent):
		#print("Initial Map Load begin")
		pathControl = pathParent
		for path : Path2D in pathControl.get_children():
			#print(path.name)
			var c = path.get_children().size()
			for i in range(c):
				array_starting_positions.append(randf_range(0.0,1.0))
			array_starting_positions.sort()
			for i : int in array_starting_positions.size()-1:
				var diff : float = abs(array_starting_positions[i] - array_starting_positions[i+1])
				if (diff < DIFF_SPACE):
					array_starting_positions[i+1] += DIFF_SPACE
				pass
			#print("final array: " + str(array_starting_positions))
			var x : int = 0
			for follow : PathFollow2D in path.get_children():
				if (array_starting_positions[x] > 1):
					array_starting_positions[x] -= 1
				follow.progress_ratio = array_starting_positions[x] 
				x += 1
			array_starting_positions.clear()
	pass
