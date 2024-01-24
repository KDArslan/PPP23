extends AnimationPlayer

func _process(delta):
	if Input.is_action_just_pressed("right"):
		stop()
		play("walk_anim")
		
	if Input.is_action_just_pressed("down"):
		stop()
		play("idle_anim")
		
	if Input.is_action_just_pressed("shoot"):
		stop()
		play("death_anim")
