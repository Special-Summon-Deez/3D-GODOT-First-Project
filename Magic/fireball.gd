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
	queue_free()
