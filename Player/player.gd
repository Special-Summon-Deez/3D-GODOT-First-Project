extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5

var input_dir

var state
var state_factory

@onready var AnimTree = get_node("PlayerStates")
@onready var playback = AnimTree.get("parameters/playback")
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

# := assigns value AND type of said value
@onready var neck := $Neck
@onready var camera := $Neck/Camera3D
@onready var focus := $Neck/Camera3D/Focus
@onready var focus2 := $Neck/Camera3D/Focus2
@onready var meleeWeapon := $Neck/Camera3D/MeleeWeapon
@onready var magicSpawn := $Neck/Camera3D/MeleeWeapon/MagicSpawnPoint

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	state_factory = StateFactory.new()
	change_state("idle")

func _unhandled_input(event):
	if event is InputEventMouseButton:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	elif event.is_action_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
	if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		if event is InputEventMouseMotion:
			neck.rotate_y(-event.relative.x * 0.01)
			camera.rotate_x(-event.relative.y * 0.01)
			camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-30), deg_to_rad(60))

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta
		

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	input_dir = Input.get_vector("MoveLeft", "MoveRight", "MoveForward", "MoveBack")
	

	move_and_slide()
	
func change_state(new_state_name):
	if state != null:
		state.exit()
		state.queue_free()
	
	state = state_factory.get_state(new_state_name).new()
	
	state.setup("change_state", playback, self)
	state.name = new_state_name
	add_child(state)
	
func _on_player_states_animation_finished(anim_name):
	if anim_name == "Swing" || anim_name == "Fireball":
		change_state("idle")
