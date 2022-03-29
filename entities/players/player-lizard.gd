extends Player
class_name PLizard

func _ready():
	if SCENE_WEAPON == null:
		SCENE_WEAPON = globals.ENTITIES.WEAPONS.Bow.scene
	
