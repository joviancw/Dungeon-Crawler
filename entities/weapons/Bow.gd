extends "res://entities/weapons/weapon.gd"
const SCENE_ARROW = preload("res://entities/weapons/Arrow.tscn")
var arrow = SCENE_ARROW.instance()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func facing(_attack_angle):
	add_child(arrow)
	arrow.transform = $Muzzle.transform
	arrow._attack_angle = _attack_angle
	position.x = 8
	position.y = 16
	z_index = 11
	# Just make sure we attach Down always. We arn't doing any uppercuts!
	START_ANGLE = _attack_angle
	END_ANGLE = _attack_angle
