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
	#for each Path, 
	#for each path follow on each path, progress at speed 
	#if at 100, restart at 0 #DOES THIS AUTOMATICALLY! yay
	
	######SKIP THIS #check if total path follows is equal to or above max, then skip
	######SKIP THIS #if not at max, check lowest progress and compare to min distance 
	######SKIP THIS #if above max distance to new, create new path follow
	######SKIP THIS #if above min distance and less than max, at a random time create a new one 
	
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
				#print("i: "+ str(i))
			array_starting_positions.sort()
			#print(array_starting_positions)
			for i : int in array_starting_positions.size()-1:
				#print("i*: "+ str(i))
				var diff : float = abs(array_starting_positions[i] - array_starting_positions[i+1])
				#print("diff: " + str(diff))
				if (diff < DIFF_SPACE):
					array_starting_positions[i+1] += DIFF_SPACE
				pass
			#print("final array: " + str(array_starting_positions))
			var x : int = 0
			for follow : PathFollow2D in path.get_children():
				#var pos : float = randf_range(0.0,1.0)
				#print(follow.name)
				if (array_starting_positions[x] > 1):
					array_starting_positions[x] -= 1
				follow.progress_ratio = array_starting_positions[x] #pos
				#print(follow.progress_ratio)
				x += 1
			array_starting_positions.clear()
	pass
