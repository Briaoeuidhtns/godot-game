extends StaticBody
class_name myInteractable

var primed := false


func _input_event(camera, event, click_position, click_normal, shape_idx):
	if event.is_action_pressed("action_interact"):
		primed = true
	elif event.is_action_released("action_interact") and primed:
		primed = false
		interact()

func interact():
	pass
