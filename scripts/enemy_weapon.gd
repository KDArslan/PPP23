extends Node2D

@export var enemy_projectile_scene : PackedScene
@export var projectile_speed : float = 500.0
@export var projectile_firerate : float = 5
var aim_direction : Vector2 = Vector2.RIGHT 
@onready var firerate_timer : Timer = $Timer
@export var attack_distance : float = 300
var enemy_direction : Vector2
var player : CharacterBody2D

func _physics_process(delta):
	var player = get_tree().get_first_node_in_group("player")
	if(is_instance_valid(player)):
		enemy_direction = player.global_position - global_position
		if enemy_direction.length() <= attack_distance and firerate_timer.is_stopped(): 
			if projectile_firerate > 0:
				firerate_timer.wait_time = 1/projectile_firerate
			else:
				firerate_timer.wait_time = 0
			#Node aus PackedScene erzeugen 
			var projectile = enemy_projectile_scene.instantiate()
			get_tree().root.add_child(projectile)
			projectile.position = global_position
			#setzten der Richtung und der Geschwindigkeit der Projektile
			projectile._initialize(projectile_speed, enemy_direction)
			#Reset Timer
			firerate_timer.start()

