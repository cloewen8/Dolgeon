extends KinematicBody2D

export(float) var speed_forward = 10;
export(float) var speed_back = 5;
export(float) var speed_mult = 1;
export(float) var slow_speed_mult = 0.7;
export(float) var rot_speed = 0.15;
export(float) var max_speed = 200;
export(float) var max_rot = 2;
export(float) var drag = 400;
export(float) var rot_drag = 3;
var velocity = Vector2();
var rot_velocity = 0;
var curr_speed_mult;

func add_input():
	# Set rot_velocity.
	if Input.is_action_pressed("character_left"):
		rot_velocity -= rot_speed*Input.get_action_strength("character_left");
	if Input.is_action_pressed("character_right"):
		rot_velocity += rot_speed*Input.get_action_strength("character_right");
	# Set velocity.
	curr_speed_mult = speed_mult;
	if Input.is_action_pressed("character_slow"):
		curr_speed_mult = slow_speed_mult;
	if Input.is_action_pressed("character_forward"):
		velocity += Vector2(sin(rotation), -cos(rotation))*speed_forward*curr_speed_mult*Input.get_action_strength("character_forward");
	if Input.is_action_pressed("character_back"):
		velocity += Vector2(sin(rotation), -cos(rotation))*speed_back*curr_speed_mult*-Input.get_action_strength("character_back");
	# Cap velocities.
	if velocity.length() > max_speed:
		velocity = velocity.normalized()*max_speed;
	if rot_velocity > max_rot:
		rot_velocity = max_rot;
	elif rot_velocity < -max_rot:
		rot_velocity = -max_rot;

func _process(delta):
	add_input();
	# Apply velocities.
	velocity = move_and_slide(velocity, Vector2.UP);
	rotation_degrees += rot_velocity;
	# Apply drag.
	if velocity.length() > 0:
		velocity = velocity.normalized()*max(velocity.length() - drag*delta, 0);
	if rot_velocity > 0:
		rot_velocity = max(rot_velocity - rot_drag*delta, 0);
	elif rot_velocity < 0:
		rot_velocity = min(rot_velocity + rot_drag*delta, 0);
