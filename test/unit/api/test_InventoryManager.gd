extends "res://addons/gut/test.gd"
var InventoryManager_t
var InventoryManager
var Item

func before_all():
	InventoryManager_t = preload('res://api/InventoryManager.gd')
	Item = preload('res://abstract/Item.gd')


func before_each():
	InventoryManager = InventoryManager_t.new()
	watch_signals(InventoryManager)


func test_has_offer():
	assert_has_method(InventoryManager, 'offer')


func test_has_offered_signal():
	assert_has_signal(InventoryManager, "offered")


func test_offered_signal_no_item():
	assert_signal_not_emitted(InventoryManager, 'offered')
	InventoryManager.offer({})
	assert_signal_emitted(InventoryManager, 'offered')


func test_offered_signal_item():
	var item = Item.new()
	InventoryManager.offer({item: 1})

	var params = get_signal_parameters(InventoryManager, 'offered')
	assert_not_null(params)

	assert_eq(params[0].keys(), [item])
	assert_eq(params[0][item], 1)

	# Not accepted by default
	assert_eq(params[1].val, false)


func test_has_give():
	assert_has_method(InventoryManager, 'give')


func test_has_given_signal():
	assert_has_signal(InventoryManager, "given")


func test_given_signal_no_item():
	assert_signal_not_emitted(InventoryManager, 'given')
	InventoryManager.give({})
	assert_signal_emitted(InventoryManager, 'given')


func test_given_signal_item():
	var item = Item.new()
	InventoryManager.give({item: 1})

	var params = get_signal_parameters(InventoryManager, 'given')
	assert_not_null(params)

	assert_eq(params[0].keys(), [item])
	assert_eq(params[0][item], 1)
