extends Node

var OPT_START = 0
var OPT_END = 1

var _selected = 0
var _old_selected = 1

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func menu_control():
		# Handle UI selections of menu items
	if Input.is_action_just_pressed("ui_down"):
		_old_selected = _selected
		_selected += 1
	if Input.is_action_just_pressed("ui_up"):
		_old_selected = _selected
		_selected -= 1
		
	if _selected > OPT_END: 
		_selected = OPT_START
	if _selected < OPT_START: 
		_selected = OPT_END
	# Move pointer next to selected option label
	get_node("../pointer").position.y = get_node("../Label"+str(_selected)).rect_position.y + get_node("../Label"+str(_selected)).rect_size.y / 2
	# Change the animation which makes the labels "glow"
	var ani = get_node("../AnimationPlayer").get_animation("selected")
	get_node("../Label"+str(_old_selected)).modulate = Color.white
	# We can modify the property the animation path animates on the fly, how clever!
	ani.track_set_path(1, "Label"+str(_selected)+":modulate")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
