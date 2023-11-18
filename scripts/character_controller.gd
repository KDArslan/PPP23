extends CharacterBody2D

@export var speed : float = 100.0

func _physics_process(delta):
	var input_value = Input.get_vector("left", "right", "up", "down")
	velocity = input_value * speed
	move_and_slide()
	for index in get_slide_collision_count():
		var collision := get_slide_collision(index)
		var body := collision.get_collider()
		if body.name == "Enemy":
			queue_free()
