extends Node2D
class_name Projectile

@export var speed : float = 500
@export var direction : Vector2 = Vector2.RIGHT

func _physics_process(delta):
	position += direction * speed * delta

func _initialize(speed : float, direction : Vector2):
	self.speed = speed
	self.direction = direction.normalized()
