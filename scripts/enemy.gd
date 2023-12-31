extends CharacterBody2D 

@export var death_explosion : PackedScene 
@export var hit_points = 3
@export var speed : float = 70.0
@export var attack_distance : float = 300
var enemy_direction : Vector2

func _physics_process(_delta):
	var player = get_tree().get_first_node_in_group("player")
	player = player as Node2D
	if(is_instance_valid(player)):
		enemy_direction = player.global_position - global_position #can replace with distance function
	if enemy_direction.length() > attack_distance:
		enemy_direction = enemy_direction.normalized()
		velocity = enemy_direction * speed
		move_and_slide()

func death_vfx():
	var explosion = death_explosion.instantiate()
	explosion.position = global_position
	explosion.rotation = global_rotation
	explosion.emitting = true
	get_tree().current_scene.add_child(explosion)

func take_hit():
	hit_points -= 1
	if hit_points == 0:
		queue_free()
		death_vfx()
