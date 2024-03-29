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


func stub_decline(items, box):
	box.val = false


func stub_accept(items, box):
	box.val = true


# Just to test project config.
# The rest should use module scoped version
func test_singleton_type():
	assert_not_null(get_node('/root/InventoryManager'))
	assert_is(get_node('/root/InventoryManager'), InventoryManager_t)


### Offer ###
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


func test_default_offer():
	var item = Item.new()
	assert_false(InventoryManager.offer({item: 1}), 'offer returns false')


func test_declined_offer():
	var item = Item.new()
	InventoryManager.connect('offered', self, "stub_decline")
	assert_false(InventoryManager.offer({item: 1}), 'offer returns false')



func test_accepted_offer():
	var item = Item.new()
	InventoryManager.connect('offered', self, "stub_accept")
	assert_true(InventoryManager.offer({item: 1}), 'offer returns true')


### Give ###
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

### Request ###
func test_has_request():
	assert_has_method(InventoryManager, 'request')


func test_has_requested_signal():
	assert_has_signal(InventoryManager, "requested")


func test_requested_signal_no_item():
	assert_signal_not_emitted(InventoryManager, 'requested')
	InventoryManager.request({})
	assert_signal_emitted(InventoryManager, 'requested')


func test_requested_signal_item():
	var item = Item.new()
	InventoryManager.request({item: 1})

	var params = get_signal_parameters(InventoryManager, 'requested')
	assert_not_null(params)

	assert_eq(params[0].keys(), [item])
	assert_eq(params[0][item], 1)


func test_request_default():
	var item = Item.new()
	assert_false(InventoryManager.request({item: 1}), 'request returns false')


func test_declined_request():
	var item = Item.new()
	InventoryManager.connect('requested', self, "stub_decline")
	assert_false(InventoryManager.request({item: 1}), 'request returns false')


func test_accepted_request():
	var item = Item.new()
	InventoryManager.connect('requested', self, "stub_accept")
	assert_true(InventoryManager.request({item: 1}), 'request returns true')


### Take ###
func test_has_take():
	assert_has_method(InventoryManager, 'take')


func test_has_taken_signal():
	assert_has_signal(InventoryManager, "taken")


func test_taken_signal_no_item():
	assert_signal_not_emitted(InventoryManager, 'taken')
	InventoryManager.take({})
	assert_signal_emitted(InventoryManager, 'taken')


func test_taken_signal_item():
	var item = Item.new()
	InventoryManager.take({item: 1})

	var params = get_signal_parameters(InventoryManager, 'taken')
	assert_not_null(params)

	assert_eq(params[0].keys(), [item])
