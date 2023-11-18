extends CharacterBody2D #CharacterBody statt StaticBody, da movement in Zukunft kommen soll

var hit_count = 0

func take_hit():
	print("argh")
	hit_count += 1
	if hit_count == 3:
		queue_free()
