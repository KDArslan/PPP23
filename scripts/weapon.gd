extends Node2D

@export var projectile_scene : PackedScene
@export var projectile_speed : float = 500.0
@export var projectile_firerate : float = 10

@onready var equipped_weapon : String = "pistol"
@export var pistol : WeaponResource
@export var shotgun : WeaponResource

var current_weapon_index : int
var aim_direction : Vector2 = Vector2.RIGHT 
var projectile_size : Vector2
var burst_amount : int
var spread_cone_angle : float
@onready var firerate_timer : Timer = $Timer

signal shot()

func _ready():
	projectile_speed = pistol.projectile_speed
	burst_amount = pistol.burst_amount
	projectile_size = pistol.projectile_size
	spread_cone_angle = pistol.spread_cone_angle

#extra function ausbauen --> mehrere typen ohne string variable zum speichern
func switch_weapon(weapon_index : int):
	#if weapon index >= all_weapons.size():
		#weapon_index	
	current_weapon_index = weapon_index
	#current_weapon = all_weapons[current_weapon_index]

func _physics_process(_delta):
	#if Input.is_action_just_pressed("switch_weapon"):
		#print("switch")
	if Input.is_action_just_pressed("switch_weapon") and equipped_weapon == "pistol":
		equipped_weapon = "shotgun"
		projectile_speed = shotgun.projectile_speed
		projectile_size = shotgun.projectile_size
		burst_amount = shotgun.burst_amount
		spread_cone_angle = shotgun.spread_cone_angle
	elif Input.is_action_just_pressed("switch_weapon") and equipped_weapon == "shotgun":
		equipped_weapon = "pistol"
		projectile_speed = pistol.projectile_speed
		projectile_size = pistol.projectile_size
		burst_amount = pistol.burst_amount
		spread_cone_angle = pistol.spread_cone_angle

	aim_direction = get_global_mouse_position() - global_position
	aim_direction.normalized()
	if Input.is_action_pressed("shoot") and firerate_timer.is_stopped() and Global.current_time > 0: 
		shoot()

func shoot():
	if projectile_firerate > 0:
		firerate_timer.wait_time = 1/projectile_firerate
	else:
		firerate_timer.wait_time = 0
	shot.emit()
	
	var initial_offset = spread_cone_angle / 2
	var delta_spread = spread_cone_angle / (burst_amount -1 )
	var current_direction = aim_direction.rotated(deg_to_rad(-initial_offset))
	
	#setzten der Geschwindigkeit, Richtung, und Größe der Projektile
	for amount in burst_amount:
		var projectile = projectile_scene.instantiate()
		get_tree().current_scene.add_child(projectile)
		projectile.position = global_position
		projectile._initialize(projectile_speed , current_direction, projectile_size)
		current_direction = current_direction.rotated(deg_to_rad(delta_spread))
	#Reset Timer
	firerate_timer.start()
