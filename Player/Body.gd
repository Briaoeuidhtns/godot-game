extends KinematicBody
class_name myChar

var speed = 5
const GRAVITY = 9.8
const SENSITIVITY = .05
var falling = 0

const DEACCEL = 3
const MAX_SLOPE_ANGLE = deg2rad(40)

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func get_input():
	var dir = Vector3(0,0,0)
	if Input.is_action_pressed("movement_forward"):
		dir.z -= 1
	if Input.is_action_pressed("movement_backward"):
		dir.z += 1
	if Input.is_action_pressed("look"):
		if Input.is_action_pressed("movement_left"):
			dir.x -= 1
		if Input.is_action_pressed("movement_right"):
			dir.x += 1
	else:
		if Input.is_action_pressed("movement_left"):
			rotate_y(SENSITIVITY)
		if Input.is_action_pressed("movement_right"):
			rotate_y(-SENSITIVITY)
	return dir


func _physics_process(delta):
	var movement = transform.basis.xform(get_input()).normalized() * speed
	if is_on_floor():
		falling = 0
	else:
		falling = clamp(falling + delta * GRAVITY, 0, 50)
	movement.y = -falling
#warning-ignore:return_value_discarded
	move_and_slide_with_snap(movement, Vector3.DOWN * 2, Vector3.UP)
	if Input.is_action_pressed("look"):
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_CONFINED)


func _input(event):
	if (event is InputEventMouseMotion
		&& Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED):
		rotate_y(-lerp(0, SENSITIVITY, event.relative.x/10))
