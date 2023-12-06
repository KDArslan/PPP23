extends PathFollow2D

@onready var spawn_timer : Timer = $Timer
@export var enemy_scene : PackedScene
@export var spawn_frequency : float = 5.0
#Add path follow to spawn at entirely random point along path follow progress
#Currently spawning at defined points

func _on_timer_timeout():
	spawn_timer.wait_time = spawn_frequency
	var rng : RandomNumberGenerator = RandomNumberGenerator.new()
	var spawn_point = rng.randf_range(0.0, 1.0)
	progress_ratio = spawn_point
	#var new_pos = get_progress_ratio()
	#print("Enemy spawned at pos: (" + str(spawn_point.x) + ", " + str(spawn_point.y) + ")")
	#spawn enemy
	var new_enemy = enemy_scene.instantiate()
	new_enemy.position = global_position
	get_tree().root.add_child(new_enemy)
