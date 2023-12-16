extends Control


@onready var game_timer : Timer = $"../../GameTimer"
@onready var timer_label : Label = $VBoxContainer/TimerLabel
@onready var player = get_tree().get_first_node_in_group("player")
@export var current_time = 5.0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	timer_label.text = str(current_time)
	if(is_instance_valid(player)):
		if current_time > 0 and game_timer.is_stopped():
			game_timer.start()
			current_time += -1
	else:
		game_timer.stop()
		#print(current_time)
