extends Node
class_name myItemRegistrar

var __items := {}

func instance(res: String):
	"""Return a global instance of an item given a resource string"""
	if not res in __items:
		var T = load(res)
		__items[res] = T.new()
	return __items[res]
