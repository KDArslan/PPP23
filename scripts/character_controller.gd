extends CharacterBody2D
class_name Avatar

signal health_changed(current: int, max : int)
signal hit()

@onready var game_over_timer : Timer = $GameOverTimer
@onready var body : CollisionShape2D = $CollisionShape2D
@export var death_explosion : PackedScene 
@export var lose_scene : PackedScene
@export var speed : float = 100.0
@export var max_health = 5
var current_health = max_health
var living : bool = true 

func _ready():
	health_changed.emit(current_health, max_health)

func take_hit():
	hit.emit()
	current_health -= 1
	health_changed.emit(current_health, max_health)
	if current_health <= 0:
		_avatar_death()

func death_vfx():
	var explosion = death_explosion.instantiate()
	explosion.position = global_position
	explosion.rotation = global_rotation
	explosion.emitting = true
	get_tree().current_scene.add_child(explosion)

func _avatar_death():
	living = false
	if game_over_timer.is_stopped() and Global.current_time > 0:
		game_over_timer.start()
		death_vfx()
		self.visible = false
	
func _on_game_over_timer_timeout():
	var lose = lose_scene.instantiate()
	get_tree().current_scene.add_child(lose)
	queue_free()

func _physics_process(_delta):
	if living == true:
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
