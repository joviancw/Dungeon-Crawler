extends "res://entities/weapons/weapon.gd"
const SCENE_BULLET = preload("res://entities/weapons/Bullet.tscn")
var bullet = SCENE_BULLET.instance()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func facing(_attack_angle):
	add_child(bullet)
	bullet.transform = $Muzzle.transform
	bullet._attack_angle = _attack_angle
	position.x = 8
	position.y = 16
	z_index = 11
	# Just make sure we attach Down always. We arn't doing any uppercuts!
	START_ANGLE = _attack_angle
	END_ANGLE = _attack_angle
