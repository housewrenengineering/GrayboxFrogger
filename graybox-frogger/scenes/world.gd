extends Node2D

@onready var path: Control = $Path
@onready var timer: Timer = $Timer

@onready var start: Control = $Menu/Start
@onready var pause: Control = $Menu/Pause
@onready var game_over: Control = $Menu/GameOver
@onready var game_win: Control = $Menu/GameWin

@onready var start_button: Button = $Menu/Start/Start
@onready var pause_resume: Button = $"Menu/Pause/Pause-Resume"
@onready var lose_restart: Button = $"Menu/GameOver/Lose-Restart"
@onready var win_restart: Button = $"Menu/GameWin/Win-Restart"


func _ready() -> void:
	start_menu()
	pass

func _physics_process(_delta: float) -> void:
#	path_follow_2d9.progress += 20*delta
	if (%Player.game_over == true):
		trigger_game_over()
	pass

func prepare_world() -> void:
	%Player.position = %StartingPoint.global_position
	PathObjectSpawner.inital_map_load(path)
	%Player.game_over = false
	timer.start()
	get_tree().paused = false
	pass

func trigger_game_over() -> void:
	#print("game over!")
	get_tree().paused = true
	pause.visible = false
	start.visible = false
	game_over.visible = true
	game_win.visible = false
	lose_restart.grab_focus()
	pass
	
func trigger_game_win() -> void:	
	#print("game WIN!")
	get_tree().paused = true
	pause.visible = false
	start.visible = false
	game_over.visible = false
	game_win.visible = true
	win_restart.grab_focus()
	pass
	
func game_pause() -> void:
	#print("game paused")
	get_tree().paused = true
	pause.visible = true
	start.visible = false
	game_over.visible = false
	game_win.visible = false
	pause_resume.grab_focus()
	pass
	
func game_unpause() -> void:
	#print("game paused")
	get_tree().paused = false	
	pause.visible = false
	start.visible = false
	game_over.visible = false
	game_win.visible = false
	pass
	
func start_menu() -> void:
	#print("start menu")
	pause.visible = false
	start.visible = true
	game_over.visible = false
	game_win.visible = false
	get_tree().paused = true
	start_button.grab_focus()
	pass

func game_start() -> void:
	pause.visible = false
	start.visible = false
	game_over.visible = false
	game_win.visible = false
	prepare_world()
	pass

func _on_bad_path_body_entered(body: Node2D) -> void:
	print("bad path entered")
	if (typeof(body) == 24 && !body.on_good_path):
		trigger_game_over()
	pass

func _on_goal_body_entered(body: Node2D) -> void:
	if (typeof(body) == 24):
		trigger_game_win()
	pass 
	
func _on_timer_timeout() -> void:
	trigger_game_over()
	pass # Replace with function body.

func _on_start_pressed() -> void:
	game_start()
	pass

func _on_pause_resume_pressed() -> void:
	game_unpause()
	pass

func _on_pause_menu_pressed() -> void:
	game_pause()
	pass

func _on_lose_restart_pressed() -> void:
	get_tree().paused = true
	game_start()
	pass

func _on_lose_menu_pressed() -> void:
	get_tree().paused = true
	start_menu()
	pass

func _on_win_restart_pressed() -> void:
	get_tree().paused = true
	game_start()	
	pass

func _on_win_menu_pressed() -> void:
	get_tree().paused = true
	start_menu()
	pass

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
