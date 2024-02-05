extends Node2D

@export var projectile_scene : PackedScene
@export var projectile_speed : float = 500.0
@export var projectile_firerate : float = 10

@onready var equipped_weapon : String = "pistol"
@export var pistol : Resource
@export var shotgun : Resource

var aim_direction : Vector2 = Vector2.RIGHT 
@onready var firerate_timer : Timer = $Timer

signal shot()

func _ready():
	projectile_speed = pistol.projectile_speed

func _physics_process(_delta):
	#if Input.is_action_just_pressed("switch_weapon"):
		#print("switch")
	if Input.is_action_just_pressed("switch_weapon") and equipped_weapon == "pistol":
		equipped_weapon = "shotgun"
		projectile_speed = shotgun.projectile_speed
	elif Input.is_action_just_pressed("switch_weapon") and equipped_weapon == "shotgun":
		equipped_weapon = "pistol"
		projectile_speed = pistol.projectile_speed

	aim_direction = get_global_mouse_position() - global_position
	aim_direction.normalized()
	if Input.is_action_pressed("shoot") and firerate_timer.is_stopped() and Global.current_time > 0: 
		if projectile_firerate > 0:
			firerate_timer.wait_time = 1/projectile_firerate
		else:
			firerate_timer.wait_time = 0
		shot.emit()
		#Node aus PackedScene erzeugen 
		var projectile = projectile_scene.instantiate()
		get_tree().current_scene.add_child(projectile)
		projectile.position = global_position
		#setzten der Richtung und der Geschwindigkeit der Projektile
		projectile._initialize(projectile_speed , aim_direction)
		#Reset Timer
		firerate_timer.start()
