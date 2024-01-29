extends AnimationTree

@onready var avatar : Avatar = $".."
var living : bool = true
var moving : bool = false

func _process(_delta): 
	if avatar.living == false:
		living = false

	if avatar.velocity:
		moving = true
	else:
		moving = false
