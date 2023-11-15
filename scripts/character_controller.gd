extends CharacterBody2D

@export var speed : float = 100.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	var input_value = Input.get_vector("left", "right", "up", "down")
	velocity = input_value * speed
	move_and_slide()

