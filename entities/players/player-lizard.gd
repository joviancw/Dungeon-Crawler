extends Player
class_name PLizard

func _ready():
	if SCENE_WEAPON == null:
		SCENE_WEAPON = globals.ENTITIES.WEAPONS.Sword.scene
	pass
	
func _physics_process(delta):
	var test = 1
	
