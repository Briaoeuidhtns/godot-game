extends Node

onready var InventoryManager = get_node('/root/InventoryManager')

var inventory := {}

func _ready():
	InventoryManager.connect('given', self, '_on_Item_given')


func _on_Item_taken(_items, _accept):
	pass


func _on_Item_given(items, _accept):
	for item in items:
		inventory[item] = inventory.get(item, 0) + 1


func _on_Item_requested(items, _accept):
	for item in items:
		if not inventory.get(item, 0):
			return false
