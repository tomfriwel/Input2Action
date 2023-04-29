extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var label = null
var label_arr = []


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _physics_process(_delta):
	# if Input.is_action_just_pressed("ui_right"):
	# 	action()

	# detect press, exec once with one press
	# if Input.is_mouse_button_pressed(BUTTON_LEFT):
		
	# mouse_left press
	if Input.is_action_just_pressed("mouse_left"):
		print("Left mouse button pressed.")
		var position = get_viewport().get_mouse_position()
		actionAtPosition(position)
	# if mouse_left release
	if Input.is_action_just_released("mouse_left"):
		print("Left mouse button released.")

	# get mouse button mask
	# var mouse_button_mask = Input.get_mouse_button_mask()
	# print
	# print(str(mouse_button_mask) + " " + str(OS.get_ticks_msec()))




# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func action():
	print(123)
	display_text(123)

func actionAtPosition(position):
	# print pos with time
	# print(str(position) + " " + str(OS.get_ticks_msec()))
	display_text_at_pos(position, 123)

# display text at center
func display_text(text):
	# if null, create a label
	if label == null:
		label = Label.new()
	label.text = str(text) + " " + str(OS.get_ticks_msec())

	# get window size and set label position
	var window_size = get_viewport_rect().size
	label.rect_position = window_size / 2

	
	# add to scene
	add_child(label)


# display text at center
func display_text_at_pos(position, text):
	if label != null:
		label_arr.append(label)
		label = null
	label = Label.new()
	label.text = str(text) + " " + str(OS.get_ticks_msec())
	
	# get window size and set label position
	# var window_size = get_viewport_rect().size
	label.rect_position = position
	add_child(label)

	
	# add to scene

