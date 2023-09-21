extends RigidBody3D

var timer 

func _ready():
	timer = $UnqueueTimer
	timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#CODE HERE FOR IF THERE IS A COLLISION
	pass
	
	


func _on_unqueue_timer_timeout():
	print("Your fireball faded away")
	queue_free()


func _on_area_3d_body_entered(body):
	if "Enemy" in body.name:
		print("Your fireball struck an enemy!")
		body.takeDamage(5)
		queue_free()
	else:
		print("Your fireball did not hit the enemy. It hit the ", body.name)
		queue_free()
