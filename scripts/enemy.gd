extends CharacterBody2D 

@export var death_explosion : PackedScene 
@export var hit_points = 3
@export var speed : float = 70.0
@export var attack_distance : float = 300
var enemy_direction : Vector2

signal hit()
signal death()

@export var weak_enemy : Resource
@export var medium_enemy : Resource
@export var strong_enemy : Resource

func _ready():
	if Global.current_time >= Global.start_time*0.66:
		hit_points = weak_enemy.hit_points
		speed = weak_enemy.speed
	if Global.current_time <= Global.start_time*0.66 and Global.current_time > Global.start_time*0.33:
		hit_points = medium_enemy.hit_points
		speed = medium_enemy.speed
	if Global.current_time <= Global.start_time*0.33:
		hit_points = strong_enemy.hit_points
		speed = strong_enemy.speed

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
	hit.emit()
	hit_points -= 1
	if hit_points == 0:
		_on_death()
		death_vfx()
		queue_free()

func _on_death():
	Global.enemy_kill_count += 1
