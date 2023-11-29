extends Node2D

@export var projectile_scene : PackedScene
@export var projectile_speed : float = 500.0
@export var projectile_firerate : float = 10
var aim_direction : Vector2 = Vector2.RIGHT 
@onready var firerate_timer : Timer = $Timer

func _physics_process(delta):
	if Input.is_action_pressed("shoot") and firerate_timer.is_stopped(): 
		if projectile_firerate > 0:
			firerate_timer.wait_time = 1/projectile_firerate
		else:
			firerate_timer.wait_time = 0
		#Node aus PackedScene erzeugen 
		var projectile = projectile_scene.instantiate()
		get_tree().root.add_child(projectile)
		projectile.position = global_position
		#setzten der Richtung und der Geschwindigkeit der Projektile
		projectile = projectile as Projectile
		projectile._initialize(projectile_speed, aim_direction)
		#Reset Timer
		firerate_timer.start()

func _unhandled_input(event):
	if event is InputEventMouseMotion:
		aim_direction = event.global_position - global_position
		aim_direction = aim_direction.normalized()
