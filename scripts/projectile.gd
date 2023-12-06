extends Area2D
class_name Projectile

@export var speed : float = 500
@export var direction : Vector2 = Vector2.RIGHT

func _physics_process(delta):
	position += direction * speed * delta

func _initialize(speed : float, direction : Vector2):
	self.speed = speed
	self.direction = direction.normalized()

func _on_screen_exited():
	queue_free()

func _on_body_entered(body):
	if not body.is_in_group("player"):
		if body.has_method("take_hit"):
			body.take_hit()
			queue_free()
		if body.is_in_group("obstacle"):
			queue_free()
		
