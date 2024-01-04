extends CharacterBody2D
class_name Avatar

signal health_changed(current: int, max : int)

@export var lose_scene : PackedScene
@export var speed : float = 100.0
@export var max_health = 5
var current_health = max_health

func _ready():
	health_changed.emit(current_health, max_health)

#func _process(delta):
#	if Global.current_time <= 0:
#		queue_free()
#		process_mode = Node.PROCESS_MODE_DISABLED
#	elif Global.current_time > 0:
#		process_mode = Node.PROCESS_MODE_INHERIT
	
func _avatar_death():
	queue_free()
	var lose = lose_scene.instantiate()
	get_tree().current_scene.add_child(lose)

func _physics_process(_delta):
	if Global.current_time <= 0:
		return
	else:
		var input_value = Input.get_vector("left", "right", "up", "down")
		velocity = input_value * speed
		move_and_slide()
		#death on enemy collision
		for index in get_slide_collision_count():
			var collision := get_slide_collision(index)
			var body := collision.get_collider()
			if body.is_in_group("enemy"):
				_avatar_death()


func take_hit():
	print("Auaa")
	current_health -= 1
	health_changed.emit(current_health, max_health)
	if current_health <= 0:
		_avatar_death()
