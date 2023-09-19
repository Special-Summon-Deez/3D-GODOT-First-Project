class_name StateFactory

var states

func _init():
	states = {
		"idle": IdleState,
		"attack": AttackState,
		"move": MoveState,
		"jump": JumpState,
		"magic": MagicState
	}

func get_state(state_name):
	if states.has(state_name):
		return states.get(state_name)
