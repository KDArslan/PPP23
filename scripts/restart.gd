extends CanvasLayer

func _on_restart_button_pressed():
	get_tree().reload_current_scene()
	Global.enemy_kill_count = 0
