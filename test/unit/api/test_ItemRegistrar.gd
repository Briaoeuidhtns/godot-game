extends "res://addons/gut/test.gd"
var ItemRegistrar_t
var ItemRegistrar
var Item

func before_all():
	ItemRegistrar_t = preload('res://api/ItemRegistrar.gd')
#	Item = preload('res://abstract/Item.gd')
#
#
func before_each():
	ItemRegistrar = ItemRegistrar_t.new()
	watch_signals(ItemRegistrar)


# Just to test project config.
# The rest should use module scoped version
func test_singleton_type2():
	assert_not_null(ItemRegistrar)
	assert_is(get_node('/root/ItemRegistrar'), ItemRegistrar_t)

