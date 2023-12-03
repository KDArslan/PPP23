extends CharacterBody2D #CharacterBody statt StaticBody, da movement in Zukunft kommen soll

var hit_count = 0
@export var speed : float = 100.0
@export var attack_distance : float = 300
var enemy_direction : Vector2
var player : CharacterBody2D

func _physics_process(delta):
	var player = get_tree().get_first_node_in_group("player")
	player = player as Node2D
	if(is_instance_valid(player)):
		enemy_direction = player.global_position - global_position
	if enemy_direction.length() > attack_distance:
		enemy_direction = enemy_direction.normalized()
		velocity = enemy_direction * speed
		move_and_slide()


func take_hit():
	print("argh")
	hit_count += 1
	if hit_count == 3:
		queue_free()
