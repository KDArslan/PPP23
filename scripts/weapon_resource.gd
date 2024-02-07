extends Resource
class_name WeaponResource

@export var burst_amount : int
@export var projectile_size : Vector2
@export var projectile_speed : float 
@export var spread_cone_angle : float

#● Vector3 rotated(axis: Vector3, angle: float) gibt den Vektor, um eine Angabe im
#Bogenmaß rotiert, zurück.
#● deg_to_rad(value : float) rechnet Gradangaben in Bogenmaß um
#● Bsp: var new_direction =
#initial_direction.rotated(deg_to_rad(spread_angle_degrees))
