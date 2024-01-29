extends CanvasLayer

@export var restart_scene : PackedScene
@export var timer_scene : PackedScene
@onready var time_passed_label : Label = $VBoxContainer/TimePassedLabel
@onready var enemy_kill_count : Label = $VBoxContainer/EnemyKillCount

# Called when the node enters the scene tree for the first time.
func _ready():
	var restart = restart_scene.instantiate()
	get_tree().current_scene.add_child(restart)
	time_passed_label.text = str("You survived " + str(Global.time_passed) + " seconds")
	enemy_kill_count.text = str("You killed " + str(Global.enemy_kill_count) + " enemies")
