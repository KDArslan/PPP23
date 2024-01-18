extends Resource
class_name EnemyResource

@export var hit_points : int = 5
@export var speed : float = 70

func _init(enemy_hit_points = 5, enemy_speed = 70):
	hit_points = enemy_hit_points
	speed = enemy_speed
