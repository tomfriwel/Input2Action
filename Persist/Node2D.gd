extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	# add a label with text time
	var label = Label.new()
	label.text = "Time"
	add_child(label)

	# get label's parent node name
	var parent = label.get_parent()
	print(parent)
	pass # Replace with function body.


func _physics_process(_delta):
	# if Input.is_action_just_pressed("ui_right"):
	# 	action()

	# detect press, exec once with one press
	# if Input.is_mouse_button_pressed(BUTTON_LEFT):
		
	# mouse_left press
	if Input.is_action_just_pressed("mouse_left"):
		print("Left mouse button pressed.")
		saveAction()
	# if mouse_left release
	if Input.is_action_just_released("mouse_left"):
		print("Left mouse button released.")

func saveAction():
	save_game()

# Note: This can be called from anywhere inside the tree. This function is
# path independent.
# Go through everything in the persist category and ask them to return a
# dict of relevant variables.
func save_game():
	var save_game = File.new()
	save_game.open("user://savegame.save", File.WRITE)
	var save_nodes = get_tree().get_nodes_in_group("Data")
	for node in save_nodes:
		print(node)
		# Check the node is an instanced scene so it can be instanced again during load.
		if node.filename.empty():
			print("persistent node '%s' is not an instanced scene, skipped" % node.name)
			continue

		# Check the node has a save function.
		if !node.has_method("save"):
			print("persistent node '%s' is missing a save() function, skipped" % node.name)
			continue

		# Call the node's save function.
		var node_data = node.call("save")
		print(node_data)

		# Store the save dictionary as a new line in the save file.
		save_game.store_line(to_json(node_data))
	save_game.close()

func save():
	var save_dict = {
		"filename" : get_filename(),
		"parent" : get_parent().get_path(),
		"pos_x" : position.x, # Vector2 is not supported by JSON
		"pos_y" : position.y,
		# "attack" : attack,
		# "defense" : defense,
		# "current_health" : current_health,
		# "max_health" : max_health,
		# "damage" : damage,
		# "regen" : regen,
		# "experience" : experience,
		# "tnl" : tnl,
		# "level" : level,
		# "attack_growth" : attack_growth,
		# "defense_growth" : defense_growth,
		# "health_growth" : health_growth,
		# "is_alive" : is_alive,
		# "last_attack" : last_attack
	}
	return save_dict
	
