extends CharacterBody3D


var health

func _ready():
	health = 10


func _physics_process(delta):
	# Add the gravity.
	pass
	
func takeDamage(num):
	if health - num <= 0:
		health = 0
		print("Enemy Slain")
		queue_free()
	else:
		health -= num
		print("You dealt: ", num, " damage! Remaining health: ", health)
