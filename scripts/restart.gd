extends Control

@onready var restartButton : Button = $VBoxContainer/Button

# Called when the node enters the scene tree for the first time.
func _ready():
	#restartButton.visible = true
	pass
	
func _process(delta):
	if restartButton.button_pressed:
		get_tree().reload_current_scene()
