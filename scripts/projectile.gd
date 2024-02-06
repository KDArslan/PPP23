extends Area2D
class_name Projectile

@export var speed : float = 500
@export var direction : Vector2 = Vector2.RIGHT
@export var projectile_explosion : PackedScene
@export var size : Vector2 

func _physics_process(delta):
	position += direction * speed * delta

func _initialize(speed, direction, size):
	self.speed = speed
	self.direction = direction.normalized()
	self.scale = size

func explode():
	var explosion = projectile_explosion.instantiate()
	explosion.position = global_position
	explosion.rotation = global_rotation
	explosion.emitting = true
	get_tree().current_scene.add_child(explosion)

func _on_screen_exited():
	queue_free()

func _on_body_entered(body):
	if not body.is_in_group("player"):
		if body.has_method("take_hit"):
			body.take_hit()
			explode()
			queue_free()
		if body.is_in_group("obstacle"):
			explode()
			queue_free()
		
