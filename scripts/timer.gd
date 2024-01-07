extends Control

@export var win_scene : PackedScene
@export var current_time : float

@onready var game_timer : Timer = $"../../GameTimer"
@onready var timer_label : Label = $VBoxContainer/TimerLabel
@onready var mission_statement = $CenterContainer
@onready var player = get_tree().get_first_node_in_group("player")
@onready var start_time = current_time


func _process(_delta):
	Global.current_time = current_time
	Global.time_passed = start_time - current_time
	var enemies = get_tree().get_nodes_in_group("enemy")
	timer_label.text = str(current_time)
	if(is_instance_valid(player)):
		if current_time > 0 and game_timer.is_stopped():
			game_timer.start()
			current_time -= 1
		elif current_time <= 0:
			game_timer.stop
			for enemy in enemies:
				enemy.queue_free()
				var win = win_scene.instantiate()
				get_tree().current_scene.add_child(win)
	else:
		game_timer.stop()
		#print(current_time)
