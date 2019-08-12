extends Node
class_name myItemRegistrar

var __items := {}
var Item = preload('res://abstract/Item.gd')

func _ready():
	pass


func register(token: String, instance: myItem):
	if token in __items:
		Logger.error("Item %s has already been registered to %s, can't register to %s" % [token, __items[token], instance])
	else:
		__items[token] = instance


func get(token: String):
	return __items[token]