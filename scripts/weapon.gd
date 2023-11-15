extends Node2D

@export var projectile_scene : PackedScene
@export var speed : float = 500.0
var aim_direction : Vector2 = Vector2.RIGHT 


func _input(event : InputEvent):
	if event.is_action_pressed("shoot"): 
		#Node aus PackedScene erzeugen 
		var projectile = projectile_scene.instantiate()
		get_tree().root.add_child(projectile)
		
		#
		projectile.position = global_position
		
		#setzten der Richtung und der Geschwindigkeit der Projektile
		projectile = projectile as Projectile
		projectile._initialize(speed, aim_direction)

func _unhandled_input(event):
	if event is InputEventMouseMotion:
		aim_direction = event.global_position - global_position
		aim_direction = aim_direction.normalized()
