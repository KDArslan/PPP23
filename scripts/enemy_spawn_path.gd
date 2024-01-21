extends PathFollow2D

@onready var spawn_timer : Timer = $SpawnTimer
@onready var difficulty_timer : Timer = $DifficultyTimer
@export var enemy_scene : PackedScene
@export var spawn_wait : float = 1.0

func _ready():
	difficulty_timer.wait_time = Global.start_time/3

func _on_difficulty_timer_timeout():
	spawn_wait *= 0.3

func _on_spawn_timer_timeout():
	if Global.current_time <= 1:
		return
	spawn_timer.wait_time = spawn_wait
	var rng : RandomNumberGenerator = RandomNumberGenerator.new()
	var spawn_point = rng.randf_range(0.0, 1.0)
	progress_ratio = spawn_point
	
	#spawn enemy
	var new_enemy = enemy_scene.instantiate()
	new_enemy.position = global_position
	get_tree().current_scene.add_child(new_enemy)
