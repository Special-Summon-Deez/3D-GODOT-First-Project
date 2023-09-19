extends States

class_name IdleState

var player

func _ready():
	player = get_parent()
	animation.travel("Idle")
	
func _physics_process(delta):
	if player.input_dir:
		player.change_state("move")
		
	if Input.is_action_just_pressed("Attack"):
		player.change_state("attack")
# Handle Jump.
	if Input.is_action_just_pressed("Jump") and player.is_on_floor():
		player.change_state("jump")
		
	if Input.is_action_just_pressed("AltAttack"):
		player.change_state("magic")

func exit():
	print("EXITING IDLE STATE")
