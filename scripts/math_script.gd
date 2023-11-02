extends Node

# Integers
var integer_a = 5
var integer_b = 2
var float_a = 5.0
var float_b = 2.0
var evaluation_integer = 27
var is_counting := true
var x = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	if evaluation_integer % 2 == 0:
		print("even")
	else:
		print("odd")
		
	print(integer_a + integer_b)
	print(integer_a - integer_b)
	print(integer_a * integer_b)
	print(integer_a / integer_b) #Dezimal wird abgerundet
	
	print(float_a + float_b)
	print(float_a - float_b)
	print(integer_a * float_b)
	print(float_a / float_b) #Dezimal wird akurat ausgegegben
	while is_counting == true:
		x += 1
		print(x)
	if evaluation_integer == false:
		x = 0
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
