extends Player
class_name PElf

# Called when the node enters the scene tree for the first time.
func _ready():
	if SCENE_WEAPON == null:
		SCENE_WEAPON = globals.ENTITIES.WEAPONS.Daggers.scene
