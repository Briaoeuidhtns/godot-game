extends KinematicBody

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var speed = 5
var gravity = 9.8
var sensitivity = .1
var falling = 0

func get_input():
	var dir = Vector3(0,0,0)
	if Input.is_action_pressed("action_move_forward"):
		dir.z -= 1
	if Input.is_action_pressed("action_move_backward"):
		dir.z += 1
	if Input.is_action_pressed("action_strafe_right"):
		dir.x += 1
	if Input.is_action_pressed("action_strafe_left"):
		dir.x -= 1
	return dir.normalized()


func _physics_process(delta):
	var movement = get_input()
	movement *= speed
	if is_on_floor():
		falling = 0
	else:
		falling = clamp(falling + delta * gravity, 0, 50)
	movement.y = -falling
	move_and_slide_with_snap(movement, Vector3.DOWN * 2, Vector3.UP)


func _unhandled_input(event):
	if event is InputEventMouseMotion:
		if event.relative.x > 0:
			rotate_y(-lerp(0, sensitivity, event.relative.x/10))
		elif event.relative.x < 0:
			rotate_y(-lerp(0, sensitivity, event.relative.x/10))