extends CanvasLayer

@export var restart_scene : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	var restart = restart_scene.instantiate()
	get_tree().current_scene.add_child(restart)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
