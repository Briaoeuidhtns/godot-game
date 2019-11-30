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
	return box.val


func give(items):
	var box = Box.new(false)
	emit_signal("given", items, box)


func take(items):
	var box = Box.new(false)
	emit_signal("taken", items, box)
	return box.val


func request(items):
	var box = Box.new(false)
	emit_signal('requested', items, box)
	if box.val:
		take(items)
	return box.val


##### Internal #####

class Box:
	var val
	func _init(val_):
		val = val_
