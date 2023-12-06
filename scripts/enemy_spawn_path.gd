extends Path2D

@onready var spawn_timer : Timer = $Timer
@export var enemy_scene : PackedScene
@export var spawn_frequency : float = 5.0
var rng : RandomNumberGenerator = RandomNumberGenerator.new()
#Add path follow to spawn at entirely random point along path follow progress
#Currently spawning at defined points

func _on_timer_timeout():
	spawn_timer.wait_time = spawn_frequency
	var rand = rng.randi_range(0, curve.point_count -1)
	var new_pos = curve.get_point_position(rand)
	#print("Enemy spawned at pos: (" + str(new_pos.x) + ", " + str(new_pos.y) + ")")
	var new_enemy = enemy_scene.instantiate()
	new_enemy.position = new_pos
	get_tree().root.add_child(new_enemy)
