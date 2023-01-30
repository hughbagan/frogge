extends RigidBody2D

var anchor := Vector2()
var anchored := false

func _physics_process(delta):
	# flick on mouse input
	# if clicked, start drawing line
	if Input.is_action_just_pressed("mb_left"):
		if not anchored:
			# lay an anchor to click & drag
			anchor = get_local_mouse_position()
			anchored = true
	if Input.is_action_just_released("mb_left"):
		if anchored:
			anchored = false
			var dist = anchor.distance_to(get_local_mouse_position())
			var diff = anchor - get_local_mouse_position()
			# apply impulse?
			var impulse = diff*4
			apply_impulse(Vector2(0,0), impulse)
	if Input.is_action_pressed("mb_left"):
		if anchored:
			# dragging
			var dist = anchor.distance_to(get_local_mouse_position())
			print(dist)
	update()

func _draw():
	if anchored:
		draw_circle(anchor, 16, Color(0, 0, 0, 0.5))
		draw_circle(get_local_mouse_position(), 16, Color(0.5, 0, 0, 0.5))
		draw_line(anchor, get_local_mouse_position(), Color(0, 0, 0, 0.5))
