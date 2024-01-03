extends Control


@onready var game_timer : Timer = $"../../GameTimer"
@onready var timer_label : Label = $VBoxContainer/TimerLabel
@onready var player = get_tree().get_first_node_in_group("player")
@export var current_time = 5.0


func _process(_delta):
	var enemies = get_tree().get_nodes_in_group("enemy")
	timer_label.text = str(current_time)
	if(is_instance_valid(player)):
		if current_time > 0 and game_timer.is_stopped():
			game_timer.start()
			current_time += -1
		elif current_time <= 0:
			game_timer.stop
			for enemy in enemies:
				enemy.queue_free()
	else:
		game_timer.stop()
		#print(current_time)
