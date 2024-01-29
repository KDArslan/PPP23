extends Node2D

func _process(_delta):
	var player = get_tree().get_first_node_in_group("player")
	if is_instance_valid(player):
		$Camera2D.position = player.position 
