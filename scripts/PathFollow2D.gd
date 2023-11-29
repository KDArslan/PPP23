extends PathFollow2D

@onready var sprite = $Sprite2D

func _physics_process(delta):
	progress_ratio += randf_range(-0.001, 0.01)
	sprite.scale = progress_ratio * Vector2.ONE

func _input(event):
	if event.is_action_pressed("shoot"):
		if not is_instance_valid(sprite):
			sprite.queue_free
