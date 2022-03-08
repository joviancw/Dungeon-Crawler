extends Popup

# Pause menu handler, attached to a Popup node in Main scene
# Note, the pause mode of that node is set to 'Process'

# Menu options, corresponding to Labels 
const OPT_RESUME = 0
const OPT_QUIT = 1
const HELPER_SCRIPT = preload("res://Menus/helper_Menu.tscn")
var helper_functions

func _ready():
	add_child(HELPER_SCRIPT.instance())
	helper_functions = get_node("helper_Menu")
	
func _process(delta):
	if Input.is_action_just_pressed("screenshot") and get_tree().paused == false:
		var date = OS.get_datetime()
		var image = get_viewport().get_texture().get_data()
		image.flip_y()
		image.save_png("screenshot_%s-%s-%s_%s-%s-%s.png" % [date.year, date.month, date.day, date.hour, date.minute, date.second])

	# Dismiss pause screen if pause pressed, and game is paused
	if Input.is_action_just_pressed("pause") and get_tree().paused == true:
		hide()
		get_tree().paused = false
		$AnimationPlayer.stop()
		return
			
	# Open pause screen when pause pressed
	if Input.is_action_just_pressed("pause") and get_tree().paused == false:
		popup()
		get_tree().paused = true
		$AnimationPlayer.play("selected")
		helper_functions._selected = 0
		helper_functions._old_selected = 1
		$pointer.position.y = get_node("Label"+str(helper_functions._selected)).rect_position.y + get_node("Label"+str(helper_functions._selected)).rect_size.y / 2
		return
	
	# Be kind and exit loop _process early if not shown
	if not visible: return
		
	# User selects a menu option
	if Input.is_action_just_pressed("ui_accept"):
		# RESUME GAME: Unpause and hid popup
		if helper_functions._selected == OPT_RESUME:
			hide()
			get_tree().paused = false
		# QUIT: Unpause, delete self and jump scene to the gameover scene
		if helper_functions._selected == OPT_QUIT:
			get_tree().paused = false
			queue_free()
			get_tree().change_scene(globals.MENUS.GAME_OVER)
			
	helper_functions.menu_control()		
