extends "res://addons/gut/test.gd"
var ItemRegistrar_t
var ItemRegistrar
var Item

func before_all():
	ItemRegistrar_t = preload('res://api/ItemRegistrar.gd')
	Item = preload('res://abstract/Item.gd')
#
#
func before_each():
	ItemRegistrar = ItemRegistrar_t.new()
	watch_signals(ItemRegistrar)


# Just to test project config.
# The rest should use module scoped version
func test_singleton_type():
	assert_not_null(ItemRegistrar)
	assert_is(get_node('/root/ItemRegistrar'), ItemRegistrar_t)


func test_store_item():
	var item = Item.new()
	var token = 'items.test.testitem'
	ItemRegistrar.register(token, item)
	assert_eq(ItemRegistrar.get(token), item)


func test_store_items():
	var item1 = Item.new()
	var token1 = 'items.test.testitem'
	var item2 = Item.new()
	var token2 = 'items.test.testitem2'
	ItemRegistrar.register(token1, item1)
	ItemRegistrar.register(token2, item2)
	assert_eq(ItemRegistrar.get(token1), item1)
	assert_eq(ItemRegistrar.get(token2), item2)


func test_dupl_items():
	var item1 = Item.new()
	var token1 = 'items.test.testitem'
	var item2 = Item.new()
	ItemRegistrar.register(token1, item1)
	ItemRegistrar.register(token1, item2)

	# Don't override
	# TODO check for log
	assert_eq(ItemRegistrar.get(token1), item1)

