extends Control

@onready var game_timer : Timer = $"../../GameTimer"
@onready var timer_label : Label = $VBoxContainer/TimerLabel
@export var current_time = 5.0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timer_label.text = str(current_time)
	if current_time > 0 and game_timer.is_stopped():
		game_timer.start()
		current_time += -1
		#print(current_time)
