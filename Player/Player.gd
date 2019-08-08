extends Node

onready var InventoryManager = get_node('/root/InventoryManager')

var inventory := {}

func _ready():
	InventoryManager.connect('offered', self, '_on_Item_offered')
	InventoryManager.connect('given', self, '_on_Item_given')


func _on_Item_taken(items):
	pass


func _on_Item_given(items):
	for item in items:
		inventory[item] = inventory.get(item, 0) + 1
	print('given: ', items, 'inventory: ', inventory)


func _on_Item_requested(items):
	for item in items:
		if not inventory.get(item, 0):
			return false


func _on_Item_offered(items, accept):
	accept.val = true