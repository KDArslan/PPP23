extends Area2D
#class_name EnemyProjectile

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
	if body.is_in_group("player"):
		queue_free()
		if body.has_method("take_hit"):
			body.take_hit()

func _on_visible_on_screen_notifier_2d_screen_exited():
	pass # Replace with function body.
