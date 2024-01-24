extends AnimationTree

@export var velocity : float = 0
@export var isDead : bool = false

#func _process(delta):
#	if Input.is_action_just_pressed("shoot"):
#		set("parameters/conditions/isDead", true)
#
