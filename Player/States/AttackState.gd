extends States

class_name AttackState

var player

func _ready():
	player = get_parent()
	animation.travel("Swing")
	
func _physics_process(delta):
	var direction = (player.neck.transform.basis * Vector3(player.input_dir.x, 0, player.input_dir.y)).normalized()
	if direction:
		player.velocity.x = direction.x * player.SPEED
		player.velocity.z = direction.z * player.SPEED
	else:
		player.velocity.x = move_toward(player.velocity.x, 0, player.SPEED)
		player.velocity.z = move_toward(player.velocity.z, 0, player.SPEED)

func exit():
	print("EXITING ATTACK STATE")
