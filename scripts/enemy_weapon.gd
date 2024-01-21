extends Node2D

@onready var firerate_timer : Timer = $Timer
var aim_direction : Vector2 = Vector2.RIGHT 
var enemy_direction : Vector2

@export var enemy_projectile_scene : PackedScene
@export var projectile_speed : float = 200.0
@export var projectile_firerate : float = 1
@export var attack_distance : float = 300

@export var weak_enemy : Resource
@export var medium_enemy : Resource
@export var strong_enemy : Resource

func _ready():
	if Global.current_time >= Global.start_time*0.66:
		projectile_firerate = weak_enemy.firerate
	if Global.current_time <= Global.start_time*0.66 and Global.current_time > Global.start_time*0.33:
		projectile_firerate = medium_enemy.firerate
	if Global.current_time <= Global.start_time*0.33:
		projectile_firerate = medium_enemy.firerate

func _physics_process(_delta):
	var player = get_tree().get_first_node_in_group("player")
	if(is_instance_valid(player)):
		enemy_direction = player.global_position - global_position
		if enemy_direction.length() <= attack_distance and firerate_timer.is_stopped(): 
			if projectile_firerate > 0:
				firerate_timer.wait_time = 1/projectile_firerate
			else:
				firerate_timer.wait_time = 0
			#Node aus PackedScene erzeugen 
			var enemy_projectile = enemy_projectile_scene.instantiate()
			get_tree().root.add_child(enemy_projectile)
			enemy_projectile.position = global_position
			#setzten der Richtung und der Geschwindigkeit der Projektile
			enemy_projectile._initialize(projectile_speed, enemy_direction)
			#Reset Timer
			firerate_timer.start()
			if Global.current_time <= 0:
				var projectiles = get_tree().get_nodes_in_group("projectile")
				for projectile in projectiles:
					projectile.queue_free()
