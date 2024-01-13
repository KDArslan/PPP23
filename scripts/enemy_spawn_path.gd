extends PathFollow2D

@onready var spawn_timer : Timer = $SpawnTimer
@onready var difficulty_timer : Timer = $DifficultyTimer
@export var enemy_scene : PackedScene
@export var spawn_wait : float = 2.0

func _on_difficulty_timer_timeout():
	spawn_wait *= 0.5

func _on_spawn_timer_timeout():
	spawn_timer.wait_time = spawn_wait
	var rng : RandomNumberGenerator = RandomNumberGenerator.new()
	var spawn_point = rng.randf_range(0.0, 1.0)
	progress_ratio = spawn_point
	#print("Enemy spawned at pos: (" + str(spawn_point.x) + ", " + str(spawn_point.y) + ")")
	
	#spawn enemy
	var new_enemy = enemy_scene.instantiate()
	new_enemy.position = global_position
	get_tree().current_scene.add_child(new_enemy)
