extends Node3D

@onready var fireballLoad = preload("res://Magic/fireball.tscn")

var player
var SPEED= 900

# Called when the node enters the scene tree for the first time.
func _ready():
	player = $"../../.."


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func shootFire():
	var fireball = fireballLoad.instantiate()
	var direction = (player.transform.basis * Vector3(player.focus2.global_position.x - player.focus.global_position.x, player.focus2.global_position.y - player.focus.global_position.y, player.focus2.global_position.z - player.focus.global_position.z)).normalized()
	fireball.position = player.magicSpawn.global_position
	fireball.apply_central_force(Vector3(direction.x * SPEED, direction.y * SPEED, direction.z * SPEED))
	get_tree().current_scene.add_child(fireball)
