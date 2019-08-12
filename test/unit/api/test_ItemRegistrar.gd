extends "res://addons/gut/test.gd"
var ItemRegistrar_t
var ItemRegistrar
var Item_t
var Item

func before_all():
	ItemRegistrar_t = preload('res://api/ItemRegistrar.gd')
	Item_t = preload('res://abstract/Item.gd')
	Item = 'res://abstract/Item.gd'


func before_each():
	ItemRegistrar = ItemRegistrar_t.new()
	watch_signals(ItemRegistrar)


# Just to test project config.
# The rest should use module scoped version
func test_singleton_type():
	assert_not_null(ItemRegistrar)
	assert_is(get_node('/root/ItemRegistrar'), ItemRegistrar_t)


func test_create_item():
	assert_is(ItemRegistrar.instance(Item), Item_t)


func test_dupl_items():
	assert_eq(ItemRegistrar.instance(Item), ItemRegistrar.instance(Item))