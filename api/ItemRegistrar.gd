extends Node
class_name myItemRegistrar

var __items := {}

func instance(res):
	if not res in __items:
		var T = load(res)
		__items[res] = T.new()
	return __items[res]
