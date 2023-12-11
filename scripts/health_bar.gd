extends ProgressBar

func _on_avatar_health_changed(current, max_health):
	max_value = max_health 
	value = current
	
