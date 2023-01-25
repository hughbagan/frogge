extends KinematicBody2D

func _physics_process(delta):
	# flick on mouse input
	# if clicked, start drawing line
	pass

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.pressed:
			print("clicked on!")
