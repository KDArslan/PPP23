extends Node

# Integers
var integer_a: int = 5
var integer_b := 2
var float_a: float = 5.0
var float_b := 2.0
var a 
var b 
var evaluation_integer: int = 27
var is_counting := false
var x = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	if evaluation_integer % 2 == 0:
		print("even")
	else:
		print("odd")
		
	_math(integer_a, integer_b)		#Divisionsergebnis abgerundet
	_math(float_a, float_b)		#Divisionsergebnis genau
	
	while is_counting == true:
		x += 1
		print(x)
	if is_counting == false:
		x = 0
	pass # Replace with function body.

func _math(a, b):
		print(a + b)
		print(a - b)
		print(a * b)
		print(a / b)
		pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
