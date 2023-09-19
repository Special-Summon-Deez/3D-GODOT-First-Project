extends States

class_name MagicState

@onready var fireballLoad = preload("res://Magic/fireball.tscn")

var player
var SPEED= 300
# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_parent()
	animation.travel("Fireball")
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction = (player.neck.transform.basis * Vector3(player.input_dir.x, 0, player.input_dir.y)).normalized()
	if direction:
		player.velocity.x = direction.x * player.SPEED
		player.velocity.z = direction.z * player.SPEED
	else:
		player.velocity.x = move_toward(player.velocity.x, 0, player.SPEED)
		player.velocity.z = move_toward(player.velocity.z, 0, player.SPEED)
		
	if Input.is_action_just_pressed("Jump") and player.is_on_floor():
		player.velocity.y = player.JUMP_VELOCITY
		
	
func exit():
	print("EXITING MAGIC STATE")
