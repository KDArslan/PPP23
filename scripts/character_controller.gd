extends CharacterBody2D
class_name Avatar

@export var speed : float = 100.0
var hit_count = 0

func _physics_process(delta):
	var input_value = Input.get_vector("left", "right", "up", "down")
	velocity = input_value * speed
	move_and_slide()
	for index in get_slide_collision_count():
		var collision := get_slide_collision(index)
		var body := collision.get_collider()
		if body.is_in_group("enemy"):
			queue_free()

func take_hit():
	print("Auaa")
	hit_count += 1
	if hit_count == 3:
		queue_free()
