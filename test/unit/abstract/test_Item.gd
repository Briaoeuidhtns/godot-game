extends "res://addons/gut/test.gd"
var Item

func before_all():
	Item = preload('res://abstract/Item.gd')


func before_each():
	pass


func test_name():
	var item = Item.new()
	assert_has_method(item, '_get_name')
	assert_not_null(item._get_name())