extends States

class_name JumpState

var player

func _ready():
	player = get_parent()
	animation.travel("Jump")
	player.velocity.y = player.JUMP_VELOCITY
	
func _physics_process(delta):
	if player.is_on_floor():
		player.change_state("idle")
		
	var direction = (player.neck.transform.basis * Vector3(player.input_dir.x, 0, player.input_dir.y)).normalized()
	if direction:
		player.velocity.x = direction.x * player.SPEED
		player.velocity.z = direction.z * player.SPEED
	else:
		player.velocity.x = move_toward(player.velocity.x, 0, player.SPEED)
		player.velocity.z = move_toward(player.velocity.z, 0, player.SPEED)
		
	if Input.is_action_just_pressed("Attack"):
		player.change_state("attack")
		
	if Input.is_action_just_pressed("AltAttack"):
		player.change_state("magic")

func exit():
	print("EXITING JUMP STATE")
