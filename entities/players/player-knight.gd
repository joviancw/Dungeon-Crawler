extends Player
class_name PKnight

# Called when the node enters the scene tree for the first time.
func _ready():
	if SCENE_WEAPON == null:
		SCENE_WEAPON = globals.ENTITIES.WEAPONS.Sword.scene

