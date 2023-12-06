extends CharacterBody2D
class_name Avatar

@export var speed : float = 100.0
var hit_points = 5

func _physics_process(delta):
	var input_value = Input.get_vector("left", "right", "up", "down")
	velocity = input_value * speed
	move_and_slide()
	#death on enemy collision
#	for index in get_slide_collision_count():
#		var collision := get_slide_collision(index)
#		var body := collision.get_collider()
#		if body.is_in_group("enemy"):
#			queue_free()

func take_hit():
	print("Auaa")
	hit_points -= 1
	if hit_points == 0:
		queue_free()
