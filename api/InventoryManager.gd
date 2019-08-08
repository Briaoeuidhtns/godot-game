'''Verbs acting upon the player.'''
extends Node
class_name myInventoryManager

signal offered
signal given
signal taken
signal requested

const __END = 'TOKEN__END'
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func offer(items):
	var box = Box.new(false)
	emit_signal("offered", items, box)
	if box.val:
		give(items)


func give(items):
	emit_signal("given", items)


func take(items):
	emit_signal("taken", items)


func request(items):
	var box = Box.new(false)
	emit_signal('requested', items, box)
	if box.val:
		take(items)


##### Internal #####

func __agg_any():
	var agg_val := false
	var val = false
	while not(val is String and val == __END):
		agg_val = agg_val or val
		val = yield()
	return val

class Box:
	var val
	func _init(val_):
		val = val_
