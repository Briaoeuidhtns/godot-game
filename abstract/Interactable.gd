extends StaticBody
class_name myInteractable

var primed := false


func _input_event(_camera, event, _click_position, _click_normal, _shape_idx):
	if event.is_action_pressed("action_interact"):
		primed = true
	elif event.is_action_released("action_interact") and primed:
		primed = false
		interact()


func interact():
	pass
